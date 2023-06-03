CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
  pz.name AS pizzeria_name
FROM
  (
    SELECT
      *
    FROM
      person
    WHERE
      name = 'Dmitriy'
  ) AS p
  JOIN (
    SELECT
      person_id,
      pizzeria_id
    FROM
      person_visits
    WHERE
      visit_date = '2022-01-08'
  ) AS pv ON pv.person_id = p.id
  JOIN pizzeria pz ON pz.id = pv.pizzeria_id
  JOIN (
    SELECT
      pizzeria_id
    FROM
      menu
    WHERE
      price < 800
  ) AS m ON m.pizzeria_id = pv.pizzeria_id;
SELECT
  *
FROM
  mv_dmitriy_visits_and_eats;