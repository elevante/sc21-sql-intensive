SELECT
  p.address,
  pz.name,
  COUNT(order_date) AS count_of_orders
FROM
  person p
  JOIN person_order po ON p.id = po.person_id
  JOIN menu m ON m.id = po.menu_id
  JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY
  p.address,
  pz.name
ORDER BY
  p.address,
  pz.name;
