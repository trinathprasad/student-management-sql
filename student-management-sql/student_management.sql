-- Create DEPARTMENT table
CREATE TABLE DEPARTMENT (
    DEPT_ID NUMBER(3) PRIMARY KEY,
    DEPT_NAME VARCHAR2(50) NOT NULL
);

-- Insert sample data into DEPARTMENT
INSERT INTO DEPARTMENT VALUES (101, 'Computer Science');
INSERT INTO DEPARTMENT VALUES (102, 'Electronics');
INSERT INTO DEPARTMENT VALUES (103, 'Mechanical');



-- Create STUDENT table
CREATE TABLE STUDENT (
    STUDENT_ID NUMBER(5) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(50) NOT NULL,
    AGE NUMBER(2) CHECK (AGE >= 17),
    DEPT_ID NUMBER(3),
    CONSTRAINT fk_dept FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
);


-- Insert sample data into STUDENT
INSERT INTO STUDENT VALUES (1001, 'Trinath', 22, 101);
INSERT INTO STUDENT VALUES (1002, 'Sneha', 21, 102);
INSERT INTO STUDENT VALUES (1003, 'Rohan', 20, 103);
INSERT INTO STUDENT VALUES (1004, 'Anjali', 23, 101);




-- SELECT query using INNER JOIN to get student with department name
SELECT 
    S.STUDENT_ID,
    S.STUDENT_NAME,
    S.AGE,
    D.DEPT_NAME
FROM 
    STUDENT S
JOIN 
    DEPARTMENT D ON S.DEPT_ID = D.DEPT_ID;



-- Another query: List all students who are 21 or older and from 'Computer Science'
SELECT 
    S.STUDENT_NAME,
    S.AGE,
    D.DEPT_NAME
FROM 
    STUDENT S
JOIN 
    DEPARTMENT D ON S.DEPT_ID = D.DEPT_ID
WHERE 
    S.AGE >= 21 AND D.DEPT_NAME = 'Computer Science';
