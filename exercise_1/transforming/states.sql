-- This script creates the States table

-- Drop previous instance of the States table if it exists, so that it can
-- be refreshed with most recent data
DROP TABLE States;

-- Create States table using effective_care_raw table
CREATE TABLE States
AS
SELECT
  e.state                      AS state,
  avg(cast(e.score as float))  AS effective_care_avg_score,
  avg(cast(rd.score as float)) AS readmission_death_avg_score
FROM effective_care_raw    AS e
LEFT JOIN readmissions_raw AS rd
  ON (e.state = rd.state)
WHERE e.score <> "Not Available"
AND e.score <> "Emergency department volume"
AND cast(e.score AS int) > 0
GROUP BY e.state
;
