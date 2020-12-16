SELECT
	e.gender, 
    d.dept_name,
    ROUND(AVG(s.salary),2) AS salary,
    YEAR(s.from_date) AS calender_year
FROM
	t_salaries s
JOIN
	t_employees e
ON s.emp_no = e.emp_no
JOIN
	t_dept_emp de
ON de.emp_no = e.emp_no
JOIN
	t_departments d
ON d.dept_no = de.dept_no
GROUP BY
	d.dept_name, e.gender, calender_year
HAVING 
	calender_year <= 2002
ORDER BY 
	d.dept_name;