INSERT INTO person_visits
VALUES
  (
    (
      SELECT
        MAX(id) + 1
      FROM
        person_visits
    ),
    (
      SELECT
        id
      FROM
        person
      WHERE
        name = 'Dmitriy'
    ),
    (
      SELECT
        id
      FROM
        pizzeria
      WHERE
        name = 'DoDo Pizza'
    ),
    '2022-01-08'
  );
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;