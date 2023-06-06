SET ENABLE_SEQSCAN TO ON;
EXPLAIN ANALYZE
SELECT m.pizza_name                                                                                        AS pizza_name,
       MAX(rating)
       OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
         INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;

CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name                                                                                        AS pizza_name,
       MAX(rating)
       OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
         INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;

DROP INDEX idx_1;