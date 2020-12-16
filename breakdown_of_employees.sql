use employees_mod;

SELECT
	YEAR(de.from_date) as calendar_year, e.gender, COUNT(de.emp_no)
FROM	
	t_dept_emp de
JOIN	
	t_employees e
ON		
	de.emp_no = e.emp_no
GROUP BY 
	e.gender, calendar_year
HAVING
	calendar_year >= '1990'
ORDER BY
	calendar_year;