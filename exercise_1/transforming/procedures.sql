
-- Create Procedures table
DROP TABLE Procedures;

CREATE TABLE Procedures
AS
SELECT
  measure_name   AS procedure_name,
  measure_id     AS procedure_id,
  min(score)     AS min_score,
  max(score)     AS max_score,
  avg(score)     AS avg_score,
  var(score)     AS var_score
FROM effective_car_raw
GROUP BY measure_name,
         measure_id
;
