select dep, num
from dept_summary
where total_s > 100000;

-- IS allowed--
-- Showing rows 0 - 0 (1 total, Query took 0.0007 sec)--

-- the corresponding query on the base table would look like--

select dno, num
from 
   (select dno, count(*) as num, sum(salary) as total_s, avg(salary) 
   from employee 
   group by dno) dept
where total_s > 100000

-- Showing rows 0 - 0 (1 total, Query took 0.0002 sec) --
