-- This script creates the procedures table

-- Drops previous instance of the table if it exists so that it
-- can be refreshed with most current data
DROP TABLE Procedures;

-- Create Procedures table using effective_care_raw
CREATE TABLE Procedures
AS
SELECT
  measure_name   AS procedure_name,
  measure_id     AS procedure_id,
  min(score)     AS min_score,
  max(score)     AS max_score,
  avg(score)     AS avg_score,
  var(score)     AS var_score
FROM effective_care_raw
GROUP BY measure_name,
         measure_id
;
