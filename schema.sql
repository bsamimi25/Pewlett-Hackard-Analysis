-- Creating tables for PH-EMployeeDB
CREATE TABLE departments (
		dept_no VARCHAR(4) NOT NULL,
		dept_name VARCHAR (40) NOT NULL, 
		PRIMARY KEY (dept_no),
		UNIQUE (dept_name)
); 

-- Creating tables for employees
CREATE TABLE employees(
		emp_no INT NOT NULL,
		birth_date DATE NOT NULL, 
		first_name VARCHAR NOT NULL,
		last_name VARCHAR NOT NULL, 
		gender VARCHAR NOT NULL,
		hire_date DATE NOT NULL,
		PRIMARY KEY (emp_no)
);

DROP TABLE dep_manager CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE;


-- Creating table for Department Manager 
CREATE TABLE dep_manager(
		dept_no VARCHAR(4) NOT NULL, 
		emp_no INT NOT NULL, 
		from_date DATE NOT NULL,
		to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- Creating table for Salaries 
CREATE TABLE salaries(
		emp_no INT NOT NULL,
		salary INT NOT NULL,
		from_date DATE NOT NULL,
		to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

-- Creating table for titles
CREATE TABLE titles(
		emp_no INT NOT NULL ,
		title VARCHAR(40) NOT NULL,
		from_date DATE NOT NULL,
		to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Creating Department Employees
CREATE TABLE dept_employees(
		emp_no INT NOT NULL,
		dept_no VARCHAR(5) NOT NULL,
		from_date DATE NOT NULL,
		to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);