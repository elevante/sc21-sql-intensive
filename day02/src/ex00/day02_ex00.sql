SELECT
  name,
  rating
FROM
  pizzeria
  LEFT JOIN person_visits as pv ON pizzeria.id = pv.pizzeria_id
WHERE
  pizzeria_id IS NULL;