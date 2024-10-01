

DELETE FROM QuestionHistory;
DELETE FROM CourseUsers;
DELETE FROM Questions;
DELETE FROM Lessons;
DELETE FROM Courses;
DELETE FROM Users;

INSERT INTO Users (username, email, password, role)
VALUES 
('guest', 'guest@doe.com', 'xtodo;', 1),
('admin', 'guest@doe.com', 'xtodo;', 7),
('jd', 'john@doe.com', 'xtodo;', 3)
;

INSERT INTO Courses (name, description)
VALUES 
('Español 1', 'Spanish Level 1'),
('Español 2', 'Spanish Level 2')
;

INSERT INTO Lessons (course_id, name, description)
VALUES 
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E01', 'Saying how you are feeling'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E02', 'Greetings'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E03', 'Saying where you are from'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E01', 'The present tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E02', 'More on the present tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E03', 'Reflexive verbs')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'Hi!', '¡Hola!'),
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'How are you?', '¿Que tal?'),
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'I''m good', '(yo) bien'),
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'I''m very well', '(yo) muy bien'),
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'I''m terrible/awful/very bad', '(yo) fatal'),
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'And you?', '¿y tú?'),
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'Fantastic!', '¡Fenomenal!'),
((SELECT id FROM Lessons WHERE name = 'S01E01'), 'Thanks', 'Gracias')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'good morning', 'Buenos días'),
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'good afternoon', 'Buenas tardes'),
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'good evening/good night', 'Buenas noches'),
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'See you later! Goodbye!', '¡Hasta luego!'),
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'See you soon!', '¡Hasta pronto!'),
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'See you tomorrow!', '¡Hasta mañana!'),
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'my name is ...', 'Me llamo ...'),
((SELECT id FROM Lessons WHERE name = 'S01E02'), 'Delighted', 'encantado/encantada')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'and you (formal)?', '¿y usted?'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'what is your name (unformal)?', '¿Cómo te llamas?
Me llamo John.'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'what is your name (formal)?', '¿Comó se llama usted?
Me llamo señor Doe.'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'Where are you from (unformal)?', '¿De dónde eres?
Soy de Francia'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'Where are you from (formal)?', '¿De dónde es usted?
Soy de Francia'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'Scotland', 'Escocia'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'England', 'Inglaterra'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'Ireland', 'Irlanda'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'United States of America', 'los Estados Unidos (de América)'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'France', 'Francia'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'London', 'Londres'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'Edimburgh', 'Edimburgo'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'I live in London', 'Vivo en Londres'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'My name is Carlo and I''m from Spain too', 'Me llamo Carlos y soy de España también'),
((SELECT id FROM Lessons WHERE name = 'S01E03'), 'Australia', 'Australia')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E01'), 'what have you done this week-end?', '¿Qué haces durante el fin de semana?'),
((SELECT id FROM Lessons WHERE name = 'S02E01'), 'Do you work in a restaurant? (formal)', '¿Usted trabaja en un restaurante?'),
((SELECT id FROM Lessons WHERE name = 'S02E01'), 'to work (present)', 'yo trabajo
tu trabajas
el/ella/Ud trabaja
nosostros trabajamos
vosostros trabajáis (en L.A. trabajan is used instead)
ellos/ellas/Uds trabajan'),
((SELECT id FROM Lessons WHERE name = 'S02E01'), 'I spent time with my family', 'Paso tiempo con mi familia'),
((SELECT id FROM Lessons WHERE name = 'S02E01'), 'to spend/pass', 'pasar'),
((SELECT id FROM Lessons WHERE name = 'S02E01'), 'to chat (spain/l.a)', 'charlar (spain)
platicar (l.a.)'),
((SELECT id FROM Lessons WHERE name = 'S02E01'), 'I chat (spain/l.a.) with my friends', 'charlo con mis amigos
platico con mis amigos')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'When do you have breakfast? 
I have breakfast at half pass seven', '¿A qué hora desayunas?
desayuno a las siete y media'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'When do you leave home? 
I leave home at 8 o''clock', '¿A qué hora sales de la casa?
salgo de la casa a las ocho'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'I arrive at work at 9 o''clock', 'llego al trabajo a las nueve'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'then/after', 'luego de'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'University', 'la universidad'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'I have lunch at one o''clock', 'como a la una'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'When do you come back home?
I come back at 5 o''clock then I rest', '¿A que horas vuelves a la casa?
vuelvo a casa a las cinco y luego descanco'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'tired', 'cansado'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'to rest', 'descansar'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'to have dinner', 'cenar'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'at noon/midday', 'a mediadía'),
((SELECT id FROM Lessons WHERE name = 'S02E02'), 'at midnight', 'a medianoche')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I have a shower', 'Me ducho (ducharse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I have a bath', 'Me baño (bañarse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I wake up at six but I get up at 7', 'Me despierto a las seis pero me levanto a las siete (despertarse & levantarse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I shave myself', 'Me afeito (afeitarse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I put my make-up', 'me maquillo (maquillarse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'the make-up', 'el maquillaje'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I comb my hair', 'me peino (peinarse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I get dress', 'me visto (vestirse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I go to bed', 'me acuesto (acostarse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I get undressed', 'me desnudo (desnudarse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'I go to sleep', 'Me duermo (dormirse)'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'reflexive pronouns', 'me
te
se
nos
vos
se'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'At what time do you get up?', '¿A que horas, te levantas?'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'at a quarter pass seven ', 'A la siete y cuarto'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'at a quarter to seven ', 'a las siete menos cuarto'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'At 5:05', 'a las cinco y cinco'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'At 5:35', 'A las seis menos veinticinco'),
((SELECT id FROM Lessons WHERE name = 'S02E03'), 'At what time', '¿A qué hora?')
;
