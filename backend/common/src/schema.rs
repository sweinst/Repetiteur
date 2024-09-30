// @generated automatically by Diesel CLI.

diesel::table! {
    courses (id) {
        id -> Uuid,
        #[max_length = 255]
        name -> Varchar,
        description -> Text,
    }
}

diesel::table! {
    courseusers (course_id, user_id) {
        course_id -> Uuid,
        user_id -> Uuid,
    }
}

diesel::table! {
    lessons (id) {
        id -> Uuid,
        course_id -> Uuid,
        #[max_length = 255]
        name -> Varchar,
        description -> Text,
    }
}

diesel::table! {
    questionhistory (question_id, user_id) {
        question_id -> Uuid,
        user_id -> Uuid,
        last_number_of_successes -> Int4,
        last_asked -> Timestamp,
    }
}

diesel::table! {
    questions (id) {
        id -> Uuid,
        lesson_id -> Uuid,
        question -> Text,
        answer -> Text,
    }
}

diesel::table! {
    roles (value) {
        value -> Int4,
        #[max_length = 255]
        name -> Varchar,
    }
}

diesel::table! {
    users (id) {
        id -> Uuid,
        #[max_length = 255]
        username -> Varchar,
        #[max_length = 255]
        email -> Varchar,
        #[max_length = 128]
        password -> Varchar,
        role -> Int4,
    }
}

diesel::joinable!(courseusers -> courses (course_id));
diesel::joinable!(courseusers -> users (user_id));
diesel::joinable!(lessons -> courses (course_id));
diesel::joinable!(questionhistory -> questions (question_id));
diesel::joinable!(questionhistory -> users (user_id));
diesel::joinable!(questions -> lessons (lesson_id));
diesel::joinable!(users -> roles (role));

diesel::allow_tables_to_appear_in_same_query!(
    courses,
    courseusers,
    lessons,
    questionhistory,
    questions,
    roles,
    users,
);
