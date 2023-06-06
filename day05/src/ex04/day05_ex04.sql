CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE menu.pizzeria_id = 1
  AND menu.pizza_name = 'cheese pizza';