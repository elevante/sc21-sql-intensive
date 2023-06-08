SELECT
  DISTINCT p.name
FROM
  person p
  JOIN person_order po ON po.person_id = p.id
ORDER BY
  p.name;
