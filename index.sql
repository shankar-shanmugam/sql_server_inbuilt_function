SELECT TOP (1000) [ID]
      ,[Name]
      ,[Department]
      ,[Salary]
  FROM [DemoDB].[dbo].[Employees]

  --------------Index basics---------------
  create clustered index ix_Employees_ID   ----------Non cluster type 
  on Employees(ID ASC)

	execute sp_helpindex Employees  -- to view the cluster in the table

  drop index Employees.ix_Employees_ID


  create nonclustered index ix_employee_salary
  on Employees(Salary desc)