#![allow(unused)]

use crate::schema::*;
use chrono::NaiveDateTime;
use diesel::deserialize::{FromSql, FromSqlRow};
use diesel::expression::AsExpression;
use diesel::pg::{Pg, PgValue};
use diesel::prelude::*;
use diesel::serialize::ToSql;
use diesel::sql_types::Text;
use serde::{Deserialize, Serialize};
use std::io::Write;
use std::str::FromStr;
use uuid::Uuid;

/// This enum is used to define the role of a user.
#[derive(AsExpression, Debug, FromSqlRow, PartialEq)]
#[diesel(sql_type=Text)]
pub enum RoleCode {
    Admin,
    Editor,
    Viewer,
}

impl ToString for RoleCode {
    fn to_string(&self) -> String {
        match self {
            RoleCode::Admin => String::from("admin"),
            RoleCode::Editor => String::from("editor"),
            RoleCode::Viewer => String::from("viewer"),
        }
    }
}

impl FromStr for RoleCode {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s {
            "admin" => Ok(RoleCode::Admin),
            "editor" => Ok(RoleCode::Editor),
            "viewer" => Ok(RoleCode::Viewer),
            _ => Err(()),
        }
    }
}

impl FromSql<Text, Pg> for RoleCode {
    fn from_sql(value: PgValue<'_>) -> diesel::deserialize::Result<Self> {
        match value.as_bytes() {
            b"admin" => Ok(RoleCode::Admin),
            b"editor" => Ok(RoleCode::Editor),
            b"viewer" => Ok(RoleCode::Viewer),
            _ => Ok(RoleCode::Viewer),
        }
    }
}

impl ToSql<Text, Pg> for RoleCode {
    fn to_sql<'b>(
        &'b self,
        out: &mut diesel::serialize::Output<'b, '_, Pg>,
    ) -> diesel::serialize::Result {
        match self {
            RoleCode::Admin => out.write_all(b"admin")?,
            RoleCode::Editor => out.write_all(b"editor")?,
            RoleCode::Viewer => out.write_all(b"viewer")?,
        };
        Ok(diesel::serialize::IsNull::No)
    }
}

/// This struct is returned by the database when a role is queried.
#[derive(Queryable, Debug, Identifiable)]
#[diesel(table_name = roles)]
pub struct Role {
    pub id: i32,
    pub code: RoleCode,
    pub name: String,
}

/// This struct is returned by the database when a user is queried.
#[derive(
    Queryable,
    Selectable,
    Debug,
    Identifiable,
    Insertable,
    AsChangeset,
    Serialize,
    Deserialize,
    Clone,
)]
#[diesel(table_name = users)]
#[diesel(check_for_backend(Pg))]
pub struct User {
    pub id: Uuid,
    pub username: String,
    pub email: String,
    #[serde(skip_serializing)]
    pub password: String,
    pub is_admin: bool,
    pub created: NaiveDateTime,
}

/// This struct is used to insert a new user in the database.
#[derive(Insertable, Debug)]
#[diesel(table_name=users)]
pub struct NewUser {
    pub username: String,
    pub email: String,
    pub password: String,
    pub is_admin: bool,
}

/// This struct is used for storing user preferences in the database.
#[derive(
    Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations, PartialEq,
)]
#[diesel(belongs_to(User))]
#[diesel(primary_key(user_id))]
#[diesel(table_name = userpreferences)]
pub struct UserPreferences {
    pub user_id: Uuid,
    pub number_of_questions_per_session: i32,
    pub number_of_successes_to_pass: i32,
    pub proportion_of_failed_questions: i32,
    pub proportion_of_old_questions: i32,
}

/// This struct is returned by the database when a course is queried.
#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset)]
#[diesel(table_name = courses)]
pub struct Course {
    pub id: Uuid,
    pub name: String,
    pub description: String,
}

/// This struct is used to insert a new course in the database.
#[derive(Insertable, Debug)]
#[diesel(table_name = courses)]
pub struct NewCourse {
    pub name: String,
    pub description: String,
}

/// This struct is returned by the database when a lesson is queried.
#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations)]
#[diesel(belongs_to(Course))]
#[diesel(table_name = lessons)]
pub struct Lesson {
    pub id: Uuid,
    pub course_id: Uuid,
    pub name: String,
    pub description: String,
}

/// This struct is returned by the database when a question is queried.
#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations)]
#[diesel(belongs_to(Lesson))]
#[diesel(table_name = questions)]
pub struct Question {
    pub id: Uuid,
    pub lesson_id: Uuid,
    pub question: String,
    pub answer: String,
}

/// This struct is returned by the database when querying users which can work on a specific lesson.
#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations)]
#[diesel(primary_key(course_id, user_id))]
#[diesel(belongs_to(Course))]
#[diesel(belongs_to(Role))]
#[diesel(table_name = courseusers)]
pub struct CourseUser {
    pub course_id: Uuid,
    pub user_id: Uuid,
    pub role_id: i32,
}

/// This struct allows to store the history of a user with a specific question.
#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations)]
#[diesel(belongs_to(Question))]
#[diesel(belongs_to(User))]
#[diesel(primary_key(question_id, user_id))]
#[diesel(table_name = questionhistory)]
pub struct Questionhistory {
    pub question_id: Uuid,
    pub user_id: Uuid,
    pub last_is_success: bool,
    pub last_number: i32,
    pub last_asked: NaiveDateTime,
}

/// This struct is returned by the history of lessons for a specific lesson.
#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations)]
#[diesel(belongs_to(Lesson))]
#[diesel(belongs_to(User))]
#[diesel(primary_key(lesson_id, user_id))]
#[diesel(table_name = lessonhistory)]
pub struct Lessonhistory {
    pub lesson_id: Uuid,
    pub user_id: Uuid,
    pub last_asked: NaiveDateTime,
}
