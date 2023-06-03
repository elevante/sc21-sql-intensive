(
  SELECT
    name
  FROM
    v_persons_male
)
UNION
  (
    SELECT
      name
    FROM
      v_persons_female
  )
ORDER BY
  name;


