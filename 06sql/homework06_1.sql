-- Paige Brinks
-- cs 342
-- Homework 6
-- 3/15/2017

-- a.
select * from (select e1.employee_id, 
				e1.first_name || ' ' || e1.last_name as manager_name, 
				count(*) as employee_count
	from Employees e1, Employees e2
	where e2.manager_id = e1.employee_id
	group by e1.employee_id, e1.first_name || ' ' || e1.last_name
	order by employee_count desc)
where rownum <= 10;

-- b.
select d.department_name, count(*) as employee_count, sum(e.salary) as total_salary
from departments d, employees e, locations l
where d.location_id = l.location_id
and l.country_id <> 'US'
and e.department_id = d.department_id
group by d.department_name
having count(*) < 100;

-- c.
select d.department_name, e.first_name || ' ' || e.last_name as manager_name, j.job_title
from departments d LEFT OUTER JOIN (
	employees e INNER JOIN jobs j
	ON e.job_id = j.job_id )
ON d.manager_id = e.employee_id;

-- d.
select d.department_name, avg(e.salary) as average_salary
from (departments d LEFT OUTER JOIN employees e
		ON d.department_id = e.department_id)
group by d.department_name
order by avg(e.salary) desc;