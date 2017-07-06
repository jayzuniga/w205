-- This script returns the top 20 hospital procedures with
-- highest variability

SELECT procedure_name, 
       procedure_id, 
       var_score
FROM Procedures
ORDER BY var_score DESC 
LIMIT 20;
