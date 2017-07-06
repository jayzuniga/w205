-- This script creates the procedures table

-- Drops previous instance of the table if it exists so that it
-- can be refreshed with most current data
DROP TABLE Procedures;

-- Create Procedures table using effective_care_raw
CREATE TABLE Procedures
AS
SELECT
  measure_name                   AS procedure_name,
  measure_id                     AS procedure_id,
  min(cast(score as float))      AS min_score,
  max(cast(score as float))      AS max_score,
  avg(cast(score as float))      AS avg_score,
  variance(cast(score as float)) AS var_score
FROM effective_care_raw
WHERE score not IN ("Not Available",
                    "Low (0 - 19,999 patients annually)",
                    "Medium (20,000 - 39,999 patients annually)",
                    "High (40,000 - 59,999 patients annually)",
                    "Very High (60,000+ patients annually)")
GROUP BY measure_name,
         measure_id
;
