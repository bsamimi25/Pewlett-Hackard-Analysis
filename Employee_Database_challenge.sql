---CHALLENGE 
-- PART 1

-- Get employees 
SELECT emp_no,first_name,last_name
FROM employees;

-- Get Titles 
SELECT title, from_date, to_date
FROM titles;

-- Join tables, filter from birth dates, ORDER BY employee numbers
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
	ON (t.emp_no=e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

-- -- Retrieve number of employees by recent job title, filter by count
SELECT COUNT(ut.title), ut.title
INTO retiring_titles 
FROM unique_titles as ut 
GROUP BY ut.title
ORDER BY ut.count DESC;

-- Deliverable 2
--retrieve employee id, first/last, and birth date from employees
SELECT DISTINCT ON (e.emp_no)
e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
t.title
FROM employees as e
INNER JOIN dept_employees as de 
	ON (de.emp_no=e.emp_no)
INNER JOIN titles as t
	ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date='9999-01-01'
ORDER BY e.emp_no;

SELECT COUNT(*)
FROM mentorship_eligibility;
