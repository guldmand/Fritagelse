select dep, average_s
from dept_summary
where num > (select num 
             from dept_summary
				 where dep=4);

-- It is allowed --
-- Showing rows 0 - 0 (1 total, Query took 0.0002 sec) --

-- the corresponding query on the base table would look like: --

select dno, average_s
from 
   (select dno, count(*) as num, avg(salary) as average_s
   from employee 
   group by dno) dept
where num > 
   (select num 
   from (select dno, count(*) as num, avg(salary) as average_s
   from employee 
   group by dno) dept
   where dno = 4)

-- Showing rows 0 - 0 (1 total, Query took 0.0002 sec)--
