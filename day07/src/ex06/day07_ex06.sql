SELECT
  pz.name,
  COUNT(order_date) AS count_of_orders,
  ROUND(
    avg(price),
    2
  ) AS average_price,
  max(price) AS max_price,
  min(price) AS min_price
FROM
  pizzeria pz
  JOIN menu m on pz.id = m.pizzeria_id
  JOIN person_order pv ON m.id = pv.menu_id
GROUP BY
  pz.name
ORDER BY
  pz.name;
