use crate::routes::{server_error, CacheConn, DbConn, RocketUser};
use common::auth::{authorize_user, Credentials};
use common::repositories::users::UsersRepository;
use rocket::http::Status;
use rocket::response::status::Custom;
use rocket::serde::json::{json, Json, Value};
use rocket::time::{Duration, OffsetDateTime};
use rocket::State;
use rocket_db_pools::deadpool_redis::redis::AsyncCommands;
use rocket_db_pools::Connection;

use super::AppConfig;

#[rocket::post("/login", format = "json", data = "<credentials>")]
pub async fn login(
    config: &State<AppConfig>,
    mut db: Connection<DbConn>,
    mut cache: Connection<CacheConn>,
    credentials: Json<Credentials>,
) -> Result<Value, Custom<Value>> {
    let session_duration_seconds = config.inner().config.get_u64("session_duration_seconds", 12 * 60 * 60);
    let user = UsersRepository::find_by_username(&mut db, &credentials.username)
        .await
        .map_err(|e| {
            rocket::error!("Error finding user '{}' ({})", credentials.username, e);
            return Custom(Status::Unauthorized, json!("Wrong credentials"));
        })?;

    let session_id = authorize_user(&user, &credentials)
        .map_err(|_| Custom(Status::Unauthorized, json!("Wrong credentials")))?;
    // cache it in Redis
    // TODO: set the value with JSON format
    let expiration = OffsetDateTime::now_utc() + Duration::seconds(session_duration_seconds as i64);
    cache
        .set_ex::<String, String, ()>(
            // key
            format!("sessions/{}", session_id),
            // value
            user.id.to_string(),
            // expiration time in seconds
            session_duration_seconds,
        )
        .await
        .map_err(|e| server_error(e.into()))?;
    rocket::info!("User '{}' logged in (session will expire at: {})", credentials.username, expiration);
    Ok(json!({
        "token": session_id,
        "expiration": expiration.to_string(),
    }))
}

#[rocket::get("/me")]
pub fn me(user: RocketUser) -> Value {
    json!(user.0)
}
