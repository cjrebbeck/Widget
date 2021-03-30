CREATE OR REPLACE PACKAGE department_data
IS 
     PROCEDURE write_emps(p_dept_id IN employee.dept_id%TYPE);
     PROCEDURE write_total_sal(p_dept_id IN employee.dept_id%TYPE);
END department_data; 