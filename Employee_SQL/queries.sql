--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT dpm.dept_no, d.dept_name, dpm.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager AS dpm ON
dpm.emp_no = e.emp_no
INNER JOIN departments AS d ON
dpm.dept_no = d.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dpe ON
e.emp_no = dpe.emp_no
INNER JOIN departments AS d ON
dpe.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dpe ON
e.emp_no = dpe.emp_no
INNER JOIN departments AS d ON
dpe.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dpe ON
e.emp_no = dpe.emp_no
INNER JOIN departments AS d ON
dpe.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. List the frequency count of employee last names in descending order.

SELECT last_name, count(last_name) AS "LastCount"
FROM employees
GROUP BY last_name
ORDER BY "LastCount" DESC;