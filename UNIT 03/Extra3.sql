DECLARE
    a NUMBER := &a;
    b NUMBER := &b;
    c NUMBER;

    myexcep1 EXCEPTION;
    PRAGMA EXCEPTION_INIT(myexcep1, -20003);

BEGIN
    IF b = 0 THEN
        RAISE myexcep1;
    ELSE
        c := a / b;
        DBMS_OUTPUT.PUT_LINE('res = ' || c);
    END IF;

EXCEPTION
    WHEN myexcep1 THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide a with 0');

END;
/