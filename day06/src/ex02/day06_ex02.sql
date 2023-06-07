SELECT
    p.name,
    pizza_name,
    price,
    round(
        price * ((100 - pd.discount) / 100),
        0
    ) AS discount_price,
    pz.name AS pizzeria_name
FROM
    person_order po
    INNER JOIN person p ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
    INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
    INNER JOIN person_discounts pd ON pd.person_id = p.id
    AND pd.pizzeria_id = pz.id
ORDER BY
    p.name,
    pizza_name;