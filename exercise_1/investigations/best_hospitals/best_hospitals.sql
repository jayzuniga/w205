-- GET TOP 30 Hospitals based on effective and readmissions scores
SELECT provider_id, 
       hospital_name, 
       state_name, 
       effective_care_avg_score, 
       readmissions_death_avg_score
FROM Hospitals
WHERE readmissions_death_avg_score is NOT NULL
ORDER BY effective_care_avg_score DESC, 
         readmissions_death_avg_score ASC
LIMIT 30;
