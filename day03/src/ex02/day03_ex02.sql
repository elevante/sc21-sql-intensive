WITH lack_orders AS (
  (
    SELECT
      id
    FROM
      menu
  )
  EXCEPT
    ALL (
      SELECT
        menu_id
      FROM
        person_order
    )
)
SELECT
  pizza_name,
  price,
  pz.name AS name_pizzeria
FROM
  pizzeria pz
  JOIN menu m on pz.id = m.pizzeria_id
WHERE
  m.id IN (
    SELECT
      id
    FROM
      lack_orders
  )
ORDER BY
  pizza_name,
  price;