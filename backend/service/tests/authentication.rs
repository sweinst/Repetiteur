use test_env_helpers::*;

#[before_all]
#[after_all]
#[cfg(test)]
mod authorization {
    use reqwest::{blocking::Client, StatusCode};
    use serde_json::{json, Value};
    use std::{
        process::{Child, Command},
        thread,
    };

    pub static APP_HOST: &'static str = "http://127.0.0.1:8000";
    pub static mut SERVER_PROCESS: Option<Child> = None;

    fn before_all() {
        // re-initialize the DB
        test_utilities::setup_test_data();
        // launch the server
        println!("> Launching the server");
        Command::new("cargo")
            .args(["run", "--bin", "service"])
            .spawn()
            .map(|child| unsafe {
                // unsafe because we are using a mutable static variable which can be accessed from multiple threads
                // but it won't ne the case here as this is run before all tests
                SERVER_PROCESS = Some(child);
            })
            .expect("Unable to start the server");
        // let's wait for the server to start
        println!("> Waiting for the server");
        thread::sleep(std::time::Duration::from_secs(10));
    }

    fn after_all() {
        // stop the server
        println!("> Stopping the server");
        if let Some(server) = unsafe { SERVER_PROCESS.as_mut() } {
            server.kill().expect("Unable to kill the server");
        }
    }

    #[test]
    fn test_login() {
        let client = Client::new();
        let response = client
            .post(&format!("{}/login", APP_HOST))
            .json(&json!({
                "username": "admin",
                "password": "admin"
            }))
            .send()
            .expect("Unable to perform the login request");
        assert_eq!(response.status(), StatusCode::OK);
        let json = response
            .json::<Value>()
            .expect("Unable to parse the login response");
        assert!(json["token"].is_string());
        assert_eq!(json["token"].as_str().unwrap().len(), 128);

        // invalid user
        let response = client
            .post(format!("{}/login", APP_HOST))
            .json(&json!({
                "username": "foo",
                "password": "12345",
            }))
            .send()
            .unwrap();
        assert_eq!(response.status(), StatusCode::UNAUTHORIZED);

        // invalid password
        let response = client
            .post(format!("{}/login", APP_HOST))
            .json(&json!({
                "username": "admin",
                "password": "12345",
            }))
            .send()
            .unwrap();
        assert_eq!(response.status(), StatusCode::UNAUTHORIZED);
    }
}
