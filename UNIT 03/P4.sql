SET SERVEROUTPUT ON;

BEGIN
    FOR emp IN
    (
        SELECT STAFF_NAME, BASIC_SALARY
        FROM
        (
            SELECT STAFF_NAME, BASIC_SALARY
            FROM STAFF
            ORDER BY BASIC_SALARY DESC
        )
        WHERE ROWNUM <= 3
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Employee Name: ' || emp.STAFF_NAME ||
            ' | Basic Salary: ' || emp.BASIC_SALARY
        );
    END LOOP;
END;
/