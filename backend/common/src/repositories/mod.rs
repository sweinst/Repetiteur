use diesel::{Connection, PgConnection};
use diesel_async::{AsyncConnection, AsyncPgConnection};
pub mod courses;
pub mod users;
pub mod utils;

/// Creates an asynchronous connection to the database
pub async fn load_async_db_connection() -> AsyncPgConnection {
    let database_url = std::env::var("DATABASE_URL").expect("Cannot load DB url from environment");
    let cnx = AsyncPgConnection::establish(&database_url).await;
    match &cnx {
        Ok(_t) => println!("Connected to Postgres"),
        Err(e) => println!("=> {:?}", e),
    }
    cnx.expect("Cannot connect to Postgres")
}

/// Creates a synchronous connection to the database
pub fn load_db_connection() -> PgConnection {
    let database_url = std::env::var("DATABASE_URL").expect("Cannot load DB url from environment");
    println!("Connecting to {}", database_url);
    PgConnection::establish(&database_url)
        .unwrap_or_else(|_| panic!("Error connecting to {}", database_url))
}

