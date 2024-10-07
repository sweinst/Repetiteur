use test_env_helpers::*;

mod utilities;

#[before_all]
#[cfg(test)]
mod repositories {
    use crate::utilities::setup_test_data;
    use common::models::NewUser;
    use common::repositories::courses::CoursesRepository;
    use common::repositories::load_async_db_connection;
    use common::repositories::users::UsersRepository;

    fn before_all() {
        setup_test_data();
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

    #[tokio::test]
    async fn test_find_user() {
        let mut conn = load_async_db_connection().await;
        let guest = UsersRepository::find_by_username(&mut conn, &"guest".to_string()).await;
        assert!(guest.is_ok());
        let guest = guest.unwrap();
        let guest2 = UsersRepository::find_by_id(&mut conn, &guest.id).await;
        assert!(guest2.is_ok());
        let guest2 = guest2.unwrap();
        assert!(guest2.username == "guest");
    }

    #[tokio::test]
    async fn test_create_delete_user() {
        let mut conn = load_async_db_connection().await;
        let new_user = NewUser {
            username: "new_user".to_string(),
            password: "password".to_string(),
            email: "my_email.com".to_string(),
            is_admin: false,
        };
        let user = UsersRepository::create(&mut conn, new_user).await;
        assert!(user.is_ok());
        let user = UsersRepository::find_by_username(&mut conn, &"new_user".to_string()).await;
        assert!(user.is_ok());
        let user = user.unwrap();
        assert!(user.username == "new_user");
        assert!(user.password == "password");
        assert!(user.email == "my_email.com");
        assert!(user.is_admin == false);
        let deleted = UsersRepository::delete(&mut conn, user.id).await;
        assert!(deleted.is_ok());
        let user = UsersRepository::find_by_username(&mut conn, &"new_user".to_string()).await;
        assert!(user.is_err());
    }

    #[tokio::test]
    async fn test_list_courses_for_user() {
        let mut conn = load_async_db_connection().await;

        let user = UsersRepository::find_by_username(&mut conn, &"guest".to_string()).await;
        assert!(user.is_ok());
        let user = user.unwrap();
        let courses = CoursesRepository::list(&mut conn, &user).await;
        assert!(courses.is_ok());
        let courses = courses.unwrap();
        assert!(courses.len() == 2);

        let user = UsersRepository::find_by_username(&mut conn, &"admin".to_string()).await;
        assert!(user.is_ok());
        let user = user.unwrap();
        let courses = CoursesRepository::list(&mut conn, &user).await;
        assert!(courses.is_ok());
        let courses = courses.unwrap();
        assert!(courses.len() == 2);

        let user = UsersRepository::find_by_username(&mut conn, &"jd".to_string()).await;
        assert!(user.is_ok());
        let user = user.unwrap();
        let courses = CoursesRepository::list(&mut conn, &user).await;
        assert!(courses.is_ok());
        let courses = courses.unwrap();
        assert!(courses.len() == 1);
    }
}
