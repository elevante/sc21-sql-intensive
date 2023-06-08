(
  SELECT
    name,
    COUNT(*) as count,
    'order' AS action_type
  FROM
    person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
  GROUP BY
    name
  ORDER BY
    count DESC FETCH FIRST 3 ROWS ONLY
)
UNION ALL
  (
    SELECT
      name,
      COUNT(*) as count,
      'visit' AS action_type
    FROM
      person_visits pv
      JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    GROUP BY
      name
    ORDER BY
      count DESC FETCH FIRST 3 ROWS ONLY
  )
ORDER BY
  action_type,
  count DESC;