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
    /// Lists all users in the database. Filtering can be done by providing a regex.
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

    /// Creates a new user in the database.
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

    /// Updates an existing user in the database.
    pub async fn update(
        username: &String,
        new_username: Option<&String>,
        password: Option<&String>,
        email: Option<&String>,
        is_admin: Option<&bool>,
    ) {
        let mut c = load_async_db_connection().await;
        let user = users::UsersRepository::find_by_username(&mut c, username)
            .await
            .unwrap();
        let n_updates =
            users::UsersRepository::update(&mut c, &user, new_username, password, email, is_admin)
                .await
                .unwrap();
        let user_name = match new_username {
            Some(new_username) => new_username.clone(),
            None => user.username.clone(),
        };
        println!("Updated {} user(s)", n_updates);
        let user = users::UsersRepository::find_by_username(&mut c, &user_name)
            .await
            .unwrap();
        dump_results(&user);
    }

    //// Deletes a user by its ID.
    pub async fn delete(id: &String) {
        let mut c = load_async_db_connection().await;
        let id = Uuid::parse_str(&id).unwrap();
        let n_users = users::UsersRepository::delete(&mut c, id).await.unwrap();
        print!("Deleted {} user(s)", n_users);
    }
}
