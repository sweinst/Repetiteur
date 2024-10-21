use crate::models::*;
use crate::schema::*;
use diesel::prelude::*;
use diesel_async::{AsyncPgConnection, RunQueryDsl};
use uuid::Uuid;

/// Defines helpers for getting/setting course information in the database repository
/// Allows to list, find, create and delete courses
pub struct CoursesRepository {}

impl CoursesRepository {
    // list all courses accessible to a specific user
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

    /// Gets all lessons and questions for a course
    pub async fn get(
        c: &mut AsyncPgConnection,
        course_uuid: Uuid,
    ) -> QueryResult<Vec<(Lesson, Vec<Question>)>> {
        let lessons = lessons::table
            .filter(lessons::course_id.eq(course_uuid))
            .select(Lesson::as_select())
            .load::<Lesson>(c)
            .await?;
        let questions = Question::belonging_to(&lessons)
            .select(Question::as_select())
            .load(c)
            .await?;

        let questions = questions
            .grouped_by(&lessons)
            .into_iter()
            .zip(lessons)
            .map(|(questions, lesson)| (lesson, questions))
            .collect::<Vec<(Lesson, Vec<Question>)>>();
        Ok(questions)
    }

    /// Deletes a course from the database
    pub async fn delete(c: &mut AsyncPgConnection, id: Uuid) -> QueryResult<usize> {
        // TODO: unit test for deletion
        let lesson_ids = lessons::table
            .filter(lessons::course_id.eq(id))
            .select(lessons::id)
            .load::<Uuid>(c)
            .await?;
        let question_ids = questions::table
            .filter(questions::lesson_id.eq_any(&lesson_ids))
            .select(questions::id)
            .load::<Uuid>(c)
            .await?;

        diesel::delete(questionhistory::table)
            .filter(questionhistory::question_id.eq_any(&question_ids))
            .execute(c)
            .await?;
        diesel::delete(lessonhistory::table)
            .filter(lessonhistory::lesson_id.eq_any(&lesson_ids))
            .execute(c)
            .await?;
        diesel::delete(courseusers::table.filter(courseusers::course_id.eq(id)))
            .execute(c)
            .await?;
        diesel::delete(questions::table)
            .filter(questions::id.eq_any(&question_ids))
            .execute(c)
            .await?;
        diesel::delete(lessons::table)
            .filter(lessons::id.eq_any(&lesson_ids))
            .execute(c)
            .await?;
        diesel::delete(courses::table.find(id)).execute(c).await
    }
}
