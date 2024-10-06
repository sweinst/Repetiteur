use test_env_helpers::*;

mod utilities;
#[before_all]
#[cfg(test)]
mod basic_authentication {
    use common::auth::{check_password, hash_password};

    use crate::utilities;

    fn before_all() {
        utilities::setup_test_data();
    }

    #[test]
    fn test_password_hashing() {
        let passwords = vec!["password", "mot75656^&==", "authb8%£\"aa"];
        for password in passwords {
            let hash = hash_password(&password.to_string());
            assert!(hash.is_ok());
            let hash = hash.unwrap();
            assert!(check_password(&password.to_string(), &hash).is_ok());
        }
    }
}
