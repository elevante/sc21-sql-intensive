DROP TABLE city, city_way;
CREATE TABLE city
(
    id   SERIAL PRIMARY KEY,
    name varchar not null
);

INSERT INTO city (name)
VALUES ('A'),
       ('B'),
       ('C'),
       ('D');

CREATE TABLE city_way
(
    id        SERIAL PRIMARY KEY,
    from_city varchar not null,
    to_city   varchar not null,
    cost       int     not null
);

INSERT INTO city_way(from_city, to_city, cost)
VALUES ('A', 'B', 10),
       ('A', 'C', 15),
       ('A', 'D', 20),
       ('B', 'A', 10),
       ('B', 'C', 35),
       ('B', 'D', 25),
       ('C', 'A', 15),
       ('C', 'B', 35),
       ('C', 'D', 30),
       ('D', 'A', 20),
       ('D', 'B', 25),
       ('D', 'C', 30);

SELECT *
From city