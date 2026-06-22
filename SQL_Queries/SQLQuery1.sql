-- server --- database --- table ---- column/rows

-- how to create database
create database sql6052

-- to use database
use sql6052

-- to create a table
create table table1 (id int, name varchar(20), salary int, email nvarchar(120))

-- datatypes
-- int- 39,90,56
-- float- 90.22, 56.22
-- date- yyyy-mm-dd
-- time- hh:mm:ss
-- date time- yyyy-mm-dd hh:mm:ss
-- char(20)
-- varchar(20)
-- nvarchar(35)

-- to check the table
select *
from table1

-- to insert the rows into the table
insert into table1 values
(101, 'Rohan', 98000, 'rahan@gmail.com'),
(102, 'Neha',95000, 'neha@gmail.com')
--(102, 'Neha',95000, null),
--(102, 'Neha',95000, '')


--drop/delete/truncate
-- delete - to delete the row or number of rows
delete from table1
where id = 102

-- truncate - delete all the rows from the table
truncate table table1

-- drop - to delete the complete table from the database
drop table table1

-- alter - to add or remove any column
-- to add the column
alter table table1
add dept varchar(50)

-- to remove the column
alter table table1
drop column dept

select *
from table1

update table1
set dept = 'IT'

update table1
set dept = 'BPO'
where id = 102

-- to rename to column
--exec sp_rename 'table.com' , 'new_col'

exec sp_rename 'table1.id', 'emp_id'

-- OPREATERS
<> not eqal to =!
> greater than
< less than
>= greater than eqal to
<= less than eqal to
in 
not in
between and
like
and
or

select *
from Orders