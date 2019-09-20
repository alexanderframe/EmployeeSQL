-- TASK 1 - List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
     INNER JOIN salaries AS s ON s.emp_no = e.emp_no;

-----------------------------------------------------------------------------

-- TASK 2 - List employees who were hired in 1986

SELECT emp_no, 
       CONCAT(first_name, ' ', last_name) AS Employee name,
       hire_date
FROM salaries
WHERE hire_date LIKE ('%1986');

-----------------------------------------------------------------------------

-- TASK 3 - List the manager of each department with the following information: 
-- department number, department name, 
-- the manager's employee number, last name, 
-- first name, start and end employment dates.

SELECT d.dept_no, d.dept_name,
       dM.emp_no, e.last_name, e.first_name,
       dM.from_date, dM.to_date
FROM employees AS e
    INNER JOIN dept_manager AS dM ON dM.emp_no = e.emp_no
    INNER JOIN departments AS d ON d.dept_no = dM.dept_no;

-----------------------------------------------------------------------------

-- TASK 4 - List the department of each employee with the following information: 
employee number, last name, first name, department name

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
    INNER JOIN dept_emp AS dE ON dE.emp_no = e.emp_no
    INNER JOIN departments AS d ON d.dept_no = dE.dept_no;

-----------------------------------------------------------------------------

-- TASK 5 - List all employees whose first name is "Hercules" 
-- and last names begin with "B"

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

-----------------------------------------------------------------------------

-- TASK 6 - List all employees in the Sales department, 
-- including their:
-- employee number, last name, first name, and department name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS dE ON dE.emp_no = e.emp_no
    INNER JOIN departments AS d ON d.dept_no = dE.dept_no
WHERE d.dept_name = 'Sales';

-----------------------------------------------------------------------------

-- TASK 7 - List all employees in the Sales and Development departments, 
-- including their: 
-- employee number, last name, first name, and department name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS dE ON dE.emp_no = e.emp_no
    INNER JOIN departments AS d ON d.dept_no = dE.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-----------------------------------------------------------------------------

-- TASK 8 - In descending order, 
-- list the frequency count of employee last names, 
-- i.e., how many employees share each last name

SELECT last_name, 
    COUNT(last_name) AS "Employees with Name"
FROM employees
GROUP BY last_name
ORDER BY "Employees with Name" DESC;