CREATE VIEW v_generated_dates AS
WITH R AS
             (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02'),
     S AS (SELECT *
           FROM person_visits
           WHERE visit_date = '2022-01-06')(SELECT person_id FROM R EXCEPT SELECT person_id FROM S)
UNION
(SELECT person_id FROM S EXCEPT SELECT person_id FROM R)
ORDER BY person_id;
