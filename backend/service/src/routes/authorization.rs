use crate::routes::{server_error, CacheConn, DbConn};
use common::auth::{authorize_user, Credentials};
use common::repositories::users::UsersRepository;
use rocket::http::Status;
use rocket::response::status::Custom;
use rocket::serde::json::{json, Json, Value};
use rocket_db_pools::deadpool_redis::redis::AsyncCommands;
use rocket_db_pools::Connection;

#[rocket::post("/login", format = "json", data = "<credentials>")]
pub async fn login(
    mut db: Connection<DbConn>,
    mut cache: Connection<CacheConn>,
    credentials: Json<Credentials>,
) -> Result<Value, Custom<Value>> {
    let user = UsersRepository::find_by_username(&mut db, &credentials.username)
        .await
        .map_err(|e| server_error(e.into()))?;

    let session_id = authorize_user(&user, credentials.into_inner())
        .map_err(|_| Custom(Status::Unauthorized, json!("Wrong credentials")))?;
    // cache it in Redis
    // TODO: set the value with JSON format
    cache
        .set_ex::<String, String, ()>(
            // key
            format!("sessions/{}", session_id),
            // value
            user.id.to_string(),
            // expiration time in seconds
            3 * 60 * 60,
        )
        .await
        .map_err(|e| server_error(e.into()))?;
    Ok(json!({
        "token": session_id,
    }))
}

/* #[rocket::get("/me")]
use common::models::User;

pub fn me(user: User) -> Value {
    json!(user)
}
 */
