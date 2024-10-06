use crate::models::*;
use crate::schema::*;
use diesel::prelude::*;
use diesel_async::{AsyncPgConnection, RunQueryDsl};
use uuid::Uuid;

/// Defines helpers for getting/setting user informtion in the atabase repository
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
        diesel::insert_into(users::table)
            .values(new_user)
            .get_result::<User>(c)
            .await
    }

    /// Deletes a user from the database
    pub async fn delete(c: &mut AsyncPgConnection, id: Uuid) -> QueryResult<usize> {
        diesel::delete(users::table.find(id)).execute(c).await
    }
}
