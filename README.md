# sql-challenge

Text for ERD:
department
-
dept_no VARCHAR(4) PK
dept_name VARCHAR(255)

dept_emp
-
emp_no INTEGER FK - employees.emp_no
dept_no VARCHAR(4) FK >- department.dept_no
(emp_no,dept_no) (VARCHAR,VARCHAR) PK

dept_manager
-
dept_no VARCHAR(4) FK >- department.dept_no
emp_no INTEGER FK - employees.emp_no
(dept_no,emp_no) (VARCHAR,VARCHAR) PK

employees
-
emp_no INTEGER PK
emp_title VARCHAR(5) FK >- titles.title_id
birth_date DATE
first_name VARCHAR(255)
last_name VARCHAR(255)
sex VARCHAR(1)
hire_date DATE

salary
-
emp_no INT FK - employees.emp_no
salary INT
(emp_no,salary) (INT,INT) PK

titles
-
title_id VARCHAR(5) PK
title VARCHAR(255)

