--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no as "Employee Number", 
	   last_name as "Last Name", 
	   first_name as "First Name", 
	   dep.dept_name as "Department Name"
FROM employees e
JOIN dept_emp d
	JOIN departments dep
	ON d.dept_no = dep.dept_no
ON e.emp_no = d.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employees
Where date_part('year', hire_date) = 1986;

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name.*/
SELECT m.dept_no as "Department Number",
	   d.dept_name as "Department Name",
	   m.emp_no as "Employee Number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name"
FROM employees as e
JOIN dept_manager as m
	JOIN departments as d
	ON m.dept_no = d.dept_no
ON m.emp_no = e.emp_no;

/*List the department of each employee with the following information: 
employee number, last name, first name, and department name.[WHAT DO I DO ABOUT DUPLICATES]*/
SELECT e.emp_no as "Employee Number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name",
	   d.dept_name as "Department Name"
FROM employees as e
JOIN dept_emp as de
	JOIN departments as d
	ON de.dept_no = d.dept_no
ON e.emp_no = de.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

/*List all employees in the Sales department, including their 
employee number, last name, first name, and department name.*/
SELECT e.emp_no as "Employee Number",
	   last_name as "Last Name",
	   first_name as "First Name",
	   dept_name as "Department Name"
FROM employees as e
JOIN dept_emp as de
	JOIN departments as d
	ON de.dept_no = d.dept_no
ON e.emp_no = de.emp_no
WHERE dept_name = 'Sales';

/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
SELECT e.emp_no as "Employee Number",
	   last_name as "Last Name",
	   first_name as "First Name",
	   dept_name as "Department Name"
FROM employees as e
JOIN dept_emp as de
	JOIN departments as d
	ON de.dept_no = d.dept_no
ON e.emp_no = de.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';


/*In descending order, list the frequency count of employee last names, i.e., 
how many employees share each last name.*/
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;
