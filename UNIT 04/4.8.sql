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


CREATE OR REPLACE PROCEDURE SEARCH_EMP
(
    p_empno IN NUMBER,
    p_result OUT VARCHAR2
)
AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM employees
    WHERE employee_id = p_empno;

    IF v_count > 0 THEN
        p_result := 'Employee is present';
    ELSE
        p_result := 'Employee is not present';
    END IF;
END;
/