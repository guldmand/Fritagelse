CREATE VIEW v1300
AS SELECT project.pname, 
		department.dname, 
		(SELECT 
		COUNT(employee.ssn) 
		FROM employee
			JOIN works_on
				ON works_on.essn = employee.ssn
					WHERE works_on.pno = project.pnumber) AS empnum,
				(SELECT 
					SUM(works_on.hours)
					FROM works_on
						WHERE works_on.pno = project.pnumber) as htotal
					FROM project
					JOIN department
						ON dnum = dnumber


