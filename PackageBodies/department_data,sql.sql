CREATE OR REPLACE PACKAGE BODY department_data
IS 
    --pre-existing utl_file dir
    c_mvp_dir CONSTANT VARCHAR2(30) := 'UTL_DIR';

--------------------------------------------------------------
-- PRIVATE
--------------------------------------------------------------

    -- open_utl_file
    PROCEDURE open_utl_file(dba_directory IN     VARCHAR2 DEFAULT c_mvp_dir
                           ,file_name     IN     VARCHAR2
                           ,file_ext      IN     VARCHAR2 DEFAULT '.csv'
                           ,file_mode     IN     VARCHAR2 DEFAULT 'w'
                           ,file_handler     OUT UTL_FILE.FILE_TYPE
                           )
    IS
    BEGIN
        open_utl_file.file_handler := UTL_FILE.FOPEN(open_utl_file.dba_directory, open_utl_file.file_name||open_utl_file.file_ext, open_utl_file.file_mode);
    END open_utl_file;

--------------------------------------------------------------
-- PUBLIC 
--------------------------------------------------------------

   ---------------------------------------------------------
    --write_emps
    PROCEDURE write_emps(p_dept_id IN employee.dept_id%TYPE)
    IS 
        lv_write_handler  UTL_FILE.FILE_TYPE;

        CURSOR emp_cur(p_dept_id IN employee.dept_id%TYPE) 
        IS 
            SELECT dept_name,e.emp_id,e.emp_name,e.job_title
              FROM department d 
                  ,employee e 
             WHERE e.dept_id = d.dept_id
               AND e.dept_id = emp_cur.p_dept_id; 
    BEGIN 
        IF UTL_FILE.IS_OPEN(lv_write_handler)
        THEN
            UTL_FILE.FCLOSE(lv_write_handler);
        END IF;

        open_utl_file(file_name    => 'Department_'||TO_CHAR(write_emps.p_dept_id||'_Employees')
                     ,file_handler => lv_write_handler
                     );

        UTL_FILE.PUT_LINE(lv_write_handler, 'Department,Employee Id,Employee Name,Job Title');

        FOR emp_rec IN emp_cur(p_dept_id => write_emps.p_dept_id) 
        LOOP
            UTL_FILE.PUT_LINE(lv_write_handler, emp_rec.dept_name||','||emp_rec.emp_id||','||emp_rec.emp_name||','||emp_rec.job_title);
        END LOOP;

        IF UTL_FILE.IS_OPEN(lv_write_handler)
        THEN
            UTL_FILE.FCLOSE(lv_write_handler);
        END IF; 
    EXCEPTION     
        WHEN OTHERS 
    THEN
        IF UTL_FILE.IS_OPEN(lv_write_handler)
        THEN
            UTL_FILE.FCLOSE(lv_write_handler);
        END IF; 
    END write_emps;
  
   ---------------------------------------------------------
    --write_total_sal  
    PROCEDURE write_total_sal(p_dept_id IN employee.dept_id%TYPE)
    IS 
        lv_write_handler  UTL_FILE.FILE_TYPE;

        CURSOR emp_cur(p_dept_id IN employee.dept_id%TYPE) 
        IS 
            SELECT dept_name, SUM(salary) AS total_sal 
              FROM department d 
                  ,employee e 
             WHERE e.dept_id = d.dept_id
               AND e.dept_id = emp_cur.p_dept_id; 
        
        emp_rec emp_cur%ROWTYPE; 
    BEGIN 
        IF UTL_FILE.IS_OPEN(lv_write_handler)
        THEN
            UTL_FILE.FCLOSE(lv_write_handler);
        END IF;

        open_utl_file(file_name    => 'Department_'||TO_CHAR(write_total_sal.p_dept_id||'_Total_Sal')
                     ,file_handler => lv_write_handler
                     );

        UTL_FILE.PUT_LINE(lv_write_handler, 'Department,Total_Salary');

        OPEN emp_cur(p_dept_id => write_total_sal.p_dept_id);
        FETCH emp_cur INTO emp_rec;
        CLOSE emp_cur;
        
        IF emp_cur%FOUND 
        THEN 
            UTL_FILE.PUT_LINE(lv_write_handler, emp_rec.dept_name||','||emp_rec.total_sal);
        END IF;

        IF UTL_FILE.IS_OPEN(lv_write_handler)
        THEN
            UTL_FILE.FCLOSE(lv_write_handler);
        END IF; 
    EXCEPTION     
        WHEN OTHERS 
    THEN
        IF UTL_FILE.IS_OPEN(lv_write_handler)
        THEN
            UTL_FILE.FCLOSE(lv_write_handler);
        END IF; 
    END write_total_sal; 
    
END department_data; 