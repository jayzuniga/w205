-- Create Survey table

Drop TABLE Survey;

CREATE TABLE Survey
AS
SELECT
  provider_id,
  hospital_name,
  avg(regexp_replace(overall_rating_achievement_pts, '^(.*) out of', '$1') AS achievement_rating,
  avg(overall_rating_improvement_pts) AS improvement_rating,
  avg(overall_rating_dimension_score) AS dimension_rating,
  avg(hcahps_base_score)              AS base_score,
  avg(hcahps_consistency_score)       AS consistency_score
FROM survey_responses_raw
GROUP BY provider_id,
         hospital_name
;
