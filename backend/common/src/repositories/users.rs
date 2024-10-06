use crate::models::*;
use crate::schema::*;
use diesel::prelude::*;
use diesel_async::{AsyncPgConnection, RunQueryDsl};

pub struct UsersRepository {}

impl UsersRepository {
    pub async fn list(conn: &mut AsyncPgConnection) -> QueryResult<Vec<User>> {
        users::table
            .order_by(users::username)
            .load::<User>(conn)
            .await
    }
}
