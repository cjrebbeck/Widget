--move the secretary to the manager dept
BEGIN 
    --fails 
    employee_data.move_dept(p_emp_id  => 90010
                           ,p_dept_id => 5 
                           );
END;
/

BEGIN 
    --passes
    employee_data.move_dept(p_emp_id  => 90010
                           ,p_dept_id => 3 
                           );
END;
/              

--create new employer
DECLARE 
    l_emp_rec employee%ROWTYPE;
BEGIN 
    l_emp_rec.emp_name    := 'Chris Rebbeck';
    l_emp_rec.job_title   := 'Engineer';
    l_emp_rec.manager_id  := NULL; 
    l_emp_rec.date_hired  := TRUNC(SYSDATE); 
    l_emp_rec.salary      := 60000;
    --fails
    l_emp_rec.dept_id     := 5;  
    employee_data.create_emp(p_emp_rec => l_emp_rec);
    NULL;
END;
/              

DECLARE 
    l_emp_rec employee%ROWTYPE;
BEGIN 
    l_emp_rec.emp_name    := 'Chris Rebbeck';
    --fails
    l_emp_rec.job_title   := NULL;
    l_emp_rec.manager_id  := NULL; 
    l_emp_rec.date_hired  := TRUNC(SYSDATE); 
    l_emp_rec.salary      := 60000;
    l_emp_rec.dept_id     := 4;  
    --create new employer
    employee_data.create_emp(p_emp_rec => l_emp_rec);
    NULL;
END;
/  
   
DECLARE 
    l_emp_rec employee%ROWTYPE;
BEGIN 
    l_emp_rec.emp_name    := 'Chris Rebbeck';
    --fails
    l_emp_rec.job_title   := 'Engineer';
    l_emp_rec.manager_id  := NULL; 
    l_emp_rec.date_hired  := TRUNC(SYSDATE); 
    l_emp_rec.salary      := 60000;
    l_emp_rec.dept_id     := 4;  
    --create new employer
    employee_data.create_emp(p_emp_rec => l_emp_rec);
    NULL;
END;
/  

DECLARE 
    l_emp_rec employee%ROWTYPE;
BEGIN 
    l_emp_rec.emp_name    := 'Chris Rebbeck';
    l_emp_rec.job_title   := 'Engineer';
    --fails
    l_emp_rec.manager_id  := 90000; 
    l_emp_rec.date_hired  := TRUNC(SYSDATE); 
    l_emp_rec.salary      := 60000;
    l_emp_rec.dept_id     := 4;  
    --create new employer
    employee_data.create_emp(p_emp_rec => l_emp_rec);
    NULL;
END;
/  

--create new employer
DECLARE 
    l_emp_rec employee%ROWTYPE;
BEGIN 
    l_emp_rec.emp_name    := 'Chris Rebbeck';
    l_emp_rec.job_title   := 'Engineer';
    --report to the big boss
    l_emp_rec.manager_id  := 90001; 
    l_emp_rec.date_hired  := TRUNC(SYSDATE); 
    l_emp_rec.salary      := 60000;
    l_emp_rec.dept_id     := 4;  
    --create new employer
    employee_data.create_emp(p_emp_rec => l_emp_rec);
    NULL;
END;
/  

BEGIN 
     department_data.write_emps(p_dept_id =>3);
END;
/     

BEGIN 
     department_data.write_total_sal(p_dept_id =>3);
END;
/          

