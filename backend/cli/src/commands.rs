use common::models::NewUser;
use common::repositories::{load_async_db_connection, users};
use regex::Regex;
use serde::Serialize;
use uuid::Uuid;

/// Dumps the results of a query to the console as JSON.
fn dump_results<T: Serialize>(value: &T) {
    let table = serde_json::to_string_pretty(&value).unwrap();
    println!("{}", table);
}

/// ALl the commands related to users.
pub struct UserCommands {}

impl UserCommands {
    pub async fn list(filter: Option<&String>) {
        let mut c = load_async_db_connection().await;
        let mut users = users::UsersRepository::list(&mut c).await.unwrap();
        if let Some(filter) = filter {
            let filter = format!("(?i){}", filter);
            let filter = Regex::new(filter.as_str()).unwrap();
            users = users
                .into_iter()
                .filter(|u| filter.is_match(u.username.as_str()))
                .collect::<Vec<_>>();
        }
        dump_results(&users);
    }

    pub async fn create(username: &String, password: &String, email: &String, is_admin: bool) {
        let password = common::auth::hash_password(&password.to_string()).unwrap();
        let mut c = load_async_db_connection().await;

        let new_user = NewUser {
            username: username.to_owned(),
            password: password,
            email: email.to_owned(),
            is_admin: is_admin,
        };
        let user = users::UsersRepository::create(&mut c, new_user)
            .await
            .unwrap();
        dump_results(&user);
    }

    pub async fn delete(id: &String) {
        let mut c = load_async_db_connection().await;
        let id = Uuid::parse_str(&id).unwrap();
        let n_users = users::UsersRepository::delete(&mut c, id).await.unwrap();
        print!("Deleted {} user(s)", n_users);
    }
}
