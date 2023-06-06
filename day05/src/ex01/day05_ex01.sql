SET ENABLE_SEQSCAN TO OFF;
SELECT pizza_name, name FROM menu
JOIN pizzeria pz on menu.pizzeria_id = pz.id;

EXPLAIN ANALYZE

SELECT pizza_name, name FROM menu
JOIN pizzeria pz on menu.pizzeria_id = pz.id;