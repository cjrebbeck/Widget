CREATE OR REPLACE PACKAGE employee_data 
IS
    FUNCTION adjust_sal(p_current_sal IN employee.salary%TYPE 
                       ,p_adj_type    IN VARCHAR2 
                       ,p_perc_change IN NUMBER 
                       )
    RETURN employee.salary%TYPE;
    
    FUNCTION get_sal(p_emp_id IN employee.emp_id%TYPE)
    RETURN employee.salary%TYPE;

    PROCEDURE move_dept(p_emp_id  IN employee.emp_id%TYPE
                       ,p_dept_id IN department.dept_id%TYPE 
                       );

    PROCEDURE create_emp(p_emp_rec IN employee%ROWTYPE);

END employee_data;