CREATE TABLE Roles (
    -- a bit value to represent the role
    value INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO Roles (value, name) VALUES (1, 'Read');
INSERT INTO Roles (value, name) VALUES (2, 'Write');
-- admin has always read and write rights
INSERT INTO Roles (value, name) VALUES (7, 'Admin');

CREATE TABLE Users (
    id UUID PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    -- this is not the password, but the hash of the password
    -- and it cannot be reversed
    password VARCHAR(128) NOT NULL,
    role INT NOT NULL REFERENCES Roles(value)
);

CREATE TABLE Courses (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Lessons (
    id UUID PRIMARY KEY,
    course_id UUID NOT NULL REFERENCES Courses(id),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Questions (
    id UUID PRIMARY KEY,
    lesson_id UUID NOT NULL REFERENCES Lessons(id),
    question TEXT NOT NULL,
    answer TEXT NOT NULL
);

CREATE TABLE CourseUsers (
    course_id UUID NOT NULL REFERENCES Courses(id),
    user_id UUID NOT NULL REFERENCES Users(id),
    PRIMARY KEY (course_id, user_id)
);

CREATE TABLE QuestionHistory (
    question_id UUID NOT NULL REFERENCES Questions(id),
    user_id UUID NOT NULL REFERENCES Users(id),
    last_number_of_successes INT NOT NULL DEFAULT 0,
    last_asked TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (question_id, user_id)
);
