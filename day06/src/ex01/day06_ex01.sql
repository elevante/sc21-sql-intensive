WITH tmp AS (
    SELECT
        person_id,
        pizzeria_id,
        COUNT(*) AS count,
        (
            CASE
                WHEN COUNT(*) = 1 THEN 10.5
                WHEN COUNT(*) = 2 THEN 22
                ELSE 30
            END
        ) AS discount
    FROM
        person_order po
        INNER JOIN menu m ON m.id = po.menu_id
    GROUP BY
        person_id,
        pizzeria_id
    ORDER BY
        person_id
),
tmp_final AS (
    SELECT
        ROW_NUMBER() OVER () AS id,
        person_id,
        pizzeria_id,
        discount
    FROM
        tmp
)
INSERT INTO
    person_discounts(id, person_id, pizzeria_id, discount)
SELECT
    *
FROM
    tmp_final;