use test_env_helpers::*;

mod utilities;

#[before_all]
#[cfg(test)]
mod repositories {
    use crate::utilities::setup_test_data;
    use common::models::{NewUser, RoleCode, UserPreferences};
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
        assert!(user.password == "password");
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
        assert!(courses[0].0.name == "Español 1");
        assert!(courses[0].1 == RoleCode::Viewer);
        assert!(courses[1].0.name == "Español 2");
        assert!(courses[1].1 == RoleCode::Viewer);

        let user = UsersRepository::find_by_username(&mut conn, &"admin".to_string()).await;
        assert!(user.is_ok());
        let user = user.unwrap();
        let courses = CoursesRepository::list(&mut conn, &user).await;
        assert!(courses.is_ok());
        let courses = courses.unwrap();
        assert!(courses.len() == 2);
        assert!(courses[0].0.name == "Español 1");
        assert!(courses[0].1 == RoleCode::Admin);
        assert!(courses[1].0.name == "Español 2");
        assert!(courses[1].1 == RoleCode::Admin);

        let user = UsersRepository::find_by_username(&mut conn, &"jd".to_string()).await;
        assert!(user.is_ok());
        let user = user.unwrap();
        let courses = CoursesRepository::list(&mut conn, &user).await;
        assert!(courses.is_ok());
        let courses = courses.unwrap();
        assert!(courses.len() == 1);
        assert!(courses[0].0.name == "Español 2");
        assert!(courses[0].1 == RoleCode::Editor);
    }

    #[tokio::test]
    async fn test_list_get_course() {
        let mut conn = load_async_db_connection().await;
        let course = CoursesRepository::find_by_name(&mut conn, &"Español 1".to_string()).await;
        assert!(course.is_ok());
        let course_contents = CoursesRepository::get(&mut conn, course.unwrap().id).await;
        assert!(course_contents.is_ok());
        let course_contents = course_contents.unwrap();
        //still ddding new lessons
        assert!(course_contents.len() >= 19);

        assert!(course_contents[0].0.name == "S01E01");
        assert!(course_contents[0].0.description == "Saying how you are feeling");
        assert!(course_contents[0].1.len() == 8);
        assert!(course_contents[0].1[0].question == "Hi!");
        assert!(course_contents[0].1[0].answer == "¡Hola!");
        assert!(course_contents[0].1[6].question == "Fantastic!");
        assert!(course_contents[0].1[6].answer == "¡Fenomenal!");

        assert!(course_contents[12].0.name == "S01E13");
        assert!(course_contents[12].0.description == "Directions");
        assert!(course_contents[12].1.len() == 15);
        assert!(course_contents[12].1[3].question == "the main square");
        assert!(course_contents[12].1[3].answer == "la plaza mayor");
        assert!(course_contents[12].1[13].question == "Is the museum far from here?");
        assert!(course_contents[12].1[13].answer == "¿El museo está lejos de aquí?");
    }
}
