SELECT
  ROUND(
    avg(rating),
    4
  ) AS global_rating
FROM
  pizzeria pz;
