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
        role_id -> Int4,
    }
}

diesel::table! {
    lessonhistory (lesson_id, user_id) {
        lesson_id -> Uuid,
        user_id -> Uuid,
        last_asked -> Timestamp,
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
        last_is_success -> Bool,
        last_number -> Int4,
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
    roles (id) {
        id -> Int4,
        #[max_length = 64]
        code -> Varchar,
        #[max_length = 255]
        name -> Varchar,
    }
}

diesel::table! {
    userpreferences (user_id) {
        user_id -> Uuid,
        number_of_questions_per_session -> Int4,
        number_of_successes_to_pass -> Int4,
        proportion_of_failed_questions -> Int4,
        proportion_of_old_questions -> Int4,
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
        is_admin -> Bool,
        created -> Timestamp,
    }
}

diesel::joinable!(courseusers -> courses (course_id));
diesel::joinable!(courseusers -> roles (role_id));
diesel::joinable!(courseusers -> users (user_id));
diesel::joinable!(lessonhistory -> lessons (lesson_id));
diesel::joinable!(lessonhistory -> users (user_id));
diesel::joinable!(lessons -> courses (course_id));
diesel::joinable!(questionhistory -> questions (question_id));
diesel::joinable!(questionhistory -> users (user_id));
diesel::joinable!(questions -> lessons (lesson_id));
diesel::joinable!(userpreferences -> users (user_id));

diesel::allow_tables_to_appear_in_same_query!(
    courses,
    courseusers,
    lessonhistory,
    lessons,
    questionhistory,
    questions,
    roles,
    userpreferences,
    users,
);
