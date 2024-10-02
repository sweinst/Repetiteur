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

#[derive(AsExpression, Debug, FromSqlRow)]
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

#[derive(Queryable, Debug, Identifiable)]
#[diesel(table_name = roles)]
pub struct Role {
    pub id: i32,
    pub code: RoleCode,
    pub name: String,
}

#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset)]
#[diesel(table_name = users)]
#[diesel(check_for_backend(Pg))]
pub struct User {
    pub id: Uuid,
    pub username: String,
    pub email: String,
    pub password: String,
    pub is_admin: bool,
    pub created: NaiveDateTime,
}

#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset)]
#[diesel(table_name = courses)]
pub struct Course {
    pub id: Uuid,
    pub name: String,
    pub description: String,
}

#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations)]
#[diesel(belongs_to(Course))]
#[diesel(table_name = lessons)]
pub struct Lesson {
    pub id: Uuid,
    pub course_id: Uuid,
    pub name: String,
    pub description: String,
}

#[derive(Queryable, Selectable, Debug, Identifiable, Insertable, AsChangeset, Associations)]
#[diesel(belongs_to(Lesson))]
#[diesel(table_name = questions)]
pub struct Question {
    pub id: Uuid,
    pub lesson_id: Uuid,
    pub question: String,
    pub answer: String,
}

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
