SELECT m.pizza_name, m.price, pz.name AS pizzeria_name, pv.visit_date
FROM pizzeria pz
         JOIN menu m ON pz.id = m.pizzeria_id
         JOIN person_visits pv on pz.id = pv.pizzeria_id
         JOIN person p on p.id = pv.person_id
WHERE p.name = 'Kate'
  AND price BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, pz.name;
