
----PLSQL Procedure that holds the logic to fetch employee details according to department
CREATE OR REPLACE PROCEDURE emp_dept_details(p_department_id IN NUMBER) IS
BEGIN

    --for loop is created to fetch the details in table from row 1 till the end 
    FOR emp_rec IN (
        SELECT e.employee_id, e.employee_name, d.department_id
        FROM employee_data e, department_data d
        WHERE e.department_id = d.department_id
        AND d.department_id = p_department_id
    ) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_rec.employee_id || ', Name: ' || emp_rec.employee_name || 'belongs to Department ID: ' || emp_rec.department_id );
    END LOOP;
END emp_dept_details;

----To call the procedure by passing for which department we need employee details
----In this block we are fetching details for department id 1
DECLARE
    check_department NUMBER := 1;
BEGIN
    emp_dept_details(check_department);
END;

