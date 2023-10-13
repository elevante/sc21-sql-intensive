drop function fnc_persons_female();
drop function fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender varchar default 'female')
    RETURNS table
        (
        id bigint,
        name varchar,
        age int,
        gender varchar,
        address varchar
        ) AS
$$
SELECT *
FROM person
WHERE gender = pgender;
$$
language sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();