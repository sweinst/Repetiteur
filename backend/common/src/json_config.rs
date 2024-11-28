use std::path::Path;


#[derive(Clone, Debug)]
pub struct JsonConfig {
    config: serde_json::Value,
}

impl JsonConfig {
    // TODO: re-implement using a macro in order to avoid repetitions
    pub fn from_string (json: &str) -> Result<JsonConfig, Box<dyn std::error::Error>> {
        let json_config = serde_json::from_str::<serde_json::Value>(&json)?;
        Ok(JsonConfig { config: json_config })
    }

    pub fn from_file (path: &Path) -> Result<JsonConfig, Box<dyn std::error::Error>> {
        let json = std::fs::read_to_string(path)?;
        JsonConfig::from_string(json.as_str())
    }

    pub fn get_bool(&self, key: &str, default: bool) -> bool {
        self.config.get(key)
            .and_then(|value| value.as_bool())
            .unwrap_or(default)
    }

    pub fn get_string(&self, key: &str, default: &str) -> String {
        self.config.get(key)
            .and_then(|value| value.as_str())
            .unwrap_or(default)
            .to_string()
    }

    pub fn get_i64(&self, key: &str, default: i64) -> i64 {
        self.config.get(key)
            .and_then(|value| value.as_i64())
            .unwrap_or(default)
    }

    pub fn get_u64(&self, key: &str, default: u64) -> u64 {
        self.config.get(key)
            .and_then(|value| value.as_u64())
            .unwrap_or(default)
    }

    pub fn get_f64(&self, key: &str, default: f64) -> f64 {
        self.config.get(key)
            .and_then(|value| value.as_f64())
            .unwrap_or(default)
    }
}