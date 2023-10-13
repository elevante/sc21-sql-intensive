create
or replace function
fnc_fibonacci(pstop int default 10)
returns
setof integer
AS $$
    with recursive t(a,b) as (
    values(0,1)
    union all
    select greatest(a,b), a + b as a from t where b < $1
    )
select a
from t;
$$
language sql;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();
