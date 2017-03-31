-- Paige Brinks
-- cs 342
-- homework 7
-- 3/30/2017

drop view employee_dept;

-- 1.
create view employee_dept as
    select e.employee_id, e.first_name,  e.last_name, 
        e.email, e.hire_date, d.department_name
        from employees e, departments d
    where e.department_id = d.department_id;

-- a.
select first_name || ' ' ||  last_name as name, employee_id from 
    (select * from employee_dept
        where department_name = 'Executive'
        order by hire_date desc)
where rownum <= 1;

-- b.
update employee_dept
    set department_name = 'Bean Counting'
where department_name = 'Administration';
-- This generates an error because the Department table is not key-preserved in the view 
-- aka we do not include department_id in the view

-- c.
update employee_dept
    set first_name = 'Manuel' 
    where first_name = 'Jose Manuel';
-- this works because we include employee_id in our view, the employees table is therefore key-preserved

-- d.
insert into employee_dept (employee_id, first_name, last_name, email, hire_date, department_name)
values
(207, 'Beka', 'Agava', 'baa8@email.com', '08-MAR-2017', 'Payroll');
-- does not work, because cannot insert into two tables, and department is not key-preserved


--2. 
drop materialized view mat_emp_dept;

create materialized view mat_emp_dept as
    select e.employee_id, e.first_name,  e.last_name, 
        e.email, e.hire_date, d.department_name
    from employees e, departments d
    where e.department_id = d.department_id;
    
-- a.
select first_name || ' ' ||  last_name as name, employee_id from 
    (select * from mat_emp_dept
        where department_name = 'Executive'
        order by hire_date desc)
where rownum <= 1;

-- b.
update mat_emp_dept
    set department_name = 'Bean Counting'
where department_name = 'Administration';
-- this throws an error: data manipulation operation not legal on this view 
-- a materialized view is read only and cannot be updated 

-- c.
update mat_emp_dept
    set first_name = 'Manuel' 
    where first_name = 'Jose Manuel';
-- see error on part b
-- a materialized view is read only and cannot be updated 

-- d.
insert into mat_emp_dept (employee_id, first_name, last_name, email, hire_date, department_name)
values
(207, 'Beka', 'Agava', 'bagava', '08-MAR-2017', 'Payroll');
-- see error on part b
-- a materialized view is read only and cannot be updated 


-- 3.
-- a. 
-- relational algebra
π e.employee_id, e.first_name, e.last_name, e.email , e.hire_date, d.department_name ( ρe(EMPLOYEES) ⋈ e.department_id = d.department_id ρd(DEPARTMENTS) )
-- relational calculus
{ e.employee_id, e.first_name,  e.last_name, e.email, e.hire_date, d.department_name | EMPLOYEES(e1) ^ EMPLOYEES(e2) ^ DEPARTMENTS(d) ^ e.department_id = d.department_id ^ NOT E e2.hire_Date < e1.hire_date} 

-- b.
{ e1.first_name, e1.last_name, e1.employee_id | employee_dept(e1) ^ employee_dept(e2) ^ e1.department_name = 'Executive' ^ NOT ∃ (e2.hire_Date > e1.hire_date) }

