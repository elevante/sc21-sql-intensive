WITH o_order AS (
  SELECT
    name,
    COUNT(*) AS count
  FROM
    person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
  GROUP BY
    name
  ORDER BY
    count DESC
),
v_visit AS (
  SELECT
    name,
    COUNT(*) as count
  FROM
    person_visits pv
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
  GROUP BY
    name
  ORDER BY
    count DESC
)
SELECT
  pz.name,
  (
    CASE WHEN v.count IS NULL THEN 0 ELSE v.count END
  ) + (
    CASE WHEN o.count IS NULL THEN 0 ELSE o.count END
  ) AS total_count
FROM
  pizzeria pz
  LEFT JOIN v_visit v ON v.name = pz.name
  LEFT JOIN o_order o ON o.name = v.name
ORDER BY
  total_count DESC,
  name;
