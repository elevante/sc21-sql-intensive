SELECT
  id,
  name,
  (
    SELECT
      CASE WHEN age BETWEEN 10
      AND 20 THEN 'interval #1' WHEN age > 20
      AND age < 24 THEN 'interval #2' ELSE 'interval #3' END
  ) as interval_info
FROM
  person
ORDER BY
  interval_info;