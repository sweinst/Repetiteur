use std::path::Path;
use common::json_config::JsonConfig;
use dotenvy::dotenv;
use rocket_db_pools::Database;
use routes::AppConfig;

pub mod routes;

fn show_config(config: &JsonConfig) {
    // allow to see the environment variables
    // required: DATABASE_URL (diesel) and ROCKET_DATABASES (rocket)
    if config.get_bool("show_env", false) {
        std::env::vars()
        .into_iter()
        .for_each(|(key, value)| {
            rocket::info!(" '{}' => '{}'", key, value);
        });
    }
}

#[rocket::main]
async fn main() {
    // allow to read extra environment variables from a .env file
    dotenv().ok();
    // read the config file
    let config = 
        JsonConfig::from_file(Path::new("config.json"))
        .map_err(|err| panic!("Unable to read the config file 'config.json': {}", err))
        .unwrap();
    // dump the environment variables if required
    show_config(&config);

    let _ = rocket::build()
        // shared config
        .manage(AppConfig { config })
        // routes
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
