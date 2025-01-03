mod test_common;
use test_env_helpers::*;

#[before_all]
//#[after_all]
#[cfg(test)]
mod authorization {
    use crate::test_common::{start_service, TestClient};
    use reqwest::StatusCode;

    fn before_all() {
        start_service();
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

    #[test]
    fn test_me() {
        let mut client = TestClient::new();

        client.login("admin", "admin");
        let json = client.get("/me");
        assert!(json["username"] == "admin");
        assert!(json["email"] == "admin@doe.com");
        assert!(json["is_admin"].as_bool().unwrap() == true);

        client.login("jd", "password");
        let json = client.get("/me");
        assert!(json["username"] == "jd");
        assert!(json["email"] == "john@doe.com");
        assert!(json["is_admin"].as_bool().unwrap() == false);

        client.login("guest", "guest");
        let json = client.get("/me");
        assert!(json["username"] == "guest");
        assert!(json["email"] == "guest@doe.com");
        assert!(json["is_admin"].as_bool().unwrap() == false);
    }
}
