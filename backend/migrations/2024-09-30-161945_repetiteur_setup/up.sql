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
    -- and cannot be reversed
    password VARCHAR(128) NOT NULL,
    role INT NOT NULL REFERENCES Roles(value)
);

