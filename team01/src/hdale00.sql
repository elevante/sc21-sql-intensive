WITH 
c AS (SELECT * FROM currency WHERE updated IN (SELECT max(updated) FROM currency GROUP BY id)),
n_t AS (SELECT DISTINCT
	COALESCE(u.name, 'not defined') AS name, 
	COALESCE(u.lastname, 'not defined') AS lastname, b.type, 
	SUM(b.money) OVER (PARTITION BY  u.id, b.type) AS volume, 
	CASE
		WHEN COUNT(c.name)  OVER (PARTITION BY  u.id, b.type)  = 1  THEN c.name
		ELSE 'not defined'
	END AS currency_name,
 CASE
        WHEN COUNT(c.rate_to_usd)  OVER (PARTITION BY  u.id, b.type)  = 1  THEN c.rate_to_usd
        
        ELSE '1'
    END AS last_rate_to_usd
FROM balance b
    LEFT JOIN "user" u ON b.user_id = u.id
    LEFT JOIN c ON b.currency_id = c.id)
SELECT *, volume * last_rate_to_usd::float AS total_volume_in_usd
FROM n_t
ORDER BY name DESC, lastname, type

