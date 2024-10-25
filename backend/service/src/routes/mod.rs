use common::models::User;
use common::repositories::users::UsersRepository;
use rocket::http::Status;
use rocket::request::{FromRequest, Outcome};
use rocket::response::status::Custom;
use rocket::serde::json::{json, Value};
use rocket::Request;
use rocket_db_pools::deadpool_redis::redis::AsyncCommands;
use rocket_db_pools::Connection;
use std::error::Error;
use uuid::Uuid;

pub mod authorization;
pub mod users;

/// An asynchronous database connection obtained from the database connection pool.
#[derive(rocket_db_pools::Database)]
#[database("postgres")]
pub struct DbConn(rocket_db_pools::diesel::PgPool);

/// An asynchronous Redis connection obtained from the Redis connection pool.
#[derive(rocket_db_pools::Database)]
#[database("redis")]
pub struct CacheConn(rocket_db_pools::deadpool_redis::Pool);

/// Helper function to return a 500 error
pub fn server_error(e: Box<dyn Error>) -> Custom<Value> {
    rocket::error!("{}", e);
    Custom(Status::InternalServerError, json!("Error"))
}

/// We need to define a new type RocketUser which will be exactly the same than a User but for which we can implement the FromRequest trait
#[allow(dead_code)]
pub struct RocketUser(User);

/// allow Rocket to transform the session id inside the Authorization header into a User
#[rocket::async_trait]
impl<'r> FromRequest<'r> for RocketUser {
    type Error = ();

    async fn from_request(req: &'r Request<'_>) -> Outcome<Self, Self::Error> {
        // Authorization: Bearer SESSION_ID_128_CHARACTERS_LONG
        let session_header = req
            .headers()
            .get_one("Authorization")
            .map(|v| v.split_whitespace().collect::<Vec<_>>())
            .filter(|v| v.len() == 2 && v[0] == "Bearer");
        if let Some(header_value) = session_header {
            let mut cache = req
                .guard::<Connection<CacheConn>>()
                .await
                .expect("Cannot connect to Redis in request guard");
            let mut db = req
                .guard::<Connection<DbConn>>()
                .await
                .expect("Cannot connect to Postgres in request guard");

            let result = cache
                .get::<String, String>(format!("sessions/{}", header_value[1]))
                .await;
            if let Ok(user_id) = result {
                if let Ok(user_id) = Uuid::parse_str(&user_id.to_string()) {
                    if let Ok(user) = UsersRepository::find_by_id(&mut db, &user_id).await {
                        return Outcome::Success(RocketUser(user.clone()));
                    }
                }
            }
        }

        rocket::error!("Invalid or missing session ID");
        Outcome::Error((Status::Unauthorized, ()))
    }
}
