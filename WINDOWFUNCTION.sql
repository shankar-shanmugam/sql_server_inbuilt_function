------------------------OVER AND PARTITION BY IN BUILT windows FUNCTIONS-----------------
CREATE TABLE Employees
(
     ID INT,
     Name VARCHAR(50),
     Department VARCHAR(50),
     Salary int
)
Go

INSERT INTO Employees Values (1, 'James', 'IT', 15000)
INSERT INTO Employees Values (2, 'Smith', 'IT', 35000)
INSERT INTO Employees Values (3, 'Rasol', 'HR', 15000)
INSERT INTO Employees Values (4, 'Rakesh', 'Payroll', 35000)
INSERT INTO Employees Values (5, 'Pam', 'IT', 42000)
INSERT INTO Employees Values (6, 'Stokes', 'HR', 15000)
INSERT INTO Employees Values (7, 'Taylor', 'HR', 67000)
INSERT INTO Employees Values (8, 'Preety', 'Payroll', 67000)
INSERT INTO Employees Values (9, 'Priyanka', 'Payroll', 55000)
INSERT INTO Employees Values (10, 'Anurag', 'Payroll', 15000)
INSERT INTO Employees Values (11, 'Marshal', 'HR', 55000)
INSERT INTO Employees Values (12, 'David', 'IT', 96000)

--- THE BELOW CODE WILL GIVE YOU ERROR BECAUSE WE HAVEN'T GROUPED NAME,SALRY INTO GROUP BY FUNCTION AND ALSO NOT APPLIED ANY AGGREGATE FUNCTION AS WELL

--SELECT  Name, Salary, Department, 
-- COUNT(*) AS NoOfEmployees, 
-- SUM(Salary) AS TotalSalary,
-- AVG(Salary) AS AvgSalary,
-- MIN(Salary) AS MinSalary, 
-- MAX(Salary) AS MaxSalary
--FROM Employees
--GROUP BY Department



--1) METHOD AS IT SEEMS COMPLEX

SELECT Name, Salary, Employees.Department, 
  Departments.DepartmentTotals,
  Departments.TotalSalary, 
  Departments.AvgSalary, 
  Departments.MinSalary, 
  Departments.MaxSalary   
FROM  Employees
INNER JOIN
( SELECT Department, COUNT(*) AS DepartmentTotals,
  SUM(Salary) AS TotalSalary,
  AVG(Salary) AS AvgSalary,
  MIN(Salary) AS MinSalary, 
  MAX(Salary) AS MaxSalary
 FROM Employees
 GROUP BY Department) AS Departments
ON Departments.Department = Employees.Department

---2)EASY METHOD USING 
------------------SYNTAX-----------------

--<FUNCTION> OVER (
--				PARTITION BY ()
--				ORDER BY ()
--				RANGE ()
--				)

SELECT  Name, 
 Salary, 
 Department,
 COUNT(Department) OVER(PARTITION BY Department) AS DepartmentTotals,
 SUM(Salary) OVER(PARTITION BY Department) AS TotalSalary,
 AVG(Salary) OVER(PARTITION BY Department) AS AvgSalary,
 MIN(Salary) OVER(PARTITION BY Department) AS MinSalary,
 MAX(Salary) OVER(PARTITION BY Department) AS MaxSalary
FROM Employees








