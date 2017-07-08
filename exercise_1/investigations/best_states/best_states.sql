-- This script gets the top 20 states based on their hospital
-- averages

SELECT *
FROM States
WHERE effective_care_avg_score IS NOT NULL 
AND readmission_death_avg_score IS NOT NULL
ORDER BY effective_care_avg_score DESC,
         readmission_death_avg_score ASC
LIMIT 10         
;
