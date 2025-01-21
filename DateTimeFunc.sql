----------time and date functions--------

SELECT GETDATE(); ---return current time and date of system
SELECT SYSDATETIME(); --Returns the current date and time with more precision (includes fractional seconds).
SELECT GETUTCDATE();-- similar to GETDATE()

SELECT DATEADD(DAY, 5, GETDATE()); -- Adds 5 days to the current date
SELECT DATEDIFF(DAY, '2025-01-01', GETDATE()); -- Difference in days
SELECT DATENAME(MONTH, GETDATE()); -- Returns the current month name
SELECT DATEPART(YEAR, GETDATE()); -- Returns the current year
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss');
