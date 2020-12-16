SELECT 
	d.dept_name, ee.gender, dm.emp_no, dm.from_date, dm.to_date, e.calender_year,
	CASE
		WHEN YEAR(dm.from_date) <= e.calender_year AND YEAR(dm.to_date) >= e.calender_year THEN '1'
        ELSE '0'
	END AS 'active'
FROM 	
	(SELECT 
		YEAR(hire_date) AS calender_year
	FROM
		t_employees
	GROUP BY
		calender_year) e
	CROSS JOIN
		t_dept_manager dm
	JOIN
		t_departments d
	ON	dm.dept_no = d.dept_no
    JOIN
		t_employees ee
	ON	dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calender_year;

    
		
	