use rocket::http::Status;
use rocket::response::status::Custom;
use rocket::serde::json::{json, Value};
use std::error::Error;

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
