use common::repositories::{load_db_connection, utils::run_sql_script};
use dotenvy::dotenv;

pub fn setup_test_data() {
    dotenv().ok();
    let mut conn = load_db_connection();
    run_sql_script("tests/data/populate_test.sql".to_string(), &mut conn)
        .expect("Unable to load the test data in the DB");
}
