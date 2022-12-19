CREATE DATABASE e_commerce;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
)

CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INTEGER NOT NULL,
    category VARCHAR(50) NOT NULL,
    size VARCHAR(50) NOT NULL,
    photos TEXT[],
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
)

CREATE TABLE purchases(
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL  REFERENCES products(id),
    user_id INTEGER NOT NULL  REFERENCES users(id),
    quantity INTEGER NOT NULL,
    status  TEXT NOT NULL,
    adress TEXT NOT NULL, 
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
)