CREATE TABLE Roles (
    id INT PRIMARY KEY,
    code varchar(64) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);

INSERT INTO Roles (id, code, name) 
VALUES 
(1, 'viewer', 'Viewer'),
(2, 'editor', 'Editor'),
(3, 'admin', 'Administrator')
;

CREATE TABLE Users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    -- this is not the password, but the hash of the password
    -- and it cannot be reversed
    password VARCHAR(128) NOT NULL,
    is_admin BOOLEAN NOT NULL DEFAULT FALSE,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Courses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT NOT NULL
);

CREATE TABLE Lessons (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    course_id UUID NOT NULL REFERENCES Courses(id),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT UQ_course_id_name UNIQUE(course_id, name)
);

CREATE TABLE Questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lesson_id UUID NOT NULL REFERENCES Lessons(id),
    question TEXT NOT NULL,
    answer TEXT NOT NULL
);

CREATE TABLE CourseUsers (
    course_id UUID NOT NULL REFERENCES Courses(id),
    user_id UUID NOT NULL REFERENCES Users(id),
    role_id INT NOT NULL REFERENCES Roles(id),
    PRIMARY KEY (course_id, user_id)
);

CREATE TABLE QuestionHistory (
    question_id UUID NOT NULL REFERENCES Questions(id),
    user_id UUID NOT NULL REFERENCES Users(id),
    last_is_success BOOLEAN NOT NULL DEFAULT FALSE,
    last_number INT NOT NULL DEFAULT 0,
    last_asked TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (question_id, user_id)
);

CREATE TABLE LessonHistory (
    lesson_id UUID NOT NULL REFERENCES Lessons(id),
    user_id UUID NOT NULL REFERENCES Users(id),
    last_asked TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (lesson_id, user_id)
);

CREATE TABLE UserPreferences (
    user_id UUID PRIMARY KEY REFERENCES Users(id),
    number_of_questions_per_session INT NOT NULL DEFAULT 50,
    number_of_successes_to_pass INT NOT NULL DEFAULT 5,
    proportion_of_failed_questions INT NOT NULL DEFAULT 25,
    proportion_of_old_questions INT NOT NULL DEFAULT 25
);
