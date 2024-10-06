use diesel::{connection::SimpleConnection, PgConnection};
use std::{error::Error, path::PathBuf};

/// Run s sql script.
/// if [path] is relative, it will be resolved relative to the project root.
pub fn run_sql_script(path: String, conn: &mut PgConnection) -> Result<(), Box<dyn Error>> {
    let mut path = PathBuf::from(path);
    if path.is_relative() {
        path = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join(path);
    }
    println!("> Running SQL script: {:?}", path);
    let sql = std::fs::read_to_string(path)?;
    let _ = conn.batch_execute(sql.as_str());

    Ok(())
}
