-- This script joins hospitals and survey scores in order to compare if there is any
-- correlation between a hospitals survey scores and its average effective care rating.
-- In order to make this easier to compare, we've also ranked them in terms of those 
-- two metrics.

SELECT h.provider_id                    AS provider_id, 
       h.hospital_name                  AS hospital_name, 
       h.effective_care_avg_score       AS effective_care_avg_score, 
       h.readmissions_death_avg_score   AS readmissions_death_avg_score, 
       s.achievement_rating             AS achievement_avg_rating, 
       s.improvement_rating             AS improvement_avg_rating, 
       s.base_score                     AS base_score, 
       s.consistency_score              AS consistency_score,
       rank() over (ORDER BY h.effective_care_avg_score DESC)
                                        AS effective_care_rank,
       rank() over (ORDER BY s.base_score DESC)
                                        AS survey_base_score_rank
FROM Hospitals AS h
JOIN SurveyResponses AS s
  ON (h.provider_id = s.provider_number)
ORDER BY effective_care_avg_score DESC
LIMIT 10;

-- This statement takes the avg and the variance of the difference between the
-- ranks based on effective care avg and base score average.

SELECT avg(abs(t.effective_care_rank-survey_base_score_rank))      AS avg_rank_difference,
       variance(abs(t.effective_care_rank-survey_base_score_rank)) AS var_rank_diffence
FROM
(
   SELECT h.provider_id                    AS provider_id, 
          h.effective_care_avg_score       AS effective_care_avg_score, 
          s.base_score                     AS base_score, 
          s.consistency_score              AS consistency_score,
          rank() over (ORDER BY h.effective_care_avg_score DESC)
                                           AS effective_care_rank,
          rank() over (ORDER BY s.base_score DESC)
                                           AS survey_base_score_rank
FROM Hospitals AS h
JOIN SurveyResponses AS s
  ON (h.provider_id = s.provider_number)
ORDER BY effective_care_avg_score DESC
)   AS t    
;
