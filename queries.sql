-- Retirement query PART 1 
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement query Born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'

-- Retirement query Born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31'

-- Retirement query Born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31'

-- Retirement query born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31'
-----------------------------------------------------
drop table retirement_info cascade;

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT COUNT(first_name)
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

drop table retirement_info cascade;
-------------------------------------------------------
--Retirement_Info Table
SELECT emp_no,first_name,last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dep_manager as dm
ON d.dept_no = dm.dept_no;

-- Use Left Join to capture retirement-info table 
-- Joining retirement_info and dept_emp tables 
SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_employees.to_date
FROM retirement_info
LEFT JOIN dept_employees
ON retirement_info.emp_no=dept_employees.emp_no;


-- LEFT JOIN for retirement_ino and dept_emp
SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_employees.to_date
INTO current_emp
FROM retirement_info
LEFT JOIN dept_employees
ON retirement_info.emp_no=dept_employees.emp_no
WHERE dept_employees.to_date=('9999-01-01');

--Employee count by department number 
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN  dept_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

--Create Employee Information Table 
SELECT e.emp_no, e.first_name, e.last_name,e.gender,s.salary,de.to_date
INTO employee_info 
FROM employees as e
INNER JOIN salaries as s 
ON (e.emp_no=s.emp_no)
INNER JOIN dept_employees as de
ON (e.emp_no=de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- List of managers per department 
SELECT dm.dept_no,
		d.dept_name,
		dm.emp_no,
		ce.last_name,
		ce.first_name,
		dm.from_date,
		dm.to_date
INTO manager_info
FROM dep_manager as dm
		INNER JOIN departments as d
			ON (dm.dept_no = d.dept_no)
		INNER JOIN current_emp as ce
			ON (dm.emp_no=ce.emp_no);

-- Query for Sales Department 
SELECT ce.emp_no,
		ce.first_name,
		ce.last_name, 
		d.dept_name
--INTO sales
FROM departments as d
WHERE dept_name IN ('Sales')
FROM dep_manager as dm

-- Query for Sales Department 
SELECT * FROM dept_info
WHERE dept_name in ('Sales', 'Development');
