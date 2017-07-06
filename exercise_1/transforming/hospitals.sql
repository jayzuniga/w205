-- This script creates the hospitals table

-- Drop previous instance of the table if it is exists so it can be refreshed
-- with current data
DROP TABLE Hospitals;


-- Create Hospitals table using hospitals_raw, effective_care_raw and
-- readmissions_raw
CREATE TABLE Hospitals
AS
SELECT
  h.provider_id                                 AS provider_id,
  h.hospital_name                               AS hospital_name,
  h.address                                     AS address,
  h.city                                        AS city,
  h.state                                       AS state_name,
  h.zip_code                                    AS zip_code,
  h.county_name                                 AS county_name,
  h.phone_number                                AS phone_number,
  h.hospital_type                               AS type,
  h.hospital_ownership                          AS ownership,
  if(h.emergency_services = "Yes", True, False) AS has_emergency_services,
  avg(cast(e.score as int))                     AS effective_care_avg_score,
  avg(cast(rd.score as float))                  AS readmissions_death_avg_score
FROM hospitals_raw           AS h
LEFT JOIN effective_care_raw AS e
  ON (e.provider_id = h.provider_id)
LEFT JOIN readmissions_raw   AS rd
  ON (rd.provider_id = h.provider_id)
WHERE e.score <> "Not Available"
AND e.measure_name <> "Emergency department volume"
AND cast(e.score as int) > 0
GROUP BY h.provider_id,
         h.hospital_name,
         h.address,
         h.city,
         h.state,
         h.zip_code,
         h.county_name,
         h.phone_number,
         h.hospital_type,
         h.hospital_ownership,
         if(h.emergency_services = "Yes", True, False);
