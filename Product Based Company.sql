-- Dataset
drop table emp_input;
create table emp_input
(
id      int,
name    varchar(40)
);
insert into emp_input values (1, 'Emp1');
insert into emp_input values (2, 'Emp2');
insert into emp_input values (3, 'Emp3');
insert into emp_input values (4, 'Emp4');
insert into emp_input values (5, 'Emp5');
insert into emp_input values (6, 'Emp6');
insert into emp_input values (7, 'Emp7');
insert into emp_input values (8, 'Emp8');
WITH CTE AS
	(select CONCAT (id,' ',name) AS name
	,NTILE(4) OVER (ORDER BY id)AS buckets
	from emp_input)
SELECT STRING_AGG(name,', ') AS final_result
FROM CTE
GROUP BY buckets
ORDER BY 1



















