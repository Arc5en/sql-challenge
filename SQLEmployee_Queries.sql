-- 1. List employee number, first & last name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salary AS s ON
s.emp_no=e.emp_no;

-- 2. List first & last name and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';
-- Alternative to last line: WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List managers & their dept. #, dept. name, employee #, last & first name
SELECT d.dept_no, d.dept_name, ma.emp_no, e.last_name, e.first_name
FROM dept_manager AS ma
INNER JOIN department AS d ON
d.dept_no=ma.dept_no
INNER JOIN employees AS e ON
e.emp_no=ma.emp_no;

-- 4. List employee's dept. #, employee #, last & first name, and dept. name
SELECT d.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN department AS d ON
d.dept_no = de.dept_no
INNER JOIN employees AS e ON
e.emp_no = de.emp_no;

-- 5. List first & last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List Sales employees' employee #, last & first name (JOINS can be used)
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM department
		WHERE dept_name = 'Sales'
		
	)
);

-- 7. List Sales & Development employees' employee #, last & first name,
-- and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN department AS d ON
d.dept_no=de.dept_no
INNER JOIN employees AS e ON
e.emp_no=de.emp_no
WHERE e.emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM department
		WHERE dept_name = 'Development' OR dept_name = 'Sales'
	)
);

-- 8. List all employees last name counts in descending order
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;