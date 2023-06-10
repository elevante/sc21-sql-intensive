CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitry',
                                                   pprice numeric default 500,
                                                   pdate date default '2022-01-08')
    RETURNS
        table
        (
            pizzeria_name varchar
        )
AS
$$
select distinct pz.name as pizzeria_name
from person_order po
         join person_visits pv on pv.person_id = po.person_id and pv.visit_date = po.order_date
         join person p on po.person_id = p.id
         join menu m on m.id = po.menu_id
         join pizzeria pz on pz.id = pv.pizzeria_id

WHERE p.name = pperson
  AND m.price < pprice
  AND po.order_date = pdate
$$ language sql;
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
