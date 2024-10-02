DELETE FROM UserPreferences;
DELETE FROM LessonHistory;
DELETE FROM QuestionHistory;
DELETE FROM CourseUsers;
DELETE FROM Questions;
DELETE FROM Lessons;
DELETE FROM Courses;
DELETE FROM Users;

INSERT INTO Users (username, email, password, is_admin)
VALUES 
('guest', 'guest@doe.com', 'xtodo;', FALSE),
('admin', 'guest@doe.com', 'xtodo;', TRUE),
('jd', 'john@doe.com', 'xtodo;', FALSE)
;

INSERT INTO Courses (name, description)
VALUES 
('Español 1', 'Spanish Level 1'),
('Español 2', 'Spanish Level 2')
;

INSERT INTO CourseUsers (course_id, user_id, role_id)
VALUES 
((SELECT id FROM Courses WHERE name = 'Español 1'), (SELECT id FROM Users WHERE username = 'jd'), 2),
((SELECT id FROM Courses WHERE name = 'Español 1'), (SELECT id FROM Users WHERE username = 'guest'), 1),
((SELECT id FROM Courses WHERE name = 'Español 2'), (SELECT id FROM Users WHERE username = 'guest'), 1)
;

INSERT INTO Lessons (course_id, name, description)
VALUES 
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E01', 'Saying how you are feeling'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E02', 'Greetings'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E03', 'Saying where you are from'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E04', 'More on nationalities'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E05', 'Talking about the family'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E06', 'Introduction to numbers'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E07', 'Jobs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E01', 'The present tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E02', 'More on the present tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E03', 'Reflexive verbs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E04', 'Making arrangements'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E05', 'Making more arrangements'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E06', 'Using the correct version of the verb "to be"'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E07', 'Radical changing verbs')
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
((SELECT id FROM Lessons WHERE name = 'S01E04'), 'Are you from Scotland? Yes, I''m from Scotland.', '¿Eres de Escocia?
Sí, soy de Escocia'),
((SELECT id FROM Lessons WHERE name = 'S01E04'), 'Are you from England? No, I''m not from England', '¿Eres de Inglaterra? 
No, no soy de Inglaterra.'),
((SELECT id FROM Lessons WHERE name = 'S01E04'), 'I live in Glasgow', 'Vivo en Glasgow.'),
((SELECT id FROM Lessons WHERE name = 'S01E04'), 'Where do you live (unformal)?', '¿Dónde vives?'),
((SELECT id FROM Lessons WHERE name = 'S01E04'), 'Where do you live (formal)?', '¿Dónde vive usted?'),
((SELECT id FROM Lessons WHERE name = 'S01E04'), 'I''m from Glasgow but now I live in Edimburgh', 'Soy de Glasgow pero ahora vivo in Edimburgo.')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'Brother / Sister', 'Hermano, Hermana'),
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'Father / mother', 'Padre / Madre'),
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'Husband / Wife', 'Marido / mujer'),
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'Son / daughter', 'Hijo / Hija'),
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'grandfather / grandmother', 'Abuelo / abuela'),
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'My brother / My sister', 'Mi hermano / mi hermana'),
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'This is my son / This my daughter', 'Este es mi hijo / Esta es mi hija'),
((SELECT id FROM Lessons WHERE name = 'S01E05'), 'His name is Carlo / Her name is Maria', 'Se llama Carlo / Se llama Maria')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E06'), 'your father', 'tu padre'),
((SELECT id FROM Lessons WHERE name = 'S01E06'), 'you / your', 'tú / tu'),
((SELECT id FROM Lessons WHERE name = 'S01E06'), 'Mummy, dad', 'mamá / papá'),
((SELECT id FROM Lessons WHERE name = 'S01E06'), 'to have (present)', 'tengo
tienes
tiene
temenos
teneis
tienen'),
((SELECT id FROM Lessons WHERE name = 'S01E06'), 'I have one brother / I have one sister', 'Tengo un hermano / tengo una hermana'),
((SELECT id FROM Lessons WHERE name = 'S01E06'), '1, 2, 3, 4, 5, 6, 7, 8, 9, 10', 'Uno
Dos
Tres
Cuatro
Cinco
Seis
Siete
Ocho
Nueve
Diez')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'teacher (m/f)', 'el profesor / la profesora'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'student (m.f.)', 'el estudiente / la estudiente'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'engineer (m.f.)', 'el ingeniero / la ingeniera'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'plumber (m.f.)', 'el fontanero / la fontanera'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'housewife', 'el ama de casa'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'What is you job? (unformal)', '¿En que trabajas?'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'What is you job? (formal)', '¿En que trabaja usted?'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'A shop/store', 'la tienda'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'A factory', 'la fabrica'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'office', 'la oficina'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'restaurant', 'el restaurante'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'hospital', 'el hospital'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'Do you like your job? yes, I like my job ', '¿Te gusta tu trabajo? Si, me gusto mi trabajo'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'Do you like your job? No, I don''t like my job ', '¿Te gusta tu trabajo? No, no me gusta mi trabajo'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'I don''t work', 'No trabajo'),
((SELECT id FROM Lessons WHERE name = 'S01E07'), 'I''m retired (m.f.)', 'Estoy jubilado / Estoy jubilada');

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

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'ir (present)', 'voy
vas
va
vamos
vais
van'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'hacer (present)', 'hago
haces
hace
hacemos
hacéis
hacen'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'cenar', 'ceno
cenas
cena
cenamos
cenáis
cenan'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'What do we do tomorrow?', '¿qué hacemos mañana?'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'What do we do tomorrow morning?', '¿qué hacemos mañana por la mañana?'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'What do we do this afternoon? We go the cinema', '¿qué hacemos esta tarde?
vamos al cine'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'What do we do tonight? We go to the restaurant', '¿qué hacemos esta noche?
vamos a un restaurante'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'We go to the restaurant close to the church', 'vamos al restaurant cerca de la iglesia'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'We go to the restaurant "the dragon"', 'vamos al restaurante que se llama "El Dragón"'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'We are dining together', 'cenamos juntos
cenamos juntas'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'comer (present)', 'como
comes
come
comemos
coméis
comen'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'to play piano', 'tocar el piano'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'to play football', 'jugar al futbal'),
((SELECT id FROM Lessons WHERE name = 'S02E04'), 'to watch the TV', 'ver la televisión')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E05'), ' We are going to the theater', 'Vamos al teatro'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), ' We are going partying (4 versions x 2)', 'vamos de juerga
vamos de copas (binge)
vamos de fiesta
vamos de pachanga

salimos de juerga
salimos de copas (binge)
salimos de fiesta
salimos de pachanga'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'We''re going to have a drink', 'vamos a tomar una copa'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'to give (present)', 'dar

doy
das
da
damos
dáis
dan'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'We''re "giving" a party', 'damos una fiesta'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'we''re back', 'estamos de vuelta'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'to go for a walk/ride/drive', 'dar una vuelta'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'After diner, we go for a walk', 'después de cenar, damos una vuelta'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'to meet up', 'quedar'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'we''ll meet up in the square', 'quedamos en la plaza'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'I don''t really like classical music', 'No me gusta mucho la música clásica.'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'At what time, do we meet? At 9 o''clock, is it OK?', 'A qué hora quedamos?
A las nueve ¿te parece bien?'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'Where do we meet? At the bus station', '¿Dónde quedamos? En la estacion de autobuses'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'See you at 9 o''clock', 'Hasta las nueve'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'Trous noirs', 'agujeros negros'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'Physics', 'Física')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'estar (present)', 'estoy
estás
está
estamos
estáis
estan'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'estar use', 'temporary condition
estoy cansado, estoy triste
estoy bien, estoy deprimido
estoy contento

Location
estamos en el estudio
el estudio esta en Escocia'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'ser (present)', 'soy
eres
es
somos
sois
son'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'ser use', 'If it''s not a location
if it''s not a temporary situation

who you are
physical characteristics
inherent qualities (profession, religion, nationality, ..)
time, price'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'he''s honest', 'es honrado'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'she''s catholic', 'es católica'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'he''s mexican', 'es mexicano'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'she''s a happy person but currently she''s sad', 'esta una persona contenta pero en este momento está triste'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'I''m John', 'soy John'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'it''s two in the morning', 'son la dos de la madrudaga'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'dawn', 'la madrudaga'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'I''m old', 'soy viejo'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'I''m young', 'soy joven'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'I''m tall', 'soy alyo'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'It is 4 euros', 'son cuatros euros'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'I have dark hairs', 'soy moreno'),
((SELECT id FROM Lessons WHERE name = 'S02E06'), 'She''s sad', 'esta triste')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to want/to love (present)', 'quiero
quieres
quiere
queremos
queréis
quieren'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'I want to sing', 'quiero cantar'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'Do you want to have a coffee?', '¿quieres tomar un café?'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'Do you want to dance?', '¿Quieres bailar?'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'Do you want to eat in a restaurant tonight? (pl.)', '¿Queréis cenar en un restaurante esta noche?'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'They want to learn Spanish in Cuba', 'Quieren apprender español en Cuba.'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to think (present)', 'pensar

pienso
piensas
piensa
pensamos
pensáis
piensan'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'I think I''m going to a restaurant tongiht', 'pienso que voy a un restaurante esta noche'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to can/to be able to (present)', 'poder

puedo
puedes
puede
podemos
podéis
pueden'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'Can I dance?', '¿puedo bailar?'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'Can you dine in a restaurant?', '¿Puedes cenar en un restaurante?'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'Can we go to the cinema?', '¿Podemos ir al cine?'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to return/to come back (present)', 'volver

vuelvo
vuelves
vuelve
volvemos
volvéis
vuelven'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to warn (present)', 'advertir (e -> ie)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to close (present)', 'cerrar (e->ie)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to defend (present)', 'defender (e->ie)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to wake oneself up (present)', 'despertarse (e->ie)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to start (present)', 'empezar (e -> ie)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to lose (present)', 'perder (e -> ie)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to feel (present)', 'sentir (e -> ie)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to have (present)', 'tener

tengo
tienes
tiene
tenemos
tenéis
tienen'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to come (present)', 'venir

vengo
vienes
viene
venemos
venéis
vienen'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to go to bed (present)', 'acostarse (o -> ue)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to count, to tell (present)', 'contar (o -> ue)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to sleep (present)', 'dormir (o -> ue)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to find (present)', 'encontrar (o -> ue)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to show (present)', 'mostrar (o->ue)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to fly (present)', 'volar (o -> ue)'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to play (present)', 'jugar (u ->ue)

juego
juegas
juega
jugamos
jugáis
juegan'),
((SELECT id FROM Lessons WHERE name = 'S02E07'), 'to ask (present)', 'pedir (e -> I)

pido
pides
pide
pedimo
pedis
piden')
;

/*
INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = ''), '', ''),
;
*/

