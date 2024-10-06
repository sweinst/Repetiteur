use diesel::{connection::SimpleConnection, PgConnection};
use std::{error::Error, path::PathBuf};

/// Run s sql script. If [path] starts with a '/',
/// a relative path is used, return an error
pub fn run_sql_script(path: String, conn: &mut PgConnection) -> Result<(), Box<dyn Error>> {
    let mut d: PathBuf;
    if !path.starts_with('/') {
        d = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
        d = d.join(path);
    } else {
        d = PathBuf::from(path);
    }
    println!("Running SQL script: {:?}", d);
    let sql = std::fs::read_to_string(d)?;
    let _ = conn.batch_execute(sql.as_str());

    Ok(())
}
