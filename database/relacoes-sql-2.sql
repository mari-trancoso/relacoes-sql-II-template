-- Active: 1674130524104@@127.0.0.1@3306

-- Prática 1
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES 
    ("u001", "mariana", "mari@email.com", "mari123"), 
    ("u002", "paulo", "paulo@email.com", "paulo234"), 
    ("u003", "thiago", "thiago@email.com", "thiago456");

SELECT * FROM users;

-- Prática 2
CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES 
    ("u001", "u002"), 
    ("u001", "u003"), 
    ("u002", "u001");

SELECT * FROM follows
INNER JOIN users
ON follows.follower_id = users.id;

SELECT 
    follows.follower_id,
    follows.followed_id,
    users.name
FROM follows
INNER JOIN users
ON follows.follower_id = users.id;

-- Prática 3
SELECT * FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id;

SELECT * FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id 
INNER JOIN users AS followedUsers
ON follows.followed_id = followedUsers.id;

SELECT 
    follows.follower_id AS followerId,
    follows.followed_id AS followedId,
    users.name AS followerName,
    followedUsers.name AS followedName
FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id 
INNER JOIN users AS followedUsers
ON follows.followed_id = followedUsers.id;

-- FIXAÇÃO
CREATE TABLE banks (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL

);

INSERT INTO banks ( id, name)
VALUES 
    ("b001", "Santander"), 
    ("b002", "Itau"), 
    ("b003", "Nubank");

SELECT * FROM banks;

CREATE TABLE people (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL

);

INSERT INTO people (id, name)
VALUES 
    ("p001", "mari"), 
    ("p002", "junior"), 
    ("p003", "sandra");


SELECT * FROM people;

CREATE TABLE banks_people (
    bank_id TEXT NOT NULL,
    peolpe_id TEXT NOT NULL,
    FOREIGN KEY (bank_id) REFERENCES banks(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
    
);

INSERT INTO banks_people (bank_id, people_id)
VALUES 
    ("b001", "p001"), 
    ("b001", "p003"), 
    ("b003", "p001"), 
    ("b003", "p002");

SELECT * FROM banks_people;


SELECT * FROM banks_people
INNER JOIN banks 
ON banks_people.bank_id = banks.id;

SELECT * FROM banks_people
INNER JOIN banks 
ON banks_people.bank_id = banks.id
INNER JOIN people 
ON banks_people.people_id = people.id;