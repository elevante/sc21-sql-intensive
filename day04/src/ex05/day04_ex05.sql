CREATE VIEW v_price_with_discount AS
SELECT
  p.name,
  m.pizza_name,
  m.price,
  ROUND(price - price * 0.1, 0) AS discount_price
FROM
  person_order po
  JOIN person p ON p.id = po.person_id
  JOIN menu m ON m.id = po.menu_id
ORDER BY
  p.name,
  m.pizza_name;
SELECT
  *
FROM
  v_price_with_discount