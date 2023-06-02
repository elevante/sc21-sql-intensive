(SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    INNER JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'female'
EXCEPT ALL
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    INNER JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'male'
)

UNION ALL

(SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    INNER JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'male'
EXCEPT ALL
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    INNER JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'female')
ORDER BY pizzeria_name;