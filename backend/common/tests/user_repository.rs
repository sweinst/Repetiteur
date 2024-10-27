use test_env_helpers::*;
pub mod utilities;

#[before_all]
#[cfg(test)]
mod user_repository {
    use crate::utilities::setup_test_data;
    use common::models::{NewUser, UserPreferences};
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
        let prefs = UsersRepository::get_preferences(&mut conn, &guest.id).await;
        assert!(prefs.is_ok());
        let prefs = prefs.unwrap();
        assert_eq!(
            prefs,
            UserPreferences {
                user_id: guest.id,
                number_of_questions_per_session: 50,
                number_of_successes_to_pass: 5,
                proportion_of_failed_questions: 25,
                proportion_of_old_questions: 25,
            }
        );
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
        let password_check = common::auth::check_password(&"password".to_string(), &user.password);
        assert!(password_check.is_ok());
        assert!(user.email == "my_email.com");
        assert!(user.is_admin == false);

        let prefs = UsersRepository::get_preferences(&mut conn, &user.id).await;
        assert!(prefs.is_ok());
        let mut prefs = prefs.unwrap();
        assert_eq!(
            prefs,
            UserPreferences {
                user_id: user.id,
                number_of_questions_per_session: 50,
                number_of_successes_to_pass: 5,
                proportion_of_failed_questions: 25,
                proportion_of_old_questions: 5,
            }
        );

        prefs.number_of_questions_per_session = 100;
        prefs.proportion_of_old_questions = 10;
        let _ = UsersRepository::update_preferences(&mut conn, &prefs).await;
        let prefs = UsersRepository::get_preferences(&mut conn, &user.id).await;
        assert!(prefs.is_ok());
        let prefs = prefs.unwrap();
        assert_eq!(
            prefs,
            UserPreferences {
                user_id: user.id,
                number_of_questions_per_session: 100,
                number_of_successes_to_pass: 5,
                proportion_of_failed_questions: 25,
                proportion_of_old_questions: 10,
            }
        );

        let uid = user.id.clone();
        let deleted = UsersRepository::delete(&mut conn, user.id).await;
        assert!(deleted.is_ok());
        let user = UsersRepository::find_by_username(&mut conn, &"new_user".to_string()).await;
        assert!(user.is_err());
        let prefs = UsersRepository::get_preferences(&mut conn, &uid).await;
        assert!(prefs.is_err());
    }
}
