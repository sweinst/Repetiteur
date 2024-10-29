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
    std::env::vars()
        .into_iter()
        .filter(|(key, _value)| {
            key.starts_with("DATABASE_")
            || key.starts_with("ROCKET_")
            // || key.starts_with("CARGO_")
        })
        .for_each(|(key, value)| {
            eprintln!("=> '{}': '{}'", key, value);
        });
     */
    let _ = rocket::build()
        .mount(
            "/",
            rocket::routes![
                routes::users::sample_main,
                routes::authorization::login,
                routes::authorization::me,
            ],
        )
        // creates a connection pool for the Redis database
        .attach(routes::CacheConn::init())
        // creates a connection pool for the PostgreSQL database
        .attach(routes::DbConn::init())
        .launch()
        .await;
}
