(
  SELECT
    name AS object_name
  FROM
    person
  ORDER BY
    name
)
UNION ALL
  (
    SELECT
      pizza_name
    FROM
      menu
    ORDER BY
      pizza_name
  );