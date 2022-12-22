CREATE TABLE companies(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    acronym VARCHAR(3) NOT NULL
)

CREATE TABLE airports(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    acronym VARCHAR(3) NOT NULL
)

CREATE TABLE flights(
    id SERIAL NOT NULL PRIMARY KEY,
    company_id INTEGER NOT NULL REFERENCES companies(id),
    departue_airport_id  INTEGER NOT NULL REFERENCES airports(id),
    arrival_airport_id  INTEGER NOT NULL REFERENCES airports(id),
    acronym VARCHAR(7) NOT NULL,
    departure_time TIMESTAMP  NOT NULL,
    arrival_time TIMESTAMP NOT NULL
)