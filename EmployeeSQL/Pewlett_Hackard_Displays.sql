-- 1. List employee number, last name, first name, sex, and salary for each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no;

-- 2. List first name, last name, hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

-- 3. List manager of each department
--    List department number, department name, the manager's employee number, last name, first name	
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN employees AS e
	ON dm.emp_no = e.emp_no
JOIN departments AS d
	ON d.dept_no = dm.dept_no;

-- 4. List department of each employee
--    List employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no;
	
-- 5. List first name, last name, and sex for employees whose first name is
-- "Hercules" and last names begin with "B"
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- 6. List all employees in the Sales department
--    including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments,
--    including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007'
OR d.dept_no = 'd005';

-- 8. In descending order, list the frequency count of employee last names
SELECT
	e.last_name,
	COUNT(*) AS "Number Employees With Same Last Name"
FROM employees AS e
GROUP BY last_name
ORDER BY last_name DESC;