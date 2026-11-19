CREATE TRIGGER trg_SetEmployeeTitle
ON Employee
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE E
    SET E.EmployeeName =
        CASE
            WHEN I.Gender = 'MALE'
                THEN 'MR. ' + E.EmployeeName
            WHEN I.Gender = 'FEMALE'
                THEN 'MS. ' + E.EmployeeName
            ELSE E.EmployeeName
        END
    FROM Employee E
    INNER JOIN inserted I
        ON E.EmployeeID = I.EmployeeID
    WHERE E.EmployeeName NOT LIKE 'MR. %'
      AND E.EmployeeName NOT LIKE 'MS. %';
END;
