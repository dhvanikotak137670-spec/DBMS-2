CREATE TRIGGER trg_RestrictSalary
ON EMP
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE SALARY > 50000
    )
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Error: Salary cannot be greater than Rs. 50000';
    END
END;