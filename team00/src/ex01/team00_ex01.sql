-- DROP MATERIALIZED VIEW view_sum_2;

CREATE MATERIALIZED VIEW view_sum_2 AS
(
WITH RECURSIVE a_traces AS (SELECT from_city as tour,
                                   from_city,
                                   to_city,
                                   cost,
                                   cost      AS summ
                            FROM city_way
                            WHERE from_city = 'A'
                            UNION ALL
                            SELECT parrent.tour || ',' || child.from_city AS tour,
                                   child.from_city,
                                   child.to_city,
                                   parrent.cost,
                                   parrent.summ + child.cost              AS summ
                            FROM city_way AS child
                                     INNER JOIN a_traces AS parrent ON child.from_city = parrent.to_city
                            WHERE tour not like '%' || child.from_city || '%')


SELECT '{' || tour || ',' || to_city || '}' AS traces, summ
FROM a_traces
WHERE length(tour) = 7
  and to_city = 'A'
ORDER BY summ);

SELECT summ AS total_cost, traces AS tour
FROM view_sum_2
ORDER BY total_cost;
