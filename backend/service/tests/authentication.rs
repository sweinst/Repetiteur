mod test_common;
use test_env_helpers::*;

#[before_all]
#[after_all]
#[cfg(test)]
mod authorization {
    use crate::test_common::{Service, TestClient};
    use reqwest::StatusCode;
    use std::sync::{LazyLock, Mutex};

    pub static SERVICE: LazyLock<Mutex<Service>> = LazyLock::new(|| Mutex::new(Service::new()));

    fn before_all() {
        SERVICE.lock().unwrap().start();
    }

    fn after_all() {
        SERVICE.lock().unwrap().stop();
    }

    #[test]
    fn test_login() {
        let mut client = TestClient::new();

        // valid user & password
        client.login("admin", "admin");

        // invalid user
        assert!(client.try_login("foo", "12345") == StatusCode::UNAUTHORIZED);

        // invalid password
        assert!(client.try_login("admin", "12345") == StatusCode::UNAUTHORIZED);
    }
}
