use crate::models::*;
use crate::schema::*;
use diesel::prelude::*;
use diesel_async::{AsyncPgConnection, RunQueryDsl};
use uuid::Uuid;

/// Defines helpers for getting/setting course informtion in the database repository
/// Allows to list, find, create and delete courses
pub struct CoursesRepository {}

impl CoursesRepository {
    // list all courses accessible to aspecific user
    pub async fn list(
        conn: &mut AsyncPgConnection,
        user: &User,
    ) -> QueryResult<Vec<(Course, RoleCode)>> {
        // admins have access to all courses
        if user.is_admin {
            let courses = courses::table
                .order_by(courses::name)
                .load::<Course>(conn)
                .await;
            return courses.map(|c| c.into_iter().map(|c| (c, RoleCode::Admin)).collect());
        }

        courseusers::table
            .filter(courseusers::user_id.eq(user.id))
            .inner_join(courses::table)
            .inner_join(roles::table)
            .order_by(courses::name)
            .select((courses::all_columns, roles::code))
            .load::<(Course, RoleCode)>(conn)
            .await
    }
    /// Finds a course by its name
    pub async fn find_by_name(c: &mut AsyncPgConnection, name: &String) -> QueryResult<Course> {
        courses::table
            .filter(courses::name.eq(name))
            .get_result(c)
            .await
    }

    /// Finds a course by its id
    pub async fn find_by_id(c: &mut AsyncPgConnection, id: &Uuid) -> QueryResult<Course> {
        courses::table
            .filter(courses::id.eq(id))
            .get_result(c)
            .await
    }

    /// Creates a new course in the database
    pub async fn create(c: &mut AsyncPgConnection, new_course: NewCourse) -> QueryResult<Course> {
        diesel::insert_into(courses::table)
            .values(new_course)
            .get_result::<Course>(c)
            .await
    }

    /// Deletes a course from the database
    pub async fn delete(c: &mut AsyncPgConnection, id: Uuid) -> QueryResult<usize> {
        // todo: delete all corresponmding lessons and questions
        // todo: delete user association
        // todo delete question and lesson history
        diesel::delete(courses::table.find(id)).execute(c).await
    }
}
