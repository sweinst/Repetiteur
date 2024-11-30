#[cfg(test)]
mod json_config {
    use common::json_config::JsonConfig;

    #[test]
    fn test_json_config() {
        let json = "
        {
            \"string\": \"value1\",
            \"int\": -2,
            \"unsigned\": 2,
            \"float\": 3.1416,
            \"bool\": true
        }";

        let config = JsonConfig::from_string(json);
        assert!(config.is_ok());
        let config = config.unwrap();

        assert_eq!(config.get_string("string", "default"), "value1".to_string());
        assert_eq!(config.get_string("unavailable", "default"), "default".to_string());
        assert_eq!(config.get_i64("int", 0), -2);
        assert_eq!(config.get_i64("unavailable", -4), -4);
        assert_eq!(config.get_i64("string", -4), -4);
        assert_eq!(config.get_u64("unsigned", 0), 2);
        assert_eq!(config.get_u64("int", 0), 0);
        assert_eq!(config.get_f64("float", 0.0), 3.1416);
        assert_eq!(config.get_f64("int", 0.0), -2.0);
        assert_eq!(config.get_bool("bool", false), true);
    }
}
