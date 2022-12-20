CREATE TABLE states(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
)

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    state_id INTEGER NOT NULL  REFERENCES states(id)
)

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    full_name TEXT  NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email  TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
)

CREATE TABLE customer_addresses(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE  NOT NULL REFERENCES customers(id),
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT DEFAULT NULL,
    postal_code TEXT NOT NULL,
    city_id  NOT NULL INTEGER REFERENCES cities(id)
)

CREATE TYPE phone_options AS ENUM ('landline, mobile') --only values inside here is available;

CREATE TABLE customer_phones(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE  NOT NULL REFERENCES customers(id),
    number TEXT UNIQUE NOT NULL,
    type phone_options
)

CREATE TABLE bank_account(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE  NOT NULL REFERENCES customers(id),
    account_number TEXT UNIQUE NOT NULL,
    agency TEXT NOT NULL,
    open_date TIMESTAMP DEFAULT NOW(),
    close_date TIMESTAMP --not inserting this data, the database adds null by deafult, not having to specify that;
)

CREATE TYPE transaction_options AS ENUM ('deposit', 'withdraw')

CREATE TABLE transactions (
     id SERIAL PRIMARY KEY,
     bank_account_id INTEGER NOT NULL  REFERENCES bank_account(id),
     amountBIGINT NOT NULL,
     type transaction_options,
     "time" TIMESTAMP WHITHOUT TIME ZONE DEFAULT NOW(),
     description VARCHAR(100) DEFAULT NULL,
     cancelled BOOLEAN DEFAULT FALSE
)

CREATE TABLE credit_cards(
    id SERIAL PRIMARY KEY,
    bank_account_id INTEGER  NOT NULL REFERENCES bank_account(id),
    name TEXT  NOT NULL,
    number  TEXT UNIQUE NOT NULL,
    security_code  TEXT NOT NULL,
    expiration_month DATE NOT NULL,
    expiration_year  DATE NOT NULL, 
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL -- when the word being used is reserved of postgreSQL just wrap it inside the quotation marks;
)