CREATE TABLE accounts (
    account_no NUMBER,
    account_holder VARCHAR2(50),
    balance NUMBER(10,2)
);

INSERT INTO accounts VALUES (1001, 'James Wilson', 15000);
INSERT INTO accounts VALUES (1002, 'Sophia Martinez', 25000);
INSERT INTO accounts VALUES (1003, 'Oliver Smith', 18000);

COMMIT;

CREATE OR REPLACE FUNCTION get_balance
(
    p_account_no IN NUMBER
)
RETURN NUMBER
AS
    v_balance NUMBER;
BEGIN
    SELECT balance
    INTO v_balance
    FROM accounts
    WHERE account_no = p_account_no;

    RETURN v_balance;
END;
/