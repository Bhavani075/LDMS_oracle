
CREATE TABLE transfer_dept_stage (
   employee_id NUMBER(10),
   new_department_id NUMBER(5)
);


INSERT INTO transfer_dept_stage VALUES (90001, 4);
INSERT INTO transfer_dept_stage VALUES (90002, 1);





DECLARE
   -- Cursor to check if the staging table has data
      CURSOR check_entry_cursor IS
      SELECT COUNT(*) AS num_rows
      FROM transfer_dept_stage;

      e_num_rows NUMBER;

   -- Cursor to fetch employees from the staging table
      CURSOR transfer_dept_cursor IS
      SELECT employee_id, new_department_id
      FROM transfer_dept_stage;

      e_employee_id NUMBER(10);
      e_new_department_id NUMBER(5);

BEGIN
   -- Check if the staging table has data
  	 OPEN check_entry_cursor;
   	 FETCH check_entry_cursor INTO e_num_rows;
   	 CLOSE check_entry_cursor;

   	 IF e_num_rows = 0 THEN
      -- If no data, raise an error message
      DBMS_OUTPUT.PUT_LINE('No data found in the transfer_dept_stage table');
   	 ELSE
      -- Loop through the cursor and Change dept of employees
     FOR transfer_dept_rec IN transfer_dept_cursor LOOP
         e_employee_id := transfer_dept_rec.employee_id;
         e_new_department_id := transfer_dept_rec.new_department_id;

       -- Update employee's department
      UPDATE employee_data
      SET department_id = e_new_department_id
      WHERE employee_id = e_employee_id;
      DBMS_OUTPUT.PUT_LINE('Employee ' || e_employee_id || ' is transferred to new department ' || e_new_department_id);
      END LOOP;
      -- Delete staging table data after transfer
      DELETE FROM transfer_dept_stage;
      DBMS_OUTPUT.PUT_LINE('Transfer process completed.');
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;


