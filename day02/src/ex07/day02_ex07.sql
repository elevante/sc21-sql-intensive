SELECT
  piz.name AS pizza_name
FROM
  (
    SELECT
      id,
      name
    FROM
      person
    WHERE
      name = 'Dmitriy'
  ) as p
  JOIN (
    SELECT
      *
    FROM
      person_visits
    WHERE
      visit_date = '2022-01-08'
  ) AS pv ON pv.person_id = p.id
  JOIN pizzeria piz ON piz.id = pv.pizzeria_id
  JOIN (
    SELECT
      *
    FROM
      menu
    WHERE
      price < 800
  ) as m on m.pizzeria_id = pv.pizzeria_id
ORDER BY
  pizza_name;




