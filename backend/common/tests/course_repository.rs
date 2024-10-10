use test_env_helpers::*;
mod utilities;

#[before_all]
#[cfg(test)]
mod course_repository {
    use crate::utilities::setup_test_data;
    use common::models::RoleCode;
    use common::repositories::courses::CoursesRepository;
    use common::repositories::load_async_db_connection;
    use common::repositories::users::UsersRepository;

    fn before_all() {
        setup_test_data();
    }

    #[tokio::test]
    async fn test_list_courses_for_user() {
        // NB: I assert that the courses are in the order of their creation (so sorted by the internal row id)
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
        // NB: I assert that the courses are in the order of their creation (so sorted by the internal row id)

        let mut conn = load_async_db_connection().await;
        let course = CoursesRepository::find_by_name(&mut conn, &"Español 1".to_string()).await;
        assert!(course.is_ok());
        let course_contents = CoursesRepository::get(&mut conn, course.unwrap().id).await;
        assert!(course_contents.is_ok());
        let course_contents = course_contents.unwrap();
        //still adding new lessons
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
