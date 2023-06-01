SELECT
  DISTINCT p.name
FROM
  person p
  JOIN person_order as po ON po.person_id = p.id
  JOIN menu as m ON m.id = po.menu_id
WHERE
  m.pizza_name IN (
    'pepperoni pizza', 'cheese pizza'
  )
  AND p.gender = 'female'
ORDER BY
  p.name;