SELECT
  p.name,
  COUNT(visit_date) AS count_of_visits
FROM
  person p
  JOIN person_visits pv ON p.id = pv.person_id
GROUP BY
  p.name
HAVING
  COUNT(visit_date) > 3;
