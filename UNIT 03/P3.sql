CREATE TABLE STAFF
(
    STAFF_ID NUMBER(4),
    STAFF_NAME VARCHAR2(20),
    BASIC_SALARY NUMBER(8,2),
    DEPT_NO NUMBER(2)
);

-- Insert new records
INSERT INTO STAFF VALUES (201, 'Arjun', 78000, 10);
INSERT INTO STAFF VALUES (202, 'Meera', 62000, 20);
INSERT INTO STAFF VALUES (203, 'Rohan', 91000, 30);
INSERT INTO STAFF VALUES (204, 'Kavya', 73000, 20);
INSERT INTO STAFF VALUES (205, 'Dev', 88000, 10);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_staff_name STAFF.STAFF_NAME%TYPE;
    v_salary     STAFF.BASIC_SALARY%TYPE;
BEGIN
    -- Accept employee name from the user
    v_staff_name := '&Enter_Employee_Name';

    -- Find the employee's basic salary
    SELECT BASIC_SALARY
    INTO v_salary
    FROM STAFF
    WHERE UPPER(STAFF_NAME) = UPPER(v_staff_name);

    -- Display employee name and salary
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_staff_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee does not exist.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee found with this name.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/