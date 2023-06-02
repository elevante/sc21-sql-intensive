(
  SELECT
    id AS menu_id
  FROM
    menu
)
EXCEPT
   ALL(
    SELECT
      menu_id
    FROM
      person_order
  )
ORDER BY menu_id;