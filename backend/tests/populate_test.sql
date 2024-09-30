DELETE FROM QuestionHistory;
DELETE FROM CourseUsers;
DELETE FROM Questions;
DELETE FROM Lessons;
DELETE FROM Courses;
DELETE FROM Users;

INSERT INTO Users (username, email, password, role)
VALUES ('guest', 'guest@doe.com', 'xtodo;', 1);
INSERT INTO Users (username, email, password, role)
VALUES ('admin', 'guest@doe.com', 'xtodo;', 7);
INSERT INTO Users (username, email, password, role)
VALUES ('jd', 'John@doe.com', 'xtodo;', 3);

INSERT INTO Courses (name, description)
VALUES ('Español 1', 'Spanish Level 1');
INSERT INTO Courses (name, description)
VALUES ('Español 2', 'Spanish Level 2');

INSERT INTO Lessons (course_id, name, description)
VALUES ((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E01', 'Saying how you are feeling');
INSERT INTO Lessons (course_id, name, description)
VALUES ((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E02', 'Greetings');
INSERT INTO Lessons (course_id, name, description)
VALUES ((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E01', 'The present tense');
INSERT INTO Lessons (course_id, name, description)
VALUES ((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E02', 'More on the present tense');

INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'Hi!', '¡Hola!');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'How are you?', '¿Que tal?');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'I''m good', '(yo) bien');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'I''m very well', '(yo) muy bien');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'I''m terrible/awful/very bad', '(yo) fatal');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'And you?', '¿y tú?');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'Fantastic!', '¡Fenomenal!');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E01'), 'Thanks', 'Gracias');

INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'good morning', 'Buenos días');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'good afternoon', 'Buenas tardes');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'good evening/good night', 'Buenas noches');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'See you later! Goodbye!', '¡Hasta luego!');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'See you soon!', '¡Hasta pronto!');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'See you tomorrow!', '¡Hasta mañana!');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'my name is ...', 'Me llamo ...');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S01E02'), 'Delighted', 'encantado/encantada');

INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E01'), 'what have you done this week-end?', '¿Qué haces durante el fin de semana?');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E01'), 'Do you work in a restaurant? (formal)', '¿Usted trabaja en un restaurante?');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E01'), 'to work (present)', 'yo trabajo
tu trabajas
el/ella/Ud trabaja
nosostros trabajamos
vosostros trabajáis (en L.A. trabajan is used instead)
ellos/ellas/Uds trabajan');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E01'), 'I spent time with my family', 'Paso tiempo con mi familia');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E01'), 'to spend/pass', 'pasar');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E01'), 'to chat (spain/l.a)', 'charlar (spain)
platicar (l.a.)');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E01'), 'I chat (spain/l.a.) with my friends', 'charlo con mis amigos
platico con mis amigos');

INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'When do you have breakfast? 
I have breakfast at half pass seven', '¿A qué hora desayunas?
desayuno a las siete y media');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'When do you leave home? 
I leave home at 8 o''clock', '¿A qué hora sales de la casa?
salgo de la casa a las ocho');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'I arrive at work at 9 o''clock', 'llego al trabajo a las nueve');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'then/after', 'luego de');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'University', 'la universidad');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'I have lunch at one o''clock', 'como a la una');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'When do you come back home?
I come back at 5 o''clock then I rest', '¿A que horas vuelves a la casa?
vuelvo a casa a las cinco y luego descanco');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'tired', 'cansado');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'to rest', 'descansar');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'to have dinner', 'cenar');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'at noon/midday', 'a mediadía');
INSERT INTO Questions (lesson_id, question, answer)
VALUES ((SELECT id FROM Lessons WHERE name = 'S02E02'), 'at midnight', 'a medianoche');
