SELECT
  d :: date as missing_date
FROM
  generate_series(
    '2022-01-01', '2022-01-10', interval '1 day'
  ) as d
  LEFT JOIN (
    SELECT
      *
    FROM
      person_visits
    WHERE
      person_id = 1
      OR person_id = 2
  ) as v on d = v.visit_date
WHERE
  person_id IS NULL
ORDER BY
  person_id;