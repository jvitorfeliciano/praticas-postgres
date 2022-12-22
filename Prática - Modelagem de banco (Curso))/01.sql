CREATE TABLE students (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL
)

CREATE TABLE classes(
    id  SERIAL NOT NULL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
)
CREATE TABLE modules(
     id  SERIAL NOT NULL PRIMARY KEY,
     name TEXT UNIQUE  NOT NULL,
)

CREATE TABLE education (
   id SERIAL NOT NULL PRIMARY KEY,
   student_id INTEGER NOT NULL  REFERENCES students(id),
   class_id INTEGER NOT NULL REFERENCES classes(id),
   start_date DATE NOT NULL DEFAULT NOW(),
   end_date DATE
 
)
CREATE TYPE perfomance_status AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas')

CREATE TABLE projects(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    student_id INTEGER NOT NULL  REFERENCES students(id),
    module_id   INTEGER NOT NULL  REFERENCES modules(id),
    delivery_date DATE NOT NULL DEFAULT NOW(),
    perfomance perfomance_status
)
