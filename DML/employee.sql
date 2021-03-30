INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'John Smith', 'CEO', NULL, TO_DATE('01/01/1995','DD/MM/YYYY'), 100000, 1);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Jimmy Willis', 'Manager', 90001, TO_DATE('23/09/2003','DD/MM/YYYY'), 52500, 4);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Roxy Jones', 'Salesperson', 90002, TO_DATE('11/02/2017','DD/MM/YYYY'), 35000, 4);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Selwyn Field', 'Salesperson', 90003, TO_DATE('20/05/2015','DD/MM/YYYY'), 32000, 4);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'David Hallett', 'Engineer', 90006, TO_DATE('17/04/2018','DD/MM/YYYY'), 40000, 2);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Sarah Phelps', 'Manager', 90001, TO_DATE('21/03/2015','DD/MM/YYYY'), 45000, 2);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Louise Harper', 'Engineer', 90006, TO_DATE('01/01/2013','DD/MM/YYYY'), 47000, 2);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Tina Hart', 'Engineer', 90009, TO_DATE('28/07/2014','DD/MM/YYYY'), 45000, 3);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Gus Jones', 'Manager', 90001, TO_DATE('15/05/2008','DD/MM/YYYY'), 50000, 3);

INSERT INTO employee 
    (emp_id, emp_name, job_title, manager_id, date_hired, salary, dept_id)
VALUES 
    (emp_id_seq.NEXTVAL, 'Mildred Hall', 'Secretary', 90001, TO_DATE('12/10/1996','DD/MM/YYYY'), 35000, 1);

COMMIT;