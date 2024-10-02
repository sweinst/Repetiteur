use common::auth::{check_password, hash_password};

#[test]
fn test_password_hashing() {
    let passwords = vec![
        "password", 
        "mot75656^&==", 
        "authb8%£\"aa",
        ];
    for password in passwords {
        let hash = hash_password(password.to_string());
        assert!(hash.is_ok());
        let hash = hash.unwrap();
        assert!(check_password(&password.to_string(), &hash).is_ok());
    }
}
