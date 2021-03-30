CREATE TABLE employee
    (emp_id      NUMBER(10)   NOT NULL 
    ,emp_name    VARCHAR2(50) NOT NULL
    ,job_title   VARCHAR2(50) NOT NULL
    ,manager_id  NUMBER(10)   
    ,date_hired  DATE         NOT NULL
    ,salary      FLOAT        NOT NULL
    ,dept_id     NUMBER(5)    NOT NULL
    ,CONSTRAINT emp_id_pk PRIMARY KEY (emp_id)
    ,CONSTRAINT dept_id_fk FOREIGN KEY (dept_id) REFERENCES department(dept_id)
    );