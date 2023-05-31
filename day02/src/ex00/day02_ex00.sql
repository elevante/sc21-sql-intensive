SELECT
  name,
  rating
FROM
  pizzeria
  LEFT JOIN person_visits as PV ON pizzeria.id = PV.pizzeria_id
WHERE
  pizzeria_id IS NULL;