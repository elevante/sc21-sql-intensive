CREATE FUNCTION fnc_persons_female()
    RETURNS table
            (
                id      bigint,
                name    varchar,
                age     int,
                gender  varchar,
                address varchar
            )
AS
$$
SELECT *
FROM person
WHERE gender = 'female';
$$ language sql;
CREATE FUNCTION fnc_persons_male()
    RETURNS table
            (
                id      bigint,
                name    varchar,
                age     int,
                gender  varchar,
                address varchar
            )
AS
$$
SELECT *
FROM person
WHERE gender = 'male';
$$ language sql;

SELECT *
FROM fnc_persons_female();
SELECT *
FROM fnc_persons_male();
