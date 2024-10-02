use crate::models::User;
use argon2::password_hash::rand_core::OsRng;
use argon2::password_hash::{Error, SaltString};
use argon2::{Argon2, PasswordHash, PasswordHasher, PasswordVerifier};
use rand::distributions::Alphanumeric;
use rand::Rng;

/// Credentials for user authorization
#[derive(serde::Deserialize)]
pub struct Credentials {
    pub username: String,
    pub password: String,
}

/// Hashes a password using Argon2
pub fn hash_password(password: &String) -> Result<String, Error> {
    let salt = SaltString::generate(OsRng);
    let argon2 = Argon2::default();
    let hashed_password = argon2.hash_password(password.as_bytes(), &salt)?;

    Ok(hashed_password.to_string())
}

/// checks if a password matches a hash
pub fn check_password(password: &String, hash: &String) -> Result<bool, Error> {
    let argon2 = Argon2::default();
    let db_hash = PasswordHash::new(&hash)?;
    argon2.verify_password(password.as_bytes(), &db_hash)?;
    Ok(true)
}

/// Checks the user password and returns a session id
pub fn authorize_user(user: &User, credentials: Credentials) -> Result<String, Error> {
    check_password(&credentials.password, &user.password)?;
    let session_id = rand::thread_rng()
        .sample_iter(&Alphanumeric)
        .take(128)
        .map(char::from)
        .collect();

    Ok(session_id)
}
