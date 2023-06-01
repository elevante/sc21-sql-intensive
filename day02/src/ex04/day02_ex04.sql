SELECT
  m.pizza_name,
  piz.name AS pizzeria_name,
  m.price
FROM
  menu m
  JOIN pizzeria piz on piz.id = m.pizzeria_id
WHERE
  pizza_name IN (
    'pepperoni pizza', 'mushroom pizza'
  )
ORDER BY
  pizza_name,
  pizza_name;