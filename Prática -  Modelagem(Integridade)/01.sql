CREATE TABLE states(
    id SERIAL PRIMARY KEY,
    name UNIQUE VARCHAR(50) NOT NULL
)

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name UNIQUE VARCHAR(50) NOT NULL,
    state_id INTEGER REFERENCES states(id) NOT NULL
)

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email  VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL
)

CREATE TABLE customer_addresses(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE REFERENCES customers(id) NOT NULL,
    street VARCHAR(50) NOT NULL,
    number VARCHAR(10) NOT NULL,
    complement VARCHAR(50) NOT NULL,
    postal_code VARCHAR(8) NOT NULL,
    city_id INTEGER REFERENCES cities(id) NOT NULL
)

CREATE TYPE phone_options AS ENUM ('landline, mobile') --only values inside here is available;

CREATE TABLE customer_phones(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE REFERENCES customers(id) NOT NULL,
    number VARCHAR(50) UNIQUE NOT NULL,
    type phone_options
)

CREATE TABLE bank_account(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER UNIQUE REFERENCES customers(id) NOT NULL,
    account_number VARCHAR(50) NOT NULL,
    agency VARCHAR(50) NOT NULL,
    openDate TIMESTAMP DEFAULT NOW(),
    closeDate TIMESTAMP DEFAULT NULL
)

CREATE TYPE transaction_options AS ENUM ('landline, mobile')

CREATE TABLE transactions (
     id SERIAL PRIMARY KEY,
     bank_account_id INTEGER REFERENCES bank_account(id) NOT NULL,
     amount INTEGER NOT NULL,
     type transaction_options,
     time TIMESTAMP DEFAULT NOW(),
     description VARCHAR(100) DEFAULT NULL,
     cancelled BOOLEAN DEFAULT FALSE
)

CREATE TABLE credit_cards(
    id SERIAL PRIMARY KEY,
    bank_account_id INTEGER REFERENCES bank_account(id) NOT NULL,
    name VARCHAR(100) REFERENCES  customers(full_name)  NOT NULL,
    number  VARCHAR(50) NOT NULL,
    security_code  VARCHAR(50) NOT NULL,
    expiration_month  DATE NOT NULL,
    expiration_month  DATE NOT NULL,
    password VARCHAR(50) NOT NULL,
    limit INTEGER NOT NULL
)