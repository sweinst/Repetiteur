use crate::routes::DbConn;
use rocket::response::status::Custom;
use rocket::serde::json::{json, Value};
use rocket_db_pools::Connection;

#[rocket::get("/")]
pub fn sample_main(_db: Connection<DbConn>) -> Result<Value, Custom<Value>> {
    Ok(json!("hello world!"))
}
