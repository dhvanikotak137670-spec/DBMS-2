CREATE TRIGGER trg_RestrictWeekendAccess
ON ALL SERVER
FOR LOGON
AS
BEGIN
    IF DATENAME(WEEKDAY, GETDATE()) IN ('Saturday', 'Sunday')
    BEGIN
        ROLLBACK;
    END
END;