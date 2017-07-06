-- This script creates the SurveyResponses table

-- Drops the previous instance of the SurveyResponses table if it exists
-- so that it can be refreshed with most recent data
Drop TABLE SurveyResponses;

-- Create SurveyResponses table using survey_responses_raw
CREATE TABLE SurveyResponses
AS
SELECT
  provider_number,
  hospital_name,
  avg(cast(regexp_replace(overall_rating_hospital_achievement_points, '^(.*) out of', '$1') as float))
                                      AS achievement_rating,
  avg(cast(regexp_replace(overall_rating_hospital_improvement_points, '^(.*) out of', '$1') as float))
                                      AS improvement_rating,
  avg(cast(regexp_replace(overall_rating_hospital_dimension_score, '^(.*) out of', '$1') as float))
                                      AS dimension_rating,
  avg(hcahps_base_score)              AS base_score,
  avg(hcahps_consistency_score)       AS consistency_score
FROM survey_responses_raw
GROUP BY provider_number,
         hospital_name
;
