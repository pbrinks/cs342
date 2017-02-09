-- Paige Brinks
-- CS 342
-- Lab 1
-- 02/03/2017

-- a.
select * from departments;

-- b.
select count(employee_id) from employees;
 
-- c. 
select employee_id, first_name, last_name from employees
where salary > 15000
and hire_date between '01-JAN-2002' AND '31-DEC-2004'
and phone_number NOT LIKE '515%';

-- d.
select first_name || ' ' || last_name from employees, departments
where employees.department_id = departments.department_id
and department_name = 'Finance'
order by last_name;

-- e. 
select locations.city, locations.state_province, countries.country_name from locations, countries, regions
where regions.region_name = 'Asia'
and countries.region_id = regions.region_id
and locations.country_id = countries.country_id;

-- f.
select * from locations
where state_province IS NULL;
