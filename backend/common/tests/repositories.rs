use test_env_helpers::*;

mod utilities;

#[before_all]
#[cfg(test)]
mod user_repositories {
    use common::repositories::load_async_db_connection;
    use common::repositories::users::UsersRepository;

    use crate::utilities;

    fn before_all() {
        utilities::setup_test_data();
    }

    #[tokio::test]
    async fn test_list_users() {
        let mut conn = load_async_db_connection().await;
        let users = UsersRepository::list(&mut conn).await;
        assert!(users.is_ok());
        let users = users.unwrap();
        assert!(users.len() == 3);
        assert!(users[0].username == "admin");
        assert!(users[1].username == "guest");
        assert!(users[2].username == "jd");
    }
}
