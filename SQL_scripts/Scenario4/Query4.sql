DECLARE
   e_employee_id NUMBER(10) := 90020;
   e_percentage_change NUMBER := -10;
   e_salary NUMBER(10) := 75000;
   e_new_salary NUMBER(10);

BEGIN
   -- Retrieve the current salary
   SELECT salary INTO e_salary
   FROM employee_data
   WHERE employee_id = e_employee_id;

   -- Calculate the new salary
   e_new_salary := e_salary + (e_salary * e_percentage_change / 100);

   -- Update new salary
   UPDATE employee_data
   SET salary = e_new_salary
   WHERE employee_id = e_employee_id;

   DBMS_OUTPUT.PUT_LINE('New salary updated successfully');
END;

