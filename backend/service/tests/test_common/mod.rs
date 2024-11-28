use dotenvy::dotenv;
use libc::atexit;
use reqwest::{blocking::Client, Method, StatusCode};
use serde_json::{json, Value};
use std::process::{Child, Command};
use std::sync::Mutex;
use std::thread;
use std::path::PathBuf;

struct Service {
    process: Option<Child>,
}

impl Service {
    pub fn new() -> Self {
        Self { 
            process: None,
        }
    }

    pub fn start(&mut self) {
        if self.process.is_none() {
            let mut exe_path = std::env::current_exe().unwrap();
            assert!(exe_path.pop());
            if exe_path.ends_with("deps") {
                assert!(exe_path.pop());
            }
            let mut configs_path = PathBuf::from(std::env::var("CARGO_MANIFEST_DIR").unwrap());
            configs_path.pop();   

            std::env::vars().into_iter().for_each(|(key, value)| {
                eprintln!("{}: {}", key, value);
            });

            eprintln!("> re-initializing the DB");
            test_utilities::setup_test_data();
            eprintln!("> Launching the server");
            //Command::new(path)
            Command::new("cargo")
                .current_dir(configs_path)
                .args(["run", "--bin", "service"])
                .spawn()
                .map(|child| {
                    self.process = Some(child);
                })
                .expect("Unable to start the server");
            eprintln!("> Waiting for the server");
            thread::sleep(std::time::Duration::from_secs(20));
            eprintln!("> Done");
        }
    }

    pub fn stop(&mut self) {
        eprintln!("> Stopping the server");
        if let Some(server) = self.process.as_mut() {
            server.kill().expect("Unable to kill the server");
            server.wait().expect("Unable to wait for the server");
        }
        eprintln!("> Done");
    }
}

/// This function ensures that the service is started only once
/// and shut down when the program exits.
pub fn start_service() {
    static SERVICE: Mutex<Option<Service>> = Mutex::new(None);
    if SERVICE.lock().unwrap().is_none() {
        let mut service = Service::new();
        service.start();
        *SERVICE.lock().unwrap() = Some(service);

        extern "C" fn kill() {
            SERVICE.lock().unwrap().as_mut().unwrap().stop();
        }
        unsafe { atexit(kill) };
    }
}

pub struct TestClient {
    token: String,
    url: String,
}

impl TestClient {
    pub fn new() -> Self {
        dotenv().ok();
        let port = std::env::var("TEST_ROCKET_PORT").unwrap_or("8000".to_string());
        let url = format!("http://localhost:{}", port);
        Self {
            token: String::new(),
            url: url,
        }
    }

    pub fn try_login(&mut self, username: &str, password: &str) -> StatusCode {
        let client = Client::new();
        let response = client
            .post(&format!("{}/login", self.url))
            .json(&json!({
                "username": username,
                "password": password,
            }))
            .send()
            .expect("Unable to perform the login request");
        if response.status() != StatusCode::OK {
            return response.status();
        }
        let json = response
            .json::<Value>()
            .expect("Unable to parse the login response");
        assert!(json["token"].is_string());
        assert_eq!(json["token"].as_str().unwrap().len(), 128);
        self.token = json["token"].as_str().unwrap().to_string();
        StatusCode::OK
    }

    pub fn login(&mut self, username: &str, password: &str) {
        let status = self.try_login(username, password);
        assert_eq!(status, StatusCode::OK);
    }

    pub fn request(&self, method: Method, path: &str, body: Value) -> Value {
        let client = Client::new();
        let response = client
            .request(method, &format!("{}/{}", self.url, path))
            .header("Authorization", format!("Bearer {}", self.token))
            .json(&body)
            .send()
            .expect("Unable to perform the request");
        assert_eq!(response.status(), StatusCode::OK);
        response
            .json::<Value>()
            .expect("Unable to parse the response")
    }

    pub fn get(&self, path: &str) -> Value {
        self.request(Method::GET, path, json!({}))
    }

    // TODO: remove the #[allow(dead_code)] attribute
    #[allow(dead_code)]
    pub fn post(&self, path: &str, body: Value) -> Value {
        self.request(Method::POST, path, body)
    }

    // TODO: remove the #[allow(dead_code)] attribute
    #[allow(dead_code)]
    pub fn put(&self, path: &str, body: Value) -> Value {
        self.request(Method::PUT, path, body)
    }

    // TODO: remove the #[allow(dead_code)] attribute
    #[allow(dead_code)]
    pub fn delete(&self, path: &str) -> Value {
        self.request(Method::DELETE, path, json!({}))
    }
}
