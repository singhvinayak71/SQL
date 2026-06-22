use sql6052

select *
from t2$ left join t3$
on t2$.id = t3$.id

select name
from t2 full join t3
on t2.id = t3.id

select name
from t2 join t3
on t2.id = t3.id