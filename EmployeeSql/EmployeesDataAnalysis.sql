--1.employee number, last name, first name, sex, salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no;

--2.first name, last name, hire date in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, dpt.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
JOIN departments as dpt
ON dm.dept_no=dpt.dept_no
JOIN employees as e
ON dm.emp_no=e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name,departments.dept_name
FROM dept_emp as d
JOIN employees as e
ON d.emp_no=e.emp_no
JOIN departments
ON d.dept_no=departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,e.last_name,e.first_name
FROM employees as e
JOIN dept_emp as d
ON e.emp_no=d.emp_no
WHERE d.dept_no='d007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no=de.emp_no
JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;