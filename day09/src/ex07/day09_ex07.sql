create or replace function
    func_minimum(VARIADIC arr numeric[])
    returns numeric
AS
$$
select min($1[i])
from generate_subscripts($1, 1) g(i);
$$ language sql;

select func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);
