use dotenvy::dotenv;
use rocket_db_pools::Database;

pub mod routes;

#[rocket::main]
async fn main() {
    // allow to read extra environment variables from a .env file
    dotenv().ok();
    /*
    // allow to see the environment variables
    // required: DATABASE_URL and ROCKET_DATABASES
    for (key, value) in std::env::vars() {
        println!("=> '{}': '{}'", key, value);
    }
     */
    let _ = rocket::build()
        .mount("/", rocket::routes![routes::users::sample_main,])
        .attach(routes::CacheConn::init())
        .attach(routes::DbConn::init())
        .launch()
        .await;
}
