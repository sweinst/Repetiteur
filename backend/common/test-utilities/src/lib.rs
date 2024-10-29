use common::repositories::load_db_connection;
use diesel::connection::SimpleConnection;
use dotenvy::dotenv;

#[allow(dead_code)]
pub fn setup_test_data() {
    dotenv().ok();
    let mut conn = load_db_connection();
    // include the script into the test binary in order to not to have to care about paths
    let sql = include_str!("../data/populate_test.sql");
    let _ = conn
        .batch_execute(sql)
        .expect("Unable to load the test data in the DB");
    eprintln!("> Test data loaded successfully");
}
