use crate::models::*;
use crate::schema::*;
use diesel::prelude::*;
use diesel_async::{AsyncPgConnection, RunQueryDsl};
use uuid::Uuid;

/// Defines helpers for getting/setting user information in the database repository
/// Allows to list, find, create and delete users
pub struct UsersRepository {}

impl UsersRepository {
    /// Lists all users in the database
    pub async fn list(conn: &mut AsyncPgConnection) -> QueryResult<Vec<User>> {
        users::table
            .order_by(users::username)
            .load::<User>(conn)
            .await
    }

    /// Finds a user by its username
    pub async fn find_by_username(
        c: &mut AsyncPgConnection,
        username: &String,
    ) -> QueryResult<User> {
        users::table
            .filter(users::username.eq(username))
            .get_result(c)
            .await
    }

    /// Finds a user by its id
    pub async fn find_by_id(c: &mut AsyncPgConnection, id: &Uuid) -> QueryResult<User> {
        users::table.filter(users::id.eq(id)).get_result(c).await
    }

    /// Creates a new user in the database
    pub async fn create(c: &mut AsyncPgConnection, new_user: NewUser) -> QueryResult<User> {
        let password_hash = crate::auth::hash_password(&new_user.password).unwrap();
        let new_user = NewUser {
            password: password_hash,
            ..new_user
        };
        let user = diesel::insert_into(users::table)
            .values(new_user)
            .get_result::<User>(c)
            .await?;
        let _ = diesel::insert_into(userpreferences::table)
            .values(UserPreferences {
                user_id: user.id,
                number_of_questions_per_session: 50,
                number_of_successes_to_pass: 5,
                proportion_of_failed_questions: 25,
                proportion_of_old_questions: 5,
            })
            .execute(c)
            .await?;
        Ok(user)
    }

    pub async fn update(
        c: &mut AsyncPgConnection,
        user: &User,
        new_username: Option<&String>,
        password: Option<&String>,
        email: Option<&String>,
        is_admin: Option<&bool>,
    ) -> QueryResult<usize> {
        // a simpler approach should be to use "into_boxed"
        // and conditionally add the fields to the update
        // but I wasn't able to make it work for an asynchronous connection
        let mut user = user.clone();
        if let Some(new_username) = new_username {
            user.username = new_username.clone();
        }
        if let Some(password) = password {
            user.password = crate::auth::hash_password(&password).unwrap();
        }
        if let Some(email) = email {
            user.email = email.clone();
        }
        if let Some(is_admin) = is_admin {
            user.is_admin = *is_admin;
        }
        let res = diesel::update(users::table.find(user.id))
            .set(&user)
            .execute(c)
            .await?;
        Ok(res)
    }

    /// gets a user preferences
    pub async fn get_preferences(
        c: &mut AsyncPgConnection,
        id: &Uuid,
    ) -> QueryResult<UserPreferences> {
        userpreferences::table
            .filter(userpreferences::user_id.eq(id))
            .get_result(c)
            .await
    }

    pub async fn update_preferences(
        c: &mut AsyncPgConnection,
        preferences: &UserPreferences,
    ) -> QueryResult<UserPreferences> {
        diesel::update(
            userpreferences::table.filter(userpreferences::user_id.eq(preferences.user_id)),
        )
        .set(preferences)
        .get_result(c)
        .await
    }

    // TODO: add to course

    /// Deletes a user from the database
    pub async fn delete(c: &mut AsyncPgConnection, id: Uuid) -> QueryResult<usize> {
        diesel::delete(userpreferences::table.filter(userpreferences::user_id.eq(id)))
            .execute(c)
            .await?;
        diesel::delete(courseusers::table.filter(courseusers::user_id.eq(id)))
            .execute(c)
            .await?;
        diesel::delete(questionhistory::table.filter(questionhistory::user_id.eq(id)))
            .execute(c)
            .await?;
        diesel::delete(lessonhistory::table.filter(lessonhistory::user_id.eq(id)))
            .execute(c)
            .await?;
        diesel::delete(users::table.find(id)).execute(c).await
    }
}
