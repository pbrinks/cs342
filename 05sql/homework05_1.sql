-- Paige Brinks
-- cs 342
-- Homework 05
-- 03/08/2017


-- Write SQL queries that:

-- a.	Get a list of the employees who have finished all of their jobs (i.e., all their jobs in the job_history table have non-null end_dates).
select distinct e1.employee_id, e1.first_name || ' ' || e1.last_name AS name from employees e1, job_history jh
where e1.employee_id = jh.employee_id
and NOT EXISTS (
	select * from employees e2
	where e1.employee_id = e2.employee_id
	and jh.end_date IS NULL);



-- b.	Get a list of employees along with their manager such that the managers have less seniority at the company and that all the employees’ jobs have been within the manager’s department.
-- managers where hired later than employee
-- emnployees jobs have always been in managers dept
select distinct e.employee_id, e.first_name || ' ' || e.last_name AS employee, m.employee_id AS manager_id, m.first_name || ' ' || m.last_name AS manager from employees e, employees m
where m.employee_id = e.manager_id
and e.department_id = m.department_id
and e.hire_date < m.hire_date
and NOT EXISTS ( select * from job_history jh
	where e.employee_id = jh.employee_id
	and jh.department_id <> m.department_id);


-- c.	The countries in which at least one department is located. Try to write this as both a join and a nested query. If you can, explain which is better. If you can’t, explain which is not possible and why.
select distinct(country_name) from countries, locations, departments
where countries.country_id = locations.country_id
and departments.location_id = locations.location_id;

select distinct(country_name) from (select * from countries c, locations l, departments d
	where d.location_id = l.location_id
	and l.country_id = c.country_id);

-- using the join without the nested query is more efficient because with the nested query we have to select twice for every iteration.	
