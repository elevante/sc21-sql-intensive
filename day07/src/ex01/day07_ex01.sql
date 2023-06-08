SELECT
  p.name,
  COUNT(pv.visit_date) AS count_of_visits
FROM
  person p
  INNER JOIN person_visits pv ON pv.person_id = p.id
GROUP BY
  p.name
ORDER BY
  count_of_visits DESC,
  p.name FETCH FIRST 4 ROWS ONLY;
