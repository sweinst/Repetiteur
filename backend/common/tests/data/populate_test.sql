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
('guest', 'guest@doe.com', '$argon2id$v=19$m=19456,t=2,p=1$jI4o6MadRdwMuNQJjheD3A$FYnd+aQw5DbQ6StPkZbiNaqzMxf58v7ufyOSnnO/+vE;', FALSE),
('admin', 'guest@doe.com', '$argon2id$v=19$m=19456,t=2,p=1$jI4o6MadRdwMuNQJjheD3A$FYnd+aQw5DbQ6StPkZbiNaqzMxf58v7ufyOSnnO/+vE;', TRUE),
('jd', 'john@doe.com', '$argon2id$v=19$m=19456,t=2,p=1$jI4o6MadRdwMuNQJjheD3A$FYnd+aQw5DbQ6StPkZbiNaqzMxf58v7ufyOSnnO/+vE;', FALSE)
;

INSERT INTO UserPreferences (
     user_id, 
     number_of_questions_per_session, 
     number_of_successes_to_pass, 
     proportion_of_failed_questions,
     proportion_of_old_questions
) 
VALUES 
((SELECT id FROM Users WHERE username = 'guest'), 50, 5, 25, 25),
((SELECT id FROM Users WHERE username = 'admin'), 50, 5, 25, 25),
((SELECT id FROM Users WHERE username = 'jd'), 50, 5, 25, 25)
;

INSERT INTO Courses (name, description)
VALUES 
('Español 1', 'Spanish Level 1'),
('Español 2', 'Spanish Level 2')
;

INSERT INTO CourseUsers (course_id, user_id, role_id)
VALUES 
((SELECT id FROM Courses WHERE name = 'Español 2'), (SELECT id FROM Users WHERE username = 'jd'), 2),
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
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E08', 'Likes and dislikes'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E09', 'Accentuation'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E10', 'Christmas Edition'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E11', 'I only speak a little spanish'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E12', 'Numbers, months, days and seasons'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E13', 'Directions'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E14', 'Places in town'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E15', 'Ordering drinks in a café'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E16', 'Ordering food in a café'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E17', 'Ordering food in a restaurant'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E18', 'Situations in a restaurant'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E19', 'Review of the unit'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E20', 'Cultural programme in a Spanish restaurant'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E21', 'Weather'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E22', 'Hotels and accommodations'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E23', 'Problems in a hotel'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E24', 'The alphabet and staying at a campsite'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E25', 'Shopping'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E26', 'At the market in Spain'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E27', 'Exchanging currency'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E28', 'Aches and pain'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E29', 'At he pharmacy or doctor'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E30', 'At a UEFA Cup Final in Glasgow'),
((SELECT id FROM Courses WHERE name = 'Español 1'), 'S01E31', 'On a flight to Spain'),

((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E01', 'The present tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E02', 'More on the present tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E03', 'Reflexive verbs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E04', 'Making arrangements'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E05', 'Making more arrangements'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E06', 'Using the correct version of the verb "to be"'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E07', 'Radical changing verbs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E08', 'Agreement of adjectives'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E09', 'Describing people'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E10', 'Quiz'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E11', 'Talking about the future'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E12', 'Review of present tense verbs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E13', 'Introducing the preterit tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E14', 'Preterite tense of -er and -ir verbs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E15', 'Preterite tense of irregular verbs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E16', 'Spelling changes in the preterit tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E17', 'Identity quiz'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E18', 'Talking more about the past - the Imperfect tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E19', 'Describing the past'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E20', 'End-of-unit test'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E21', 'Using "for" in Spanish'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E22', 'Expressing purpose using para'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E23', 'Various uses of por'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E24', 'Introducing the perfect tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E25', 'When to use the perfect tense and irregular verbs'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E26', 'More on the perfect tense'),
((SELECT id FROM Courses WHERE name = 'Español 2'), 'S02E27', 'Traveling by public transport')
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
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'Do you like your job? (formal)', '¿Le gusta su trabajo?'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'Do you like your job? (unformal)', '¿te gusta tu trabajo?'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'I like music', 'me gusta la música'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'Literature', 'La lituratera'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'Photography', 'la fotografia'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'I like a lot chocolate', 'me gusta mucho el chocolate'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'cinema', 'el cine'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'sport', 'el deporte'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'I love chocolate', 'me encanta chocolate'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'encantar (present)', 'encanto
encantas
encanta
encantamos
encantàis
encantan'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'I like singing', 'me gusta cantar'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'to dance', 'bailar'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'to eat (present)', 'comer

como
comes
come
comemos
coméis
comen'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'to go out (present)', 'salir

salgo
sales
sale
salimos
salís
salen'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'to read (present)', 'eer 

leo
lees
lee
leemos
leéis
leen
'),
((SELECT id FROM Lessons WHERE name = 'S01E08'), 'I like to learn spanish', 'Me gusta apprender español')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E09'), 'Accentuation', '1. Words ending in a vowel, n, or s.
For words that end in a vowel, the letter n, or the letter s, the stress is on the next to last syllable.
Examples:
     todo (to-do) all/every
     inteligente (in-te-li-gen-te) smart
     el examen (e-xa-men) exam
     joven (jo-ven) young
     lunes (lu-nes) Monday
     los calcetines (cal-ce-ti-nes) socks
2. Words ending in a consonant (not n, s)
For words that end in all other consonants (not n or s), the stress falls on the last syllable.
Examples:
     comer (co-mer)  to eat
     la ciudad (ciu-dad)  the city
     el profesor (pro-fe-sor)  the professor/teacher
     el animal (a-ni-mal)  the animal
     Madrid (Ma-drid)  Madrid
')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'Merry Christmas!', '¡Feliz Navidad!'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'Happy new year!', '¡Prospero año nuevo!'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'Today', 'Hoy'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'bell', 'la campana'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'haber (present)', 'he
has
ha - (impersonal) hay
hemos
habéis
han'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'You have to', 'hay (haber) que'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'to celebrate', 'festejar'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'Little boy', 'el niñito'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'Yesterday', 'ayer'),
((SELECT id FROM Lessons WHERE name = 'S01E10'), 'Christmas eve', 'Nochebuena')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'Scottish (m.,f.)', 'escocés, escocesa'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'French (m.,f.)', 'francés, francesa'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'above all', 'sobre todo'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'languages', 'los idiomas'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'languages: French, English, Italian, German, Japanese, Chinese', 'Los idiomas: español, francés, ingles, italiano, alemán, japonés, chino'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'to speak (present)', 'hablar

hablo
hablas
habla
hablamos
habláis
hablan'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'Do you speak Spanish? (formal)', '¿Habla usted espanõl?'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'Do you speak Spanish? (unformal)', '¿Hablas espanõl?'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'I speak a little Spanish', 'Hablo un poco de español'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'I understand a little Spanish', 'Entiendo un poco de español'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'to understand (present)', 'Entender

Entiendo
Entiendes
Entiende
Entendemos
Entendéis
Entienden'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'Do you understand? (formal, unformal). I don''t understand.', '¿Entien usted?
¿Entiendes?
No entiendo'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'I''m sorry', 'lo siento'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'I''m learning Spanish', 'Estoy apprediendo español'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'Can you speak more slowly, please? (formal, unformal)', '¿Puedes hablar más despacio, por favor?
¿Puede usted hablar más despacio, por favor?'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'Could you repeat, please? (formal, unformal)', '¿Puedes repetir, por favor?
¿Puede usted repetir, por favor?'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'How do you spell it?', '¿Cómo se escribe?'),
((SELECT id FROM Lessons WHERE name = 'S01E11'), 'How do say "watch" in Spanish?', '¿Cómo se dice "watch" en español?')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E12'), '11, 12, 13, 14, 15, 16, 17, 18, 19, 20', 'once
doce
trece
catorce
quince
dieciséis
diecisiete
dieciocho
diecinueve
veinte'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), '21, 22, 23, 24, 25, 26, 27, 28, 29, 30', 'veintiuno
veintidós
veintitrés
veinticuatro
veinticinco
veintiséis
veintisiete
veintiocho
veintinueve
treinta'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), '30, 31, 32, 33, 40, 50, 60, 70, 80, 90', 'treintra y uno
treintra y dos
treintra y trres
cuarenta
cincuenta
sesenta
setenta
ochenta
noventa'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), '100, 101, 102, 110, 111, 200, 300, 400, 500, 600, 700, 800, 900', 'cien
cientos uno
cientos dos 
cientos diez
cientos once
doscientos
trescientos
cuatrocientos
quinientos
seiscientos
setecientos
ochocientos
novecientos'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), '1,000, 1,001, 1,111, 2,000, 3,000, 1,000,000, 3,000,003', 'mil
mil once
mil cientos once
dos mil
tres mil
un millon
tres millones tres'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), '324, 642, 555, 1282', 'tres cientos vienticuatro
sesientos cuaranta y dos
quinientos cincuenta y cinco
mil dos cientos ochenta y dos'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'lunes
martes
miércoles
jueves
viernes
sábado
domingo'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), 'January, February, March, April, May, June. July, August, September, October, November, December', 'Enero
Febrero
Marzo
Abril
Mayo
Junio
Julio
Agosto
Septiembre
Octubre
Noviembre
Diciembre'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), 'spring, summer, autumn, winter', 'la primavera
el verano
al otoño
el invierno'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), 'Today, it''s the 7th of January 2007', 'hoy es el siete de enero de dos mil siete'),
((SELECT id FROM Lessons WHERE name = 'S01E12'), 'My birthday is the 5th of March', 'Mi cumpleaños es el cinco de Marzo')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the museum', 'el museo'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the bank', 'el banco'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the restaurant', 'el restaurante'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the main square', 'la plaza mayor'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the market', 'el mercado'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the cathedral', 'la catedral'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the office of tourism', 'la oficina de turismo'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the swimming pool', 'la piscina'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'Excuse-me, Where is the museum?', '¿Por favor, dónde esta el museo?'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'the musem is here', 'Mire, el museo está aquí'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'go straight on', 'sigua todo recto'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'turn right', 'doble a la derecha'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'turn left', 'doble a la izquierda'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'Is the museum far from here?', '¿El museo está lejos de aquí?'),
((SELECT id FROM Lessons WHERE name = 'S01E13'), 'Is the bank close from here?', '¿El banco está cerca de aquí?')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'mall', 'el centro commercial'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'bar', 'el bar'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'hospital', 'el hospital'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'cafeteria', 'la cafeteria'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'pharmacy', 'la farmacia'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'There''s a bar this way?', '¿Hay un bar por aquí?'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'in front from/opposite ', 'in frente de'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'close to', 'cerca de'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'far from', 'lejos de'),
((SELECT id FROM Lessons WHERE name = 'S01E14'), 'In the city I live', 'En la ciudad vivo yo')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A white coffee, please', 'Un café con leche, por favor'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A black coffe (2 poss)', 'Un café solo
Un café negro'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A coffee with a dash of milk', 'Un cortado'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A tea with milk', 'Un té con leche'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A tea with a slice of lemon', 'Un té con limón'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'An orange juice (psain/l.a.)', 'Un zumo de naranja (spain)
Un jugo de naranja  (latin america)'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'An apple juice', 'Un zumo de manzana'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A pineapple juice', 'Un zumo de piña'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A still mineral water', 'Un agua mineral sin gas'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A sparkling water', 'Un agua mineral con gas'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A lemonade', 'Una limonada'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'red wine', 'vino tinto'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'white wine', 'vino blanco'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'a beer (regular & small)', 'Una cerveza
Una caña (a small beer)'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'I want to', 'quiero'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'to want (present)', 'quiero
quieres
quiere
queremos
quereís
quieren'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A coffee for me', 'Para mí, un café'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'A lemonade for my friend', 'Para mi amigo, una lemonada'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'Wife (2 poss.)', 'Mujer/Esposa'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'What do you want to drink?', '¿Que van a tomar?'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'Right away', 'Enseguida'),
((SELECT id FROM Lessons WHERE name = 'S01E15'), 'Cheers!', '¡Salud!')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Another wine', 'Otro vino'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Another limonade', 'Otra limonada'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Another of the same (m./f.)', 'Otro de lo mismo/Otra de lo mismo'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Can you eat here?', '¿Se puede comer aquí?'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Bring us the menu, please (2 sol.)', 'Nos trae la carta por favor.
Me trae la carta por favour.'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'The menu (spain, l.a.)', 'la carta (Spain)
el menu (L. America)'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'A sandwich (spain, l.a.)', 'Un bocadillo (Spain)
Un sandwich (L. America)'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'A ham sandwich', 'Un bocadillo de jamón'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'The cheese', 'el queso'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'A portion', 'Una ración'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Do you want something else? (sing.,pl.)', '¿Quiere algo más?
¿Quieren algo más?'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Can you bring us more water, please?', '¿Nos trae más agua, por favor?'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'To study', 'Estudiar'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Are you accompanied? (m./f.)', '¿Estàs acompañado?
¿Estàs acompañada?'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Do we know each other?', '¿Nos conocemos?'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'You''re not from here, are you?', '¿No eres de aquí, verdad?'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'You''re good looking (m./f.)', 'Eres guapo
Eres guapa'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'I like your eyes', 'Me gustan tus ojos.'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'I love you', 'Te quiero'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'I want to spend all my life with you', 'Quiero pasar toda mi vida contigo')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'I''m hungry', 'Tengo hambre'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'I''m thirsty', 'Tengo sed'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Do you have a table?
For how many people?
For 4 people.', '¿Tiene una mesa?
¿Para cuantas personas?
Para cuatro (personas).'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Smokers or not smokers?', '¿Fumadores o no fumadores?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Do you have a table for two?
Yes, this way.', '¿Tiene una mesa para dos?
Si, por aquí.'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'We''re closed', 'Hemos cerrado (haber)'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Sorry, we''re full. (2 sol.)', 'Lo siento, estamos llenos. 
Lo siento, no temenos mesas. '),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'You have to wait.
How long?', 'Hay que esperar
¿Cuanto hay que esperar?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), ' Can you bring a high chair for the baby?', '¿Nos trae una sillita por el bebe?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Can you bring us a menu in English?', '¿Nos trae una carta en ingles?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'I would like (2 sol.)', 'Quiero
Quisiera'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'I would like this (pointing on the menu) (2 sol.)', 'Quiero esto.
Quisiera esto.'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'What does this dish contain?', '¿Que lleva este plato?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Tomato', 'el tomate'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Garlic', 'El ajo'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'What are they eating?', '¿Que estan comiendo, ellos?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'What are you eating?', '¿Que estas comiendo?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'I''m eating meat', 'Estoy comiendo carne'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'What are you recommending?', '¿Que me recomiendia?'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Word', 'la palabra'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Phrase', 'La frase')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'you are clever (m./f.)', 'Eres inteligente/Eres inteligente'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'Are you ready? (m./f.)', '¿Está listo?/¿Está lista?'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'I''m vegetarian (m./f.)', 'Soy vegetariano/Soy vegetariana'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'How/I eat', 'Cómo/Com'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'I don''t eat red meat', 'No como carne roja.'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'I don''t eat seafood', 'No como marisco'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'I don''t eat fish', 'No como pescado'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'I''m allergic to nuts', 'Soy alérgico a las nueces'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'I''m allergic to diary products', 'Soy alérgico a los productos lácteos'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'Enjoy your meal', '¡Que aproveche!'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'Bon appétit!', '¡Buen provecho!'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'It''s too cold', 'Esto está demasadio frio'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'It''s too hot', 'Esto está demasadio caliente'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'It''s too spicy', 'Esto está demasadio picante'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'It''s too burnt', 'Esto está demasadio quemado.'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'It''s terrific', 'Esto está buenísimo'),
((SELECT id FROM Lessons WHERE name = 'S01E18'), 'I''m full/satified', 'Estoy satisfecho')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'There is a cathedral named "La Sagrada Familia" and it''s very famous', 'Hay una catedral que se llama "la sagrada familia" y es muy famosa'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), ' Night club', 'La discoteca'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'The city centre', 'El centro de la ciudad'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'How can I help you?', '¿Cómo puedo ayudarle?'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'Take the second street on the right', 'Tome la segunda calle a la derecha'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'Right!', '¡Vale!'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'Is it quite close?', '¿Está bastante cerca?'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'Can you tell me where is the bank?', '¿Me sabe decir donde está el banco?'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'You''re welcome', 'De nada'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'Can you show me where the cathedral is on this map?', '¿Me puede indicar donde está la cathedral en este plano?'),
((SELECT id FROM Lessons WHERE name = 'S01E19'), 'It''s not far', 'No esta lejos')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Me too', 'yo tambien'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Let''s go', 'vámonos'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'The city centre', 'El centro de la ciudad'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'How can I help you?', '¿Cómo puedo ayudarle?'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Of course!', '¡Claro!'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Please follow me', 'Quieren seguirme'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'I fancy a glass of red wine', 'Me apetece un vaso de tinto'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'bread', 'el pan'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Are you ready to order? (m./f./pl.)', '¿Esta listo para pedir?
¿Esta lista para pedir?
¿Esta listos para pedir?'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'I have a few questions.', 'Tengo algunas preguntas'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Is this dish contains meat?', '¿Este plato lleva carne?'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Mushroom croquettes', 'las croquetas de champiñones'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Poor man potatoes', 'patatas a lo pobre'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Spanish omelette', 'La tortilla española'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'It''s very tasty', 'Está riquissimo'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'a dessert', 'Un postre'),
((SELECT id FROM Lessons WHERE name = 'S01E20'), 'Meatballs in garlic sauce', 'Albondigas')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'Are you ready? 
Of course, I am!
Of course no!', '¿Estas listo?
¡Claro que si!
¡Claro que no!'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'It''s sunny', 'Hace sol'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'What''s the weather like today?', '¿Qué tiempo hace hoy?'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'to do/to make (present)', 'hacer

hago
haces
hace
hacemos
haceis
hacen'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'It''s windy', 'hace viento'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'it''s cold', 'hace frio'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'it''s hot', 'hace calor'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'the weather is good', 'hace buen tiempo'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'the weather is bad', 'hace mal tiempo'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'it''s raining', 'llueve'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'it''s snowing', 'nieva'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'Tomorrow, it''s going to rain', 'Mañana, va a llover'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'Tomorrow, it''s going to snow', 'Mañana, va a nevar'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'Tomorrow, it''s going to be sunny', 'Mañana, va a hacer sol'),
((SELECT id FROM Lessons WHERE name = 'S01E21'), 'What is the weather be tommorow?', '¿Que tiempo va a hacer mañana?')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'How are you today?', '¿Como estás hoy?'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'I''m happy/satisfied', 'Estoy contento'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'We have a reservation', 'Tenemos una reserva'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'a room (spain/l. a.)', 'una habitación
un cuarto (l.a.)'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'Do you have a room? (2 sol.)', 'Quisiera una habitación
¿Tiene usted una habitación?'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'A double room with a double bed', 'una habitación doble con una cama de matrimonio'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'A twin room', 'una habitación doble con dos camas'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'A room with bath', 'una habitación con baño'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'A single room', 'una habitación individual'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'A room with a shower', 'una habitación con ducha'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'A room with view on the sea', 'una habitación con vistas al mar'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'A room with view on the mountain', 'una habitación con vistas a la montaña'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'For how many nights? 
For one night. 
For 2 nights. 
For a week. 
For two weeks', '¿para cuenta noches?
para una noche
para dos noches
para una semana
para dos semanas'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'See you next week', 'Para la semana que viene'),
((SELECT id FROM Lessons WHERE name = 'S01E22'), 'How much is it for a night? 
per person?', '¿Cuanto cuesta por noche?
Por persona.')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'There is a problem with the room', 'Hay un problema con la habitación'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'a program', 'un programa'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'a telegram', 'un telegrama'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'the room is too small', 'la habitación es demasadio pequeña'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'the room is too noisy', 'la habitación es demasadio ruidosa'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'the room is too expensive', 'la habitación es demasadio cara '),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'the room is dirty', 'la habitación está sucia'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'the room is clean', 'la habitación está limpia '),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'the room is too cold', 'hace demasadio frio en la habitación'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'the room is too hot', 'hace demasadio calor en la habitación'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'The shower doesn''t work', 'La ducha no funciona'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'The TV doesn''t work', 'La televisión no funciona'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'The air conditioning doesn''t work', 'El aire acondicionado no funciona'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'I can''t open the window', 'No puedo abrir la ventana'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'To can (present)', 'poder 

puedo
puedes
puede
podemos
podeís
pueden'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'I can''t switch on the light', 'No puedo encender la luz'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'I can''t switch on the TV', 'No puedo encender la television'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'I can''t access internet', 'No puedo acceder a internet'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'There is no toilet paper', 'Hay no papel higiénico'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'There is no towels', 'No hay toallas'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'There is no hot water', 'No hay agua caliente'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'to smell (present)', 'oler

huelo
hueles
huele
olemos
oléis
huelen'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'The room smells bad', 'La habitación huele mal'),
((SELECT id FROM Lessons WHERE name = 'S01E23'), 'I''d like to check out (3 sol.)', 'Me gustaría hacer el check-out
Me gustaría dejar la habitación
Me gustaría pagar')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'a, b, c, ch, d', 'a (a)
b (be)
c (ce)
ch (che) you have to write it now: ce hache (tze)
d (de)'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'e, f, g, h, i', 'e (e)
f (efe)
g (ge) (rre)
h (hache) (hatche)
I (I)'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'j, k, l, ll, m', 'j (jota)
k (ka)
l (ele)
ll (elle) since the 2010 reform, it must be written : ele ele
m (eme)'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'n, ñ, o, p, q', 'n (ene)
ñ (eñe)
o (o)
p (pe)
q (qu)'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'r, s, t, u, v', 'r (ere)  (erre)
s (ese)
t (te)
u (u)
v (uve)'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'w, x, y, z', 'w (uve doble)
x (equis)
y (I griega)  ou ye (since the 2010 reform)
z (ceta)'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Is there a campsite around here?', '¿Hay un un camping por aquí?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'to camp', 'acampar'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'a tent (sp, l.a.)', 'una tienda
una carpa (l. a.)'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Is it possible to camp here?', '¿Se puede acampar aquí?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Is it possible to drink water?', '¿Se puide beber el agua?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Can I rent a towel?', '¿Se puede alquilar una toalla?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Where are the showers?', '¿Donde estan las duchas?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Where are the toilets?', '¿Donde estan los servicios?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Where are the displosal areas/bins?', '¿Donde estan los cubos de la basura?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'rubbish, trash, garbage', 'la basura'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'Where one can buy milk?', '¿Donde se puede comprar leche?'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'caravan/trailer', 'la caravana'),
((SELECT id FROM Lessons WHERE name = 'S01E24'), 'the supermarket', 'el supermercado')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Can I help you?', '¿En qué puedo ayudarle?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'I''m just looking', 'solo estoy mirando'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Do you want it? (m./f.)', '¿lo/la quiere?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'I''m not sure (m./f.)', 'No estoy seguro/segura'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'I''ll come back later', 'vuelvo mas tarde'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'I''ll take it!', '¡Me lo llevo!'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'How much does it cost?', '¿Cuánto cuesta?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Can I pay by credit card?', '¿Puedo pagar con tarjeta de crédito?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Can I see an ID?? (2 sol.)', '¿Puede ver su DNI? (Documento Nacional de Identitad)
¿Puede ver su pasaporte?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Here you go', 'Aqui tiene'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'A hat', 'Un sombrero'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'A receipt', 'Un recibo'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'A bag', 'Un bolsa'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Can you give me a bag', '¿Me puede dar una bolsa?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Can I try this on, please?', '¿Puedo probarme esto, por favor?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'to try (on) (present)', 'probar(se)

me pruebo
te pruebas
se prueba
nos probamos
os probáis
se prueban'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'where are the changing/fitting rooms?', '¿Donde estan los probadores?'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'It fits me', 'Me queda bien'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'Does it fit me?. 
Yes, it fits you', '¿Me queda bien?
Si le queda bien.'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'It''s too big', 'Es demasadio grande'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'It''s too small', 'Es demasadio pequeña'),
((SELECT id FROM Lessons WHERE name = 'S01E25'), 'bag vs. handbag', 'una bolsa
un bolso')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'put me 4 slices of ham', 'póngame cuatro lonchas de jamon (ponerse)'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'give me me 4 slices of ham', 'deme cuatro lonchas de jamon (darse)'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'a piece of cheese', 'un trozo de queso'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'a kilo of cheese', 'un kilo de queso'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'half a kilo of cheese', 'medio kilo de queso'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'a little of that', 'un poco de eso'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'What''s that?', '¿Qué es eso?'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'Can I try it?', '¿Puedo probarlo?'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'A little more/ A liitle less', 'Un poco más
Un poco menos'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'this (generic) that (generic)', 'esto
eso'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'Ok/like this', 'vale asi'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'this bag', 'este bolso
esta bolsa'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'Do you have another cheaper?', '¿Tiene algo mas barato?'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'I take it', 'Me lo llevo.'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'that bracelet/that hat', 'esa pulsera/ese sombrero'),
((SELECT id FROM Lessons WHERE name = 'S01E26'), 'It''s too expensive', '¡es demasiado caro!')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'money', 'el dinero'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'to change', 'cambiar'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'to take out', 'sacar'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'to sign', 'firmar'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'I want to change money', 'Quiero cambiar dinero'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'I need to change money', 'Necesito cambiar dinero'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'to need', 'necesitar'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'Can one change money here?', '¿Se puede cambiar dinero aquí?'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'How much do you want to change?', '¿Cuenta quiere cambiar usted?'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), '1 dollar, 100 dollars', 'un dólar, cien dólares'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), '50 sterling pounds', 'cincuenta livras'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), '20 euros (pronunciation!)', 'veinte euros (é-ou-ro)'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'traveller''s cheques', 'cheques de viajero'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'Can I withdraw money with my credit card?', '¿Puedo sacar dinero con mi tarjeta de crédito?'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'Where do I sign?', '¿Donde firmo?'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'You need to sign here', 'Necesita firmar aquí.'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'ATM', 'cajero (automático)'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'The ATM has kept my card', 'El cajero se ha tragrado mi tarjeta'),
((SELECT id FROM Lessons WHERE name = 'S01E27'), 'to swallow', 'tragarse')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'I''m not well', 'no estoy bien'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'I feel well', 'Me siento bien'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'I''m well', 'Estoy bien'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'to feel (present)', 'sentir

siento
sientes
siente
sentimos
sentis
sienten'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'I don''t feel well. I''m ill', 'No me siento bien. Estoy enfermo'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'to hurt (present)', 'doler

duelo
dueles
duele
dolemos
doléis
duelen'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'Where does it hurt you?', '¿Donde le duele?'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'I have a sore head', 'Me duele la cabeza'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'I have a stomach ache', 'Me duele el estómago'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'Sore throat (2 sol.)', 'un dolor de garganta
me duele la garganta'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'the leg(s)', 'la(s) pierna(s)'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'the arm(s)', 'el(los) brazo(s)'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'My arms are sore', 'Me duelen los brazos'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'eye', 'el ojo'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'nose', 'la nariz'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'ear', 'la oreja'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'shoulder', 'el hombro'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'foot(feet)', 'el pie
los pies'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'mouth', 'la boca'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'hand', 'la mano'),
((SELECT id FROM Lessons WHERE name = 'S01E28'), 'neck', 'el cuello')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'I have a headache (2 sol.)', 'Me duelle la cabesa
Tengo dolor de la cabesa'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'Do you have something for headaches?', '¿Tiene algo para el dolor de cabesa?'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'cough', 'la tos'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'infection', 'una infección'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'a rash', 'un sapurllido'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'a sunburn', 'una quemadura de sol'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'to burn', 'quemar'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'Do you have something for sunburns?', '¿Tiene algo para una quemadura de sol?'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'I''m dizzy', 'Estoy mareado'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'I can''t sleep', 'No puedo dormir.'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'to sleep (present)', 'dormir

duermo
duermes
duerme
dormimos
dormis
duermen'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'to breath', 'respirar'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'a pill (2 sol.)', 'una píldora
un comprimido'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'cream', 'la crema'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'You need to take the pills three times a day before eating', 'Necesita tomar estas piladoras tres veces al dia antes de comer'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'you need to put this cream twice a day', 'Necesita poner esta crema dos veces al dia'),
((SELECT id FROM Lessons WHERE name = 'S01E29'), 'after eating', 'después comer')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'A football game', 'el partido de fútbol'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'Who is going to win this afternoon?', '¿Que van a ganar esta tardes?'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'more or less', 'más o menos'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'three to zero', 'tres a cero'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'to win', 'ganar'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'champion (s./pl.)', 'el campeón/campeones'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'Is it your first time in Scotland? (pl. informal)', 'esta la primara vez que estaís en Escocia?'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'Yes, it''s the first time we come in Scotland', 'Si, esta la primera vez que hemos venido a Escocia'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'The people are very nice', 'La gente son muy amable'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'Come on!', '¡Venga!'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'goal', 'gol'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'The referee is an amateur', 'El arbitro es casero'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'Is the football very important in Spain?', '¿Es muy importante el futbol en España?'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'Is the most important sport the same as in the UK', 'Is the most important sport the same as in the UK'),
((SELECT id FROM Lessons WHERE name = 'S01E30'), 'Which are the most important teams?', '¿Cuáles son los equipos mas importantes?')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'to stop', 'parar'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'the bus stop', 'La parade de autobuses'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'A glass of beer', 'una caña'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'café noisette', 'un cortado'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'bring us the bill please?', '¿Nos trae la cuenta por favor?'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'A tobaconist', 'El estanco'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'A stamp', 'sello'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'postcards', 'tarjetas postales'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'How can I help you? (sing./plural)', '¿En que puedo aydarles?
¿En que puedo servirles?'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'you''re welcome', 'de nada
no hay de que'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'Hi (abbrev.)', '¡Buenas!'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'something', 'algo'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'Thank you very much', 'Muchas gracias'),
((SELECT id FROM Lessons WHERE name = 'S01E31'), 'Thank you very very much', 'muchisimas gracias')
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
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'We are going to the theater', 'Vamos al teatro'),
((SELECT id FROM Lessons WHERE name = 'S02E05'), 'We are going partying (4 versions x 2)', 'vamos de juerga
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

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'the children are happy', 'los niños están contentos'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'the women is happy', 'la mujer está contenta'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'the black book', 'el libro negro'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'the black house', 'la casa negra'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'the cats are black', 'los gatos son negros'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'the white cat', 'el gato blanco'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'the white pigeon/dove', 'la paloma blanca'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'there are a lot of interesting things', 'hay muchos cosas interesantes'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'Mark is intelligent, Kara is also intelligent', 'Mark is inteligente, Kara es también inteligente'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'two important persons', 'dos personas importantes'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'a tall women', 'una mujer alta'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'a small person', 'una persona baja'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'thin/slim', 'delgado/a/os/as'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'fat', 'gordo/a/os/as'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'The Lottery', 'El Gordo '),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'dark-skinned/dark-hair', 'moreno/a'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'blond', 'rubio/a'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'hard-working', 'trabajador/a/es/as'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'blue', 'azul//es/es'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'talkative', 'charlatán/a/es/as'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'difficult', 'dificil//es/es'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'easy', 'fácil//es/es'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'happy', 'feliz//es/es'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'natural', 'natural//es/es'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'ugly', 'feo/a/os/as'),
((SELECT id FROM Lessons WHERE name = 'S02E08'), 'pretty/handsome/good looking', 'guapo/a/os/as')
;


INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'a lot/much', 'mucho'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'A lot of time', 'mucho tiempo'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'A lot of food', 'mucha comida'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'A lot of black cats', 'muchos gatos negros'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'A lot of white doves', 'muchas palomas blancas'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'How much?/ As much?', 'Cuánto'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'As much food!', '¡Cuà́nta comida!'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'I haven''t seen you for ages!', '¡Cuà́nto tiempo sin verte!'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'How many cats are there?', '¿Cuántos gatos hay?'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'How many doves are there?', '¿Cuántas palomas blancas hay?'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'possessive adjectives', 'mi/mis
tu/tus
su/sus
vuestro/a/os/as
nuestro/a/os/as'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'He has black hairs', 'tiene el pelo negro'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'He has white hairs', 'tiene el pelo blanco'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'He has brown hairs(3 sol)', 'tiene el pelo castaño (brown)
tiene el pelo negro (black)
es moreno'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'he has brown eyes (2 sol)', 'tiene los ojos castaños
tiene los ojos marrones'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'he has green eyes', 'tiene los ojos verdes'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'he has blue eyes', 'tiene los ojos azules'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'He has red hairs', 'es pelirojo'),
((SELECT id FROM Lessons WHERE name = 'S02E09'), 'red', 'rojo/a')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'to carry/to wear', 'llevar'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'Mark wears a t-shirt', 'Mark lleva una camiseta'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'a sweater', 'un jersey'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'an item of clothing', 'la ropa'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'glasses', 'las gafas'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'sun glasses', 'las gafas de sol'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'red - black - white - grey', 'rojo - negro - blanco -gris'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'he has grey hairs', 'tiene el pelo gris'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'to behave', 'comportarse'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'he behave himself', 'se comporta bien'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'famous', 'famoso/a'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'well known', 'conocido/a'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'a role', 'un papel'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'He was born in 1945', 'nació en 1945'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'he died en 2003', 'murió en 2003'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'a footballer', 'un futbolista'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'South-Africa', 'Sudàſfrica'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'Peace Nobel Prize', 'Premio Nobel de la Paz'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'She is 81 years old', 'Tiene ochenta y un años.'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'A palace', 'Un palacio'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'She is quite young', 'Es bastante joven.'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'He has a beard', 'Lleva barba'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'to give them a gift', 'darles regalos'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'the grandfather', 'el abuelo'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'the great-grandfather', 'el bisabuelo'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'sometimes', 'a veces'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'always', 'siempre'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'many people say that...', 'mucha gente dice que...'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'so...', 'asi que..'),
((SELECT id FROM Lessons WHERE name = 'S02E10'), 'to interpret', 'interpretar')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'We are going to begin', 'Vamos a empezar'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'What are you going to do in 2008?', '¿Que vas a hacer en 2008?'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to do more exercice', 'voy a hacer más ejercicio'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'What are you going to buy?
I''m going to save money for buy a car', '¿Qué vas a comprar?
voy a ahorrar dinero para comprar un coche.'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to learn more Spanish', 'voy a apprender más español'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to study more', 'voy a estudiar más'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to stop smoking', 'voy a dejar de fumar'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to stop eating too much chocolate', 'voy a dejar de comer demasiado chocolate'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'This year, I''m going to get fit!', '¡Este año, voy a ponerme en forma!'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to learn a little Russian, Chinese and japonese', 'voy a apprender un poco de ruso, de chino, y de japonés'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to improve my Spanish', 'voy a mejorar mi español'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'I''m going to have a shower (2 replies)', 'voy a ducharme
me voy a duchar'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'to write a letter', 'escribir una carta'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'to send a postcard to my mother', 'enviar una tarjeta postal a mi madre'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'to play golf', 'jugar al golf'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'to spend a week of holidays in Mallorca', 'pasar une samana de vacaciones en Mallorca'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'to buy a computer', 'comprar un ordenador'),
((SELECT id FROM Lessons WHERE name = 'S02E11'), 'to do my home work (2 poss)', 'hacer mis deberes/tareas')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'hablar - regular 1 (present)', 'hablo
hablas
habla
hablamos
habláis
hablan'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'comer - regular2 (present)', 'como
comes
come
comemos
coméis
comen'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to sell', 'vender'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to learn', 'apprender'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to live - regular 2 (present)', 'vivo
vives
vive
vivimos
vivís
viven'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to open/open', 'abrir/abierto'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to wash yourself (present)', 'me lavo
te lavas
se lava
nos lavamos
os laváis
se lavan'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to drink', 'beber'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to understand', 'comprender'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to believe', 'creer'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to break', 'romper'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'this house is for sale', 'se vende esta casa'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to cover', 'cubrir'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to decide', 'decidir'),
((SELECT id FROM Lessons WHERE name = 'S02E12'), 'to suffer', 'sufrir')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'the preterit tense', 'el pretérito indefinido'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'I spoke to my mother', 'hablé con mi madre'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'yesterday, I sang a song', 'Ayer, canté una canción'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'I danced with my friend', 'Bailé con mi amigo/a'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'Did you speak Spanish yesterday? Yes, I spoke Spanish yesterday', '¿Hablaste español ayer?
Si, hablé español ayer.'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'Did you sing a song yesterday? Yes, I sang a song yesterday', '¿Cantaste una canción ayer?
Si, canté una canción ayer.'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'hablar (preterit)', 'hablé
hablaste
habló
hablamos
hablasteis
hablaron'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'bailar (preterit)', 'bailé
baliaste
bailó
bailamos
baliasteis
baliaron'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'cantar (preterit)', 'canté
cantaste
cantó
cantamos
cantasteis
cantaron'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'during the holidays', 'durante las vacaciones'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'last week', 'la samana pasada'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'two years ago', 'hace dos años'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'to listen to music', 'escuchar música'),
((SELECT id FROM Lessons WHERE name = 'S02E13'), 'three weeks ago', 'hace tres semanas')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'to go up/to ascend', 'subir'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'comr (preterit)', 'comí
comiste
comió
comimos
comisteis
comieron (fr: comiéron)'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'lunch', 'la comida'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'dinner', 'la cena'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'Using preterit tense', 'Something in the past which happened once'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'subir (preterit)', 'subí
subiste
subió
subimos
subisteis
subieron'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'to open', 'abrir'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'I went', 'fui'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'friend', 'amigo'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'boyfriend/girlfriend', 'novio/novia'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'he drank a beer', 'bebío una cerveza'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'he didn''t suffer much', 'no sufrío mucho'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'they lived in Mexico', 'vivieron en Mexico'),
((SELECT id FROM Lessons WHERE name = 'S02E14'), 'you (inf.) ran to the market', 'corriste al mercado')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'what did you do?', '¿qué hiciste?'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'hacer (preterit)', 'hice
hiciste
hizo
hicimos
hicisteis
hicieron'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'What did you do with Antionio? We went to the cinema', 'Que hiciste con Antonio? Fuimos al cine.'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'ir/ser (preterit)', 'fui
fuiste
fue
fuimos
fuisteis
fueron'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'What did you do with your wife? 
We didn''t do much as my wife was ill. 
But we watched a movie on TV', '¿Qué hiciste con tu esposa? 
No hicimos mucho porque mi esposa esatba enferma.
Pero vimos una película en la televisíon'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'ver (preterit)', 'vi
viste
vio
vimos
visteis
vieron'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'dar (preterit)', 'di
diste
dio
dimos
disteis
dieron'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'Did Antonio give you a present? 
Yes, he gave me chocolate and flowers.', '¿Antonio te dio un regalo? 
Sí, me dio chocolate y flores'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'estar (preterit)', 'estuve
estuviste
estuvo
estuvimos
estuvisteis
estuvieron'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'romantic', 'romántico'),
((SELECT id FROM Lessons WHERE name = 'S02E15'), 'prononciation -ca- -e- -ci- -co- -cu-', '-ca- as in cat
-ce- th as in think
-ci- th as in theater
-co- c as in cottage
-cu- c as in cook

z always as th')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'ir/ser (preterit)', 'fui
fuiste
fue
fuimos
fuisteis
fueron'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'pensar (present & preterit)', 'pensé
pensaste
pensó (stress)
pensamos
pensasteis
pensaron

pienso (stress)
piensas
piensa
pensamos
pensais
piensan'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'to get up (preterit)', 'me levanté
te levantaste
se levantó
nos levantamos
os levantasteis
se levantaron'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'to shower (preterit)', 'me duché
te duchaste
se duchó
nos duchamos
os duchasteis
se ducharon'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'A what time, did you leave house?
I left at half pass eight', '¿A qué horas saliste? 
Salí a las ocho y media.'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'At what time, did you arrive at the university?
I arrived at 10 o''clock.', '¿A que horas, llegaste a la universidad?
Llegué a las dies.'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'I played at football', 'Jugué al futbal'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), ' to play (an instrument) (preterit)', 'toqué
tcaste
tocó
tocamos
tocasteis
tocaron'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'I was born in 1963', 'naći en 1963'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'He died', 'murió'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'we like music', 'nos gusta la música'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'reflexive pronouns', 'me
te
se
nos
os
se'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'to close (preterit/present)', 'cerré
cerraste
cerró
cerramos
cerrasteis
cerraron

cierro
cierras
cierra
cerramos
cerráis
cierran 
'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'to meet/find (preterit/present)', 'encontré
encontraste
encontró
encontramos
encontrasteis
encantraron

present:
o -> ue'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'to return (preterit/present)', 'volví
volviste
volvió
volvimos
volvisteis
volvieron

present:
vuelvo'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'to wake up (preterit/present)', 'me desperté
te despertaste
se despertó
nos despertamos
os despertasteis
se despertaron

present:
me despierto'),
((SELECT id FROM Lessons WHERE name = 'S02E16'), 'Ce fut la goutte qui fit déborder le vase', 'esa fue la gota que colmó el vaso')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'He was born in Austria in 1756', 'Nació en Austria en 1756'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'He played violin in a concert in Germany for the first time at the age of 6', 'Tocó violín en un concierto en Alemania por primera vez a la edad de seis años'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Holland / Netherlands', 'Holanda / Los Países Bajos'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'He wrote many very famous musical works ', 'Escribío muchas obras musicales muy conocidas'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'He died in Vienna en 1791 at the age of 35', 'Murío en Viena en 1791 a la edad de treinta y cinco años'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'He is one of the most known American artist', 'Es uno de los artistas estadounidenses más conocidos'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'His album "the stranger" won a first Grammy in 1977', 'Su albúm "the stranger" ganó un premio Grammy en 1977'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'to win/to earn', 'ganar'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'one of the most famous song of this record is "Just the way you are"', 'una de las canciones mas conocidas de este disco se llama "Just the way you are"'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'to come (preterit)', 'venir 

vine
viniste
vino
vinimos
vinisteis
vinieron
'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'He came yesterday to see us', 'vino a vernos ayer'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'to say (preterit)', 'decir

dije
dijiste
dijo
dijimos
dijisteis
dijeron'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'to translate (preterit)', 'traducir

traduje
tradujiste
tradujo
tradujimos
tradujisteis
tradujeron'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'A road under repair', 'carretera en obras'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'the age', 'la edad'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), '(musical) work', 'una obra'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'a prize', 'un premio'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'chemistry', 'la química'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'she got married', 'casarse -> se casó'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'twin children', 'los hijos gemelos'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'the prime minister (m./f.)', 'el primer ministro/la primera ministra'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'to carry out/execute a role', 'ejercer un cargo'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'until', 'hasta'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'actor/actress', 'actor/actriz'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'Greece', 'Grecia'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'to divorce', 'divorciarse'),
((SELECT id FROM Lessons WHERE name = 'S02E17'), 'to fill to the brim/to overfill', 'colmar')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E18'), 'use of imperfect', 'was/were doing something
used to do something
would do something (past)'),
((SELECT id FROM Lessons WHERE name = 'S02E18'), 'cantar (imperfect)', 'cantaba
cantabas
cantaba
cantábamos
cantabais
cantaban
'),
((SELECT id FROM Lessons WHERE name = 'S02E18'), 'to dance (imperfect)', 'bailaba
bailabas
bailaba
bailábamos
bailabais
bailaban'),
((SELECT id FROM Lessons WHERE name = 'S02E18'), 'they used to speak', 'hablaban'),
((SELECT id FROM Lessons WHERE name = 'S02E18'), 'to practise (imperfect)', 'praticaba
praticabas
praticaba
praticábamos
praticabais
praticaban'),
((SELECT id FROM Lessons WHERE name = 'S02E18'), 'shark', 'el tiburón'),
((SELECT id FROM Lessons WHERE name = 'S02E18'), 'ray (fish)', 'la raya')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'to sell (imperfect)', 'vender

vendía 
vendías 
vendía
vendíamos
vendíais
vendían'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'I was eating', 'comía'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'I was drinking a coffee', 'bebía un café'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'I was taking a coffee', 'tomaba un café́. (tomar)'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'to live (imperfect)', 'vivir

vivía
vivías
vivía
vivíamos
vivíais
vivían'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'ir (imperfect)', 'ir

iba
ibas
iba
ibamos
íbais
iban'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'ser (imperfect)', 'ser

era
eras
era
éramos
érais
eran'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'ver (imperfect)', 'ver

veía
veías
veía
veíamos
veíais
veían'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'it was difficult', 'era dificil'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'it was two o''clock', 'eran las dos'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'it was noon', 'era mediodía'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'to open (imperfect)', 'abrir

abría
abrías
abría
abríamos
abríais
abrían'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'estar (imperfect)', 'estar

estaba
estabas
estaba
estábamos
estabais
estaban'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'he was wearing a blue jacket', 'llevaba una chaqueta azul'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'he was very happy', 'estaba muy contento'),
((SELECT id FROM Lessons WHERE name = 'S02E19'), 'after so much work we were tired', 'Después de tanto trabajo estábamos cansados')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'we are going to travel to Mexico', 'vamos a viajar a México'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'you (pl) go to dance all night long', 'vais a bailar toda la noche'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'we''re eating paella every day', 'comos paella todos los días'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'Are you opening the windows?', '¿Abris la ventana?'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'to open (present)', 'abrir

abro
abres
abre
abrimos
abrís
abren'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'Are they writing a letter to their mother?', '¿Escriben una carta a su madre?'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'I''m singing/I sang. He''s singing/He sang', 'canto/cantó
canta/canté'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'we live in Zaragoza but we are going to go to Córdoba during the holidays', 'vivimos en Zaragoza pero vamos a ir a Córdoba durante las vacaciones '),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'we were dancing with our friends when Jorge arrived, he said to us hello. 
But he was not very happy, so he left.', 'bailábamos con nuestros amigos, cuándo llegó Jorge, nos dijo "hola". 
Pero no estaba muy contento, así que salió'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'last year we went to Venezuela and we saw lots (of things)', 'el año pasado fuimos a Venezuela y vimos muchas cosas '),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'we went for a run/drive in the car', 'dimos una vuelta en coche'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'the two children were born in 1998', 'los dos niños nacieron en 1998'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'when I was young I played/used to play the guitar', 'cuando era joven tocaba la guitarra'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'before you used to get up early, but now you get up late', 'antes te levantabas temprano, pero ahora te levantas tarde'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'I open the door', 'Abro la puerta'),
((SELECT id FROM Lessons WHERE name = 'S02E20'), 'when we were children we spoke/used to speak French with our grandmother, but she died in 1984 and afterwards it was more difficult', 'cuando éramos niños hablábamos francés con nuestra abuela, pero murió en 1984 y después era más difícil')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'What have you done during these holydays?
I went to a concert with Antonio', '¿Que hiciste durante las vacaciones?
Fui a un concierto con Antonio'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'What movie did you watch?', '¿Qué película visteis?'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'What was the weather? (2 poss.). 
It was sunny but it wasn''t very warm. 
At least it didn''t rain.', '¿Qué tal el tiempo?
¿Qué tempio hacía?
hacía sol pero no hacía mucho calor
Por lo menos no llovía'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'We went to a party, my friend (f.) was celebrating her birthday', 'fui a une fiesta - mi amiga celebraba su cumpleaños'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'What present did you give her? 
I give her a book and a bracelet', '¿Qué le diste como regalo?
Le di un libro y una pulsera'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'this present is for you (give sthg to someone, destination)', 'este regalo es para tí.'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'This house is for Marta (give sthg to someone, destination)', 'esta case es para Marta'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'This card is for you (pl. f.) (give sthg to someone, destination)', 'esta carta es para vosostras'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'I''m leaving for France (the destination you are heading off to, destination)', 'salgo para Francia'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'This afternoon, I''m leaving for Madrid (the destination you are heading off to, destination)', 'Esta tarde, salgo para Madrid'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'Thanks for the present (exchange thanks)', 'gracias por el regalo'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'Do you want to exchange my CD with your book?', '¿Quieres cambiar mi CD por tu libro?'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'I''m going to buy the house for 150,000 euros (exchange).', 'Voy a comprar la casa por 150,000 euros.'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'we''re heading for Venezuela tomorrow', 'salimos para Venezuela mañana'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'yesterday they set off for England ', 'ayer salieron para Inglaterra '),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'I''m (ex)changing $200 for £100', ''),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'when I was young I used to set off for Spain in July', 'cuando era joven salía para España en julio '),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'we went off to the disco at eleven', 'fuimos para la discoteca a las once'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'thank you for the present you gave me', 'gracias por el regalo que me diste'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'Uses of para', 'to give something to someone (the destination is)
- esta carta es para vosotros
- este regalo es para ti
the destination you are heading to
- salgo para Francia
- este tarde salgo para Madrid'),
((SELECT id FROM Lessons WHERE name = 'S02E21'), 'Uses of por', 'Thank you for
- gracias por la musica
in exchange for
- ¿Queries cambiar el CD por tu libro?
- voy a comprar la casa for 150,000 euros.')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'I''m here for helping you', 'estoy aquí para ayudarte'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'I''m here for learning Spanish', 'Estoy aquí/lista para apprender español'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'you''re going to a party for seeing your friends', 'vas a una fiesta para ver a tus amigos'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'I''m going to a party for eating and drinking', 'voy a una fiesta para comer y beber'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'for celebrating (2 sol.)', 'para celebrar/festejar'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'for giving a present to my friend', 'para dar un regalo a mi amigo'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'to meet new friends', 'para conocer a nuevos amigos'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'Why do you go to the party?', '¿Por qué vas a la fiesta?'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'I''m going to the party because I want to see my friend', 'Voy a la fiesta porque quiero ver a un amigo'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'Why do you go to the party? (what is the purpose)', '¿Para qué vas a la fiesta?'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'to give a present to someone (2 sol.)', 'dar un regalo a alguien
ragalar'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), ' I got a book (as present)', 'me regalaron un libro'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'My mother gave me a book', 'mi madre me regaló un libro'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'Happy birthday!', '¡Feliz cumpleaños!'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'Joyeux anniversaire. 
Joyeux anniversaire. 
We wish you all .. happy birthday', '¡cumpleaños feliz !
¡cumpleaños feliz !
¡te deseamos todos!
¡cumpleaños feliz !'),
((SELECT id FROM Lessons WHERE name = 'S02E22'), 'May you have many more (birthdays)!', '¡Que cumplas muchos más!')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'uses of for', 'gracias por (exchange)
cambiar tu CD por mi libro (exchange)
por la noche (time)
por avión (sending by)
por aquí (around)
por el túnel (along, through)
por mi amigo (on behalf of)'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'tomorrow morning', 'mañana por la mañana'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I go to the market in the morning ', 'voy al mercado por la mañana'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'In the afternoon, I go to the swimming pool', 'por la tarde, voy a la piscina'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'during the night, I sleep', 'por la noche, duermo'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'We send this letter by plane/I travel by plane', 'Enviamos esta carta por avión/viajo en avión'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I go by feet', 'voy a pie'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'by plane/by train/by boat/by mail/by email/by fax', 'por avión
por tren
por barco
por correo
por correo electrónico/por email
por fax'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'to talk by phone', 'hablar por teléfono'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'Is there a bank around here?', '¿Hay un banco por aquí?'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I walk along the street', 'camino por la calle'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'through the mountains', 'por las montanas'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'We walk along the beaches for the holidays', 'caminamos por las playas durent las vacaciones'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'through a tunnel', 'por un túnel'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'Around here/over there', 'Por aquí/por allí.'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'Everywhere', 'por todas partes'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'Our students from all around the world', 'Nuestros alumnos por todas partes del mundo'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'He has travelled all around the world', 'ha viajado por todo el mundo'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I do it for you', 'lo hago por tí'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I do it out of love', 'lo hago por amor'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I sing for my friend (on behalf of, because he can''t sing now)', 'canto por mi amigo'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I''m going to sing a song for Antonio (on behalf)
I''m going to sing a song for Antonio (for)', 'voy a cantar una canción por Antonio
voy a cantar una canción para Antonio'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'I''m going to buy a present on behalf of my father
I''m going to buy a present for my father', 'voy a comprar un regalo por mi padre
voy a comprar un regalo para mi padre'),
((SELECT id FROM Lessons WHERE name = 'S02E23'), 'For me, a coffee', 'Para mí, un café́.')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'perfect tense usage', 'have done sthg'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'past participle', 'hablar -> hablado
comer -> comido
vivir -> vivido'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'haber (present)', 'he
has
ha
hemos
habéis
han'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'you have bought a house', 'has comprado una case'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'Miguel has bought a house', 'Miguel ha comprado una casa'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'he has lived in Spain', 'ha vivido en España'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'What have you done today?', '¿Qué has hecho hoy?'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'I''ve played with my two sons', 'he jugado con mis dos hijos'),
((SELECT id FROM Lessons WHERE name = 'S02E24'), 'I have prepared some materials for the podcast', 'he preparado algunos materiales para el podcast')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'using the perfect tense', 'has done sthg
Immediate past: ayer, esta mañana, anoche, esta tarde, la semana pasade
ya/already'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'you have drunk a glass of wine', 'Has bebido una copa de vino'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I have drunk a glass of water', 'He bebido un vaso de agua'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'this morning, I sang a song', 'Esta mañana, he cantado una canción'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'yesterday, I ate paella', 'Ayer, he comido paella'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'last night, I went out with my friend', 'anoche, he salido con mis amigos'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'last week, we visited Madrid', 'la semana pasado, hemos visitado Madrid'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'two week ago, you began the course', 'hace dos semanas, has empezado el curso'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'Have you already eaten?', '¿Ya has comido?'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'Have you dinner?', '¿Ya has cenado?'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I have already drunk a glass of water', 'Ya he bebido un vaso de agua'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I have already visited Spain', 'Ya he visitado España'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'past participle open/close', 'abierto/cerrado'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I have open the window', 'he abierto la ventana'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'have you said?', '¿Has dicho..?'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'Have I said it well?(decir)', '¿Lo he dicho bien?'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'We have already written the letter (escribir)', 'Ya hemos escrito la carta'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I have done my home works (hacer)', 'he hecho mis deberes'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I have seen the film (ver)', 'he visto la película'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'this morning, we saw the monument', 'Esta mañana, hemos visto el monumento'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'Sergio and Montse have drunk all the water', 'Sergio y Montse han bebido todo el agua'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'We have lived in Asturia', 'Hemos vivido an Asturia'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I''ve not finished yet', 'tovadia no he terminado'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I have spoken with Miguel this morning', 'he hablado con Miguel dos veces esta mañana'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I''ve gone to the supermarket (ir)', 'He ido al supermercado'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I''ve read a good book (leer)', 'He leido un buen libro'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'the dog died this morning (morir)', 'el perro ha muerto esta mañana'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'he has put the book sur la table (poner)', 'He puesto el libro en la mesa'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'The car has broken down (romper)', 'El coche se ha roto'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'I''ve been a teacher but now I''m an interpret (ser)', 'He sido profesor pero ahora soy interprete'),
((SELECT id FROM Lessons WHERE name = 'S02E25'), 'They returned from France this afternoon (volver)', 'han vuelto de Francia esta tarde')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'Have I pronounce it correctly?', '¿Lo he pronunciado bien?'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'Did I write it correctly?', '¿Lo he escrito bien?'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'I''ve visited Spain', 'He visitado España'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'I''ve written a letter', 'He escrito una carta'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'This morning, I wrote a letter', 'Esta mañana, he escrito una carta'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'This week, we have learned a lot', 'Esta semana hemos aprendido mucho'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'Did you like the film? (just after having seeing it)', '¿Te ha gustado la película?'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'Did you like the film? (a week ago)', '¿Te gustó la película?'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'What did he say to you today?', '¿Qué te ha dicho hoy?'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'What did he say to you en 1993?', '¿Qué te dijo en 1993?'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'This month, this year', 'Este me, este año'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'A week ago, we started to learn Spanish', 'Hace una semana, hemos empezado a estudiar español'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'I have already done my homework', 'ya he hecho mis deberes'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'I have already visited Madrid', 'Ya he visitado Madrid'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'Have you already visited Madrid?/Have you visited Madrid yet?', '¿Ya has visitado Madrid?'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'Last week we went to Madrid', 'La semana pasada fuimos a Madrid .
This is a straightforward event which happened in the past. 
The preterit tense of the verb ir is used'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'I lost my passport last year ', 'Perdí mi pasaporte el año pasado 
A clear example of a completed action in the past.'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'I''ve not done much today ', 'No he hecho mucho hoy 
Another “have done something” construction necessitating the perfect tense'),
((SELECT id FROM Lessons WHERE name = 'S02E26'), 'I wasn''t well this week ', 'No he estado bien esta semana 
Esta semana is the trigger for the perfect tense')
;

INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'bus/coach', 'un autobús/un autocar'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'station', 'la estación'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'bus stop (2 sol.)', 'la parada de autobús
la parada de autobuses'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'ticket office', 'la taquilla'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'timetable', 'el horario'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'ticket', 'un billete'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'a single ticket', 'un billete sencillo'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'a return ticket', 'un billete de ida y vuelta'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'platform', 'el andén'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'first class/second class', 'primera clase
secunda clase'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Where can I buy a ticket?', '¿Donde puedo comprar un billete?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'I want a ticket for Madrid', 'Quiero un billete para Madrid'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'I want to go to Madrid', 'quiero ir a Madrid'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'I would like to buy a return ticket for Barcelona', 'Quisiera comprar un billete de ida y vuelta para Barcelona'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Is this train direct?', '¿Este tren es directo?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Is this train for Barcelona? (2 sol.)', '¿Este tren es para Barcelona?
¿Este tren va a Barcelona?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'The train is leaving the station', 'el tren sale de la estación'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'When does the train for Barcelona leave?', '¿A qué hora, sale el tren para Barcelona?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'When does the bus for Cuzco arrive?', '¿A qué hora,llega el autobús para Cuzco ?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Has the bus for Cuzco arrive yet?', '¿Ya, ha llegado el autobús par Cuzco?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Does the train for Guadalajara leave from this platform?', '¿El tren par Guadalajara sale de este andén?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Do I have to book?', '¿Tengo que reservar?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'The bus leaves at ten o''clock', 'El autobus sale a las diez'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'The tren for Cuenca leaves at half past two', 'El tren para Cuenca sale a las dos y media'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'The coach from Madrid arrives at seven o''clock', 'El autocar desde Madrid llega aqui a las siete'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'We are going to arrive in Buenos Aires at nine o''clock in the morning', 'Vamos a llegar a Buenos Aires a las nueve de la mañana'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Can you tell me how much a return ticket to Caracas is?', '¿Me puedo decir cuanto vale/es un billete de ida y vuelta para Caracas?'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'The train has already left', 'El tren ya ha salido'),
((SELECT id FROM Lessons WHERE name = 'S02E27'), 'Last week, the bus didn''t arrive at half past ten', 'La semana pasada, el autobus no llego a las diez y media')
;

/*
INSERT INTO Questions (lesson_id, question, answer)
VALUES 
((SELECT id FROM Lessons WHERE name = ''), '', ''),
;
*/

