delete from dept_summary
where num > 4;

-- IS not allowed --
-- #1288 - The target table dept_summary of the DELETE is not updatable --

-- Grunden til at den ikke virker er pga at view'et bruger groupe by og derrived columns (udregnede / begegnede kolonner) --
