use std::path::PathBuf;

/// Run s sql script. If [path] starts with a '/',
/// a relative path is used, return an error
pub fn runSQLScript(path: String) -> Result<(), Box<dyn std::error::Error>> {
    let mut d: PathBuf;
    if (!path.starts_with('/')) {
        d = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
        d.push("test/populate_test.sql");
    } else {
        d = PathBuf::new!(path);
    }
    std::fs::read_to_string(d)?;
}
