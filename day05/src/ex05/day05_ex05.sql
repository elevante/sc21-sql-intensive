CREATE UNIQUE INDEX idx_person_order_order_date
    ON person_order (person_id, menu_id)
    WHERE order_date = '2022-01-01';

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT po.person_id, po.menu_id
FROM person_order po
WHERE po.person_id = 1
  AND po.menu_id = 1
  AND po.order_date = '2022-01-01';