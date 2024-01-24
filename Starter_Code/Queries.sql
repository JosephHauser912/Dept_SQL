-- employee details
select emp.emp_no,
		emp.last_name,
		emp.first_name,
		emp.sex,
		sal.salary
from employees as emp
	left join salaries as sal
	on (emp.emp_no = sal.emp_no)
order by emp.emp_no;

--Hired in 1986
select emp.last_name,
		emp.first_name,
		emp.hire_date
from employees as emp
where hire_date between '1986-01-01' and '1986-12-31';

-- department managers with details
select d.dept_no,
		de.dept_name,
		d.emp_no,
		em.last_name,
		em.first_name
from dept_manager as d
	inner join departments as de
		on(d.dept_no = de.dept_no)
	inner join employees as em
		on (d.emp_no = em.emp_no);

-- employees and departments
select emp.emp_no,
		emp.last_name,
		emp.first_name,
		demp.dept_no,
		d.dept_name
from employees as emp
	inner join dept_emp as demp
		on (emp.emp_no = demp.emp_no)
	inner join departments as d
		on (demp.dept_no = d.dept_no)
order by emp.emp_no;

---Hercules B Count
select first_name, last_name, birth_date, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--sales dept employees, emp_no, last_name, first_name
select 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	d.dept_name
from employees as emp
	inner join dept_emp as de
		on (emp.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
where d.dept_name = 'Sales'
order by emp.emp_no;
	
-- Sales and Development Depts
select e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	from employees as e
		inner join dept_emp as de
			on (e.emp_no = de.emp_no)
		inner join departments as d
			on (de.dept_no = d.dept_no)
	where d.dept_name in ('Sales', 'Development')
	order by e.emp_no;