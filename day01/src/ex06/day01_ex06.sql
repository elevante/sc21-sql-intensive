(SELECT order_date
            AS action_date,
        (SELECT name
         FROM person
         WHERE id = person_order.person_id)
            AS name
 FROM person_order)
INTERSECT
(SELECT visit_date,
        (SELECT name
         FROM person
         WHERE id = person_visits.person_id)
 FROM person_visits)
ORDER BY action_date ASC,
         name DESC;