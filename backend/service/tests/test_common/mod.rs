use reqwest::{blocking::Client, Method, StatusCode};
use serde_json::{json, Value};
use std::process::{Child, Command};
use std::thread;

pub static APP_HOST: &'static str = "http://127.0.0.1:8000";
pub struct Service {
    process: Option<Child>,
}

impl Service {
    pub fn new() -> Self {
        Self { process: None }
    }

    pub fn start(&mut self) {
        if self.process.is_none() {
            println!("> re-initializing the DB");
            test_utilities::setup_test_data();
            println!("> Launching the server");
            Command::new("cargo")
                .args(["run", "--bin", "service"])
                .spawn()
                .map(|child| {
                    self.process = Some(child);
                })
                .expect("Unable to start the server");
            println!("> Waiting for the server");
            thread::sleep(std::time::Duration::from_secs(10));
            println!("> Done");
        }
    }

    pub fn stop(&mut self) {
        println!("> Stopping the server");
        if let Some(server) = self.process.as_mut() {
            server.kill().expect("Unable to kill the server");
        }
        println!("> Done");
    }
}

pub struct TestClient {
    token: String,
}

impl TestClient {
    pub fn new() -> Self {
        Self {
            token: String::new(),
        }
    }

    pub fn try_login(&mut self, username: &str, password: &str) -> StatusCode {
        let client = Client::new();
        let response = client
            .post(&format!("{}/login", APP_HOST))
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
            .request(method, &format!("{}/{}", APP_HOST, path))
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

    pub fn post(&self, path: &str, body: Value) -> Value {
        self.request(Method::POST, path, body)
    }

    pub fn put(&self, path: &str, body: Value) -> Value {
        self.request(Method::PUT, path, body)
    }

    pub fn delete(&self, path: &str) -> Value {
        self.request(Method::DELETE, path, json!({}))
    }
}
