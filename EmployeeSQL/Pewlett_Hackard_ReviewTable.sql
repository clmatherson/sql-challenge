-- Create Table to review in Pandas
DROP TABLE IF EXISTS review;
CREATE TABLE review AS
	SELECT e.emp_no, e.hire_date, e.birth_date, e.first_name, e.last_name, d.dept_name, t.title, s.salary
	FROM employees AS e
	JOIN dept_emp AS de
		ON e.emp_no = de.emp_no
	JOIN departments AS d
		ON de.dept_no = d.dept_no
	JOIN titles AS t
		ON e.emp_title_id = t.title_id
	JOIN salaries AS s
		ON e.emp_no = s.emp_no;
