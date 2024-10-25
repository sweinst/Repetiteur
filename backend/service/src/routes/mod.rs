pub mod users;

/// An asynchronous database connection obtained from the database connection pool.
#[derive(rocket_db_pools::Database)]
#[database("postgres")]
pub struct DbConn(rocket_db_pools::diesel::PgPool);

/// An asynchronous Redis connection obtained from the Redis connection pool.
#[derive(rocket_db_pools::Database)]
#[database("redis")]
pub struct CacheConn(rocket_db_pools::deadpool_redis::Pool);
