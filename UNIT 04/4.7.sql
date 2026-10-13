CREATE TABLE employees (
    employee_id NUMBER,
    employee_name VARCHAR2(50),
    salary NUMBER,
    department_id NUMBER
);

INSERT INTO employees VALUES (101, 'James Wilson', 45000, 10);
INSERT INTO employees VALUES (102, 'Sophia Martinez', 52000, 10);
INSERT INTO employees VALUES (103, 'Oliver Smith', 38000, 20);
INSERT INTO employees VALUES (104, 'Emma Johnson', 60000, 20);
INSERT INTO employees VALUES (105, 'Lucas Brown', 47500, 10);

COMMIT;

CREATE OR REPLACE PROCEDURE increase_salary
(
    p_deptno IN NUMBER,
    p_percent IN NUMBER
)
AS
BEGIN
    UPDATE employees
    SET salary = salary + (salary * p_percent / 100)
    WHERE department_id = p_deptno;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
END;
/