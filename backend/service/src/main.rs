use dotenvy::dotenv;
use rocket_db_pools::{Connection, Database};
use routes::DbConn;

pub mod routes;

#[rocket::get("/")]
fn sample_main(_db: Connection<DbConn>) {
    println!("Hello, world!");
}

#[rocket::main]
async fn main() {
    dotenv().ok();
    for (key, value) in std::env::vars() {
        println!("=> '{}': '{}'", key, value);
    }
    let _ = rocket::build()
        .mount("/", rocket::routes![sample_main,])
        .attach(routes::CacheConn::init())
        .attach(routes::DbConn::init())
        .launch()
        .await;
}
