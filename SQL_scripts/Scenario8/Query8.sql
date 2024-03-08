--total employee salary for a dept
SELECT d.department_id,d.department_name, SUM(e.salary) AS total_salary
FROM employee_data e, department_data d
WHERE e.department_id=d.department_id
GROUP BY d.department_id,d.department_name ;
