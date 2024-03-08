-- Function to return salary
CREATE OR REPLACE FUNCTION return_emp_salary(r_employee_id NUMBER)
   RETURN NUMBER
IS
   e_salary NUMBER;
BEGIN
   -- Retrieve the salary for the specified employee ID
   SELECT salary INTO e_salary
   FROM employee_data
   WHERE employee_id = r_employee_id;

   RETURN e_salary;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      -- Handle case where the employee is not found
      RETURN NULL;
   WHEN OTHERS THEN
      -- Handle other exceptions
      RETURN NULL;
END return_emp_salary;


-- calling function  to return salary of employee id 90001
DECLARE
   e_employee_id NUMBER(10) := 90001;  -- Replace with the desired employee ID
   e_salary NUMBER;

BEGIN
   e_salary := return_emp_salary(e_employee_id);

   IF e_salary IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('Employee ' || e_employee_id || ' salary is: ' || e_salary);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Employee with ID ' || e_employee_id || ' not found or has no salary.');
   END IF;
END;


