SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    INNER JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey'

EXCEPT

SELECT pizzeria.name AS pizzeria_name
FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON person_order.menu_id = menu.id
    JOIN person on person_order.person_id = person.id
WHERE person.name = 'Andrey';