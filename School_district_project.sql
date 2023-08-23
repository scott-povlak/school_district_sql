/* Display employee information with department details*/
SELECT e.emp_id, e.first_name, e.last_name, e.salary, d.dept, d.city
FROM employees AS e
INNER JOIN departments AS d ON e.dept_id = d.dept_id;

/*Find employees in the tax department*/
SELECT e.first_name, e.last_name, d.dept
FROM employees AS e
INNER JOIN departments AS d ON e.dept_id = d.dept_id
WHERE d.dept = 'Tax';

/*Display schools present in both district tables*/
SELECT d20.school_2020, d35.school_2035
FROM district_2020 AS d20
INNER JOIN district_2035 AS d35 ON d20.school_2020 = d35.school_2035;

/*Display employee last names with total salaries per department ordered by total salary*/
SELECT d.dept, e.last_name, SUM(e.salary) AS total_salary
FROM employees AS e
INNER JOIN departments AS d ON e.dept_id = d.dept_id
GROUP BY d.dept, e.last_name
ORDER BY total_salary DESC;

/*Find schools present in 2035 but not 2020*/
SELECT d35.school_2035
FROM district_2035 AS d35
LEFT JOIN district_2020 AS d20 ON d35.school_2035 = d20.school_2020
WHERE d20.school_2020 IS NULL;

/*Combine enrollment and grades using ID*/
SELECT e.id, e.enrollment, g.grades
FROM district_2020_enrollment AS e
INNER JOIN district_2020_grades AS g ON e.id = g.id;

/*Calculate average enrollment per grade*/
SELECT ROUND(AVG(e.enrollment),2) AS avg_enrollment, g.grades
FROM district_2020_enrollment AS e
INNER JOIN district_2020_grades AS g ON e.id = g.id
GROUP BY g.grades;

/*Find schools with enrollment less than 500*/
SELECT e.enrollment, d20.school_2020
FROM district_2020_enrollment AS e
INNER JOIN district_2020 AS d20 ON e.id = d20.id
WHERE e.enrollment < 500;

/* Find schools with above average employment using a subquery*/
SELECT d.school_2020, e.enrollment
FROM district_2020_enrollment AS e
INNER JOIN district_2020 AS d ON e.id = d.id
WHERE e.enrollment > (SELECT AVG(enrollment) 
					  FROM district_2020_enrollment);



