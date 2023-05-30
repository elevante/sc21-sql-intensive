SELECT pv.order_date,
       concat(name, ' (age:', age, ')') AS person_information
FROM person_order AS pv (primary_key, id, menu_id, order_date)
         NATURAL JOIN person
ORDER BY order_date,
         person_information;