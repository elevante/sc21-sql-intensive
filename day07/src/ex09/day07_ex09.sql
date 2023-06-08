WITH tmp AS (
  SELECT
    address,
    ROUND(
      CAST(
        max(age) AS NUMERIC
      ) - CAST(
        min(age) AS NUMERIC
      ) / CAST(
        max(age) AS NUMERIC
      ),
      2
    ) AS formula,
    ROUND(
      avg(age),
      2
    ) AS avarage
  FROM
    person
  GROUP BY
    address
)
SELECT
  *,
  (formula > avarage) AS comparison
FROM
  tmp
ORDER BY
  address;
