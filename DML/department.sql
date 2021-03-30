SET DEFINE OFF

INSERT INTO department 
    (dept_id
    ,dept_name
    ,location
    )
VALUES 
    (dept_id_seq.NEXTVAL
    ,'Management'  
    ,'London'
    );   
    
INSERT INTO department 
    (dept_id
    ,dept_name
    ,location
    )
VALUES 
    (dept_id_seq.NEXTVAL
    ,'Engineering'  
    ,'Cardiff'
    );       
    
INSERT INTO department 
    (dept_id
    ,dept_name
    ,location
    )
VALUES 
    (dept_id_seq.NEXTVAL
    ,'Research & Development'  
    ,'Edinburgh'
    );       

INSERT INTO department 
    (dept_id
    ,dept_name
    ,location
    )
VALUES 
    (dept_id_seq.NEXTVAL
    ,'Sales'  
    ,'Belfast'
    );       

COMMIT;     