CREATE OR REPLACE PACKAGE BODY employee_data 
IS

--------------------------------------------------------------
-- PRIVATE  
--------------------------------------------------------------

    FUNCTION valid_manager(p_emp_id IN employee.emp_id%TYPE) 
    RETURN BOOLEAN 
    IS
        CURSOR emp_cur(p_emp_id IN employee.emp_id%TYPE) 
        IS 
            SELECT emp_id  
              FROM employee  
             WHERE emp_id = p_emp_id;
        
        l_emp_id employee.emp_id%TYPE; 
        l_valid_manager BOOLEAN := FALSE;
    BEGIN 
        OPEN emp_cur(p_emp_id => valid_manager.p_emp_id);
        FETCH emp_cur INTO l_emp_id;
            l_valid_manager := emp_cur%FOUND;
        CLOSE emp_cur;       
        RETURN l_valid_manager;
    END valid_manager; 

--------------------------------------------------------------
-- PUBLIC 
--------------------------------------------------------------

    ---------------------------------------------------------
    --adjust_sal
    FUNCTION adjust_sal(p_current_sal IN employee.salary%TYPE 
                       ,p_adj_type    IN VARCHAR2 
                       ,p_perc_change IN NUMBER 
                       )
    RETURN employee.salary%TYPE
    IS
        c_max_increase CONSTANT NUMBER(2) := 20; -- v2 convert to get/set function
        -- user will provide an ABS number for decrease 
        c_min_decrease CONSTANT NUMBER(2) := 10; -- v2 convert to get/set function
    BEGIN 
        RETURN CASE WHEN p_adj_type = 'I' AND p_perc_change BETWEEN 0 AND c_max_increase 
                    THEN p_current_sal + ROUND(p_current_sal / 100 * p_perc_change,2) 
                    WHEN p_adj_type = 'D' AND ABS(p_perc_change) BETWEEN 0 AND c_min_decrease
                    THEN p_current_sal - ROUND(p_current_sal / 100 * p_perc_change,2)
                    ELSE p_current_sal 
                    END;
    END adjust_sal;

    -------------------------------------------------
    --get_sal
    FUNCTION get_sal(p_emp_id IN employee.emp_id%TYPE)
    RETURN employee.salary%TYPE
    IS 
        CURSOR sal_cur(p_emp_id IN employee.emp_id%TYPE)
        IS 
            SELECT salary 
              FROM employee 
             WHERE emp_id = sal_cur.p_emp_id; 
    
        l_salary employee.salary%TYPE;
    BEGIN 
        OPEN sal_cur(p_emp_id => get_sal.p_emp_id);
        FETCH sal_cur INTO l_salary;
        CLOSE sal_cur; 
        RETURN NVL(l_salary,0);
    END get_sal;

    -----------------------------------------------------
    --move_dept
    PROCEDURE move_dept(p_emp_id IN employee.emp_id%TYPE
                       ,p_dept_id IN department.dept_id%TYPE 
                       )
    IS 
        invalid_dept EXCEPTION; 
        PRAGMA EXCEPTION_INIT(invalid_dept, -2291);
    BEGIN
        UPDATE employee 
           SET dept_id = p_dept_id 
         WHERE emp_id = p_emp_id;   
    EXCEPTION
        WHEN invalid_dept 
        THEN 
            RAISE_APPLICATION_ERROR(-20000,'Must enter a valid department Number');
    END move_dept;
    
    -----------------------------------------------------
    --create_emp
    PROCEDURE create_emp(p_emp_rec IN employee%ROWTYPE)
    IS
        invalid_dept EXCEPTION; 
        PRAGMA EXCEPTION_INIT(invalid_dept, -2291);

        null_col EXCEPTION; 
        PRAGMA EXCEPTION_INIT(null_col, -1400);
    
        invalid_manager EXCEPTION; 
        PRAGMA EXCEPTION_INIT(invalid_manager, -20002);
      
        l_valid_manager BOOLEAN := FALSE; 
    BEGIN
        l_valid_manager := valid_manager(p_emp_id => p_emp_rec.manager_id);
        
        IF NOT l_valid_manager
        THEN  
            RAISE invalid_manager;    
        END IF;
            
        INSERT INTO employee 
            (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
        VALUES 
            (emp_id_seq.NEXTVAL, p_emp_rec.emp_name, p_emp_rec.job_title, p_emp_rec.manager_id, p_emp_rec.date_hired, p_emp_rec.salary, p_emp_rec.dept_id);
    EXCEPTION
        WHEN invalid_dept 
        THEN 
            RAISE_APPLICATION_ERROR(-20000,'Must enter a valid department Number');
       WHEN null_col 
        THEN 
            RAISE_APPLICATION_ERROR(-20001,'All mandatory fields must have a value');
       WHEN invalid_manager
       THEN      
            RAISE_APPLICATION_ERROR(-20002,'Must enter a valid Manager Id');
    END create_emp;
    
END employee_data;