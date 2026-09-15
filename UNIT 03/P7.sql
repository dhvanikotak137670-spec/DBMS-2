SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER;
BEGIN
    v_number := TO_NUMBER('ABC');

    DBMS_OUTPUT.PUT_LINE('Number is: ' || v_number);

EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid number entered.');
END;
/