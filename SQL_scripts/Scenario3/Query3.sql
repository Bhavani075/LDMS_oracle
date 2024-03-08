-- Procedure to create or replace new employee

CREATE OR REPLACE PROCEDURE new_employee(
   e_employee_id NUMBER,
   e_employee_name CHARACTER,
   e_job_title CHARACTER,
   e_manager_id NUMBER,
   e_date_hired DATE,
   e_salary NUMBER,
   e_department_id NUMBER
) IS
BEGIN
   -- Insert a new employee 

   INSERT INTO employee_data (
      employee_id,
      employee_name,
      job_title,
      manager_id,
      date_hired,
      salary,
      department_id
   ) VALUES (
      e_employee_id,
      e_employee_name,
      e_job_title,
      e_manager_id,
      e_date_hired,
      e_salary,
      e_department_id
   );
   
   DBMS_OUTPUT.PUT_LINE('New employee inserted successfully '||e_employee_id);
END new_employee;

--call the above procedure with the details of new employee to be created

BEGIN
   new_employee(
      e_employee_id     => 90020,
      e_employee_name    => 'Milan ',
      e_job_title        => 'Test lead',
      e_manager_id       => 90007,
      e_date_hired       => TO_DATE('14-Dec-1991', 'DD-Mon-YYYY'),
      e_salary           => 75000,
      e_department_id    => 4);
END;




