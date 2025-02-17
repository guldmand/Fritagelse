select *
from dept_summary;

-- YES, IT IS ALLOWED --
-- Showing rows 0 - ... 1 (Query took 0.0006 sec)--
-- the corresponding query on the base table would look like --

SELECT dno AS dep,
		 count(*) AS num,
			 sum(salary) AS total_s,
				 avg(salary) AS average_s
		From employee
		group by dno

