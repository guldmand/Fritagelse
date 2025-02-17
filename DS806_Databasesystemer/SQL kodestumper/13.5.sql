update dept_summary
set dep = 3
where dep = 4

-- IS not allowed --
-- #1288 - The target table dept_summary of the UPDATE is not updatable --

-- Grunden til at den ikke virker, er fordi vi har en "group by dno;" i vores dept_summery view --
