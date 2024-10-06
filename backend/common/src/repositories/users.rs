use crate::models::*;
use crate::schema::*;
use diesel::prelude::*;
use diesel_async::{AsyncPgConnection, RunQueryDsl};
use uuid::Uuid;

pub struct UsersRepository {}

impl UsersRepository {
    pub async fn list(conn: &mut AsyncPgConnection) -> QueryResult<Vec<User>> {
        users::table
            .order_by(users::username)
            .load::<User>(conn)
            .await
    }

    pub async fn find_by_username(
        c: &mut AsyncPgConnection,
        username: &String,
    ) -> QueryResult<User> {
        users::table
            .filter(users::username.eq(username))
            .get_result(c)
            .await
    }

    pub async fn find_by_id(c: &mut AsyncPgConnection, id: &Uuid) -> QueryResult<User> {
        users::table.filter(users::id.eq(id)).get_result(c).await
    }

    pub async fn create(c: &mut AsyncPgConnection, new_user: NewUser) -> QueryResult<User> {
        diesel::insert_into(users::table)
            .values(new_user)
            .get_result::<User>(c)
            .await
    }

    pub async fn delete(c: &mut AsyncPgConnection, id: Uuid) -> QueryResult<usize> {
        diesel::delete(users::table.find(id)).execute(c).await
    }
}
