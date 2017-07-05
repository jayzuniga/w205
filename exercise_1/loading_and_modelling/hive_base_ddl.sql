-- This script loads the hospital data files into hive as external tables
-- allowing SQL to be run against them. The following tables will be created:
-- effective_care_raw  : from effective_care.csv
-- survey_responses_raw: from survey_responses.csv
-- readmissions_raw    : from readmissions.csv
-- hospitals_raw       : from hospitals.csv
-- measures_raw        : from Measures.csv

-- If tables already exist, drop them so they can be refreshed with the most
-- recent data
DROP TABLE measures_raw;
DROP TABLE hospitals_raw;
DROP TABLE readmissions_raw;
DROP TABLE survey_responses_raw;
DROP TABLE effective_care_raw;

-- create the effective_care_raw table
CREATE EXTERNAL TABLE effective_care_raw
(provider_id            string,
 hospital_name          string,
 address                string,
 city                   string,
 state                  string,
 zip_code               string,
 county_name            string,
 phone_number           string,
 condition              string,
 measure_id             string,
 measure_name           string,
 score                  string,
 sample                 string,
 footnote               string,
 measure_start_date     timestamp,
 measure_end_date       timestamp)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

-- create the survey_responses_raw table
CREATE EXTERNAL TABLE survey_responses_raw
(provider_number                                string,
 hospital_name                                  string,
 address                                        string,
 city                                           string,
 State                                          string,
 zip_code                                       string,
 county_name                                    string,
 comm_nurses_achievement_points                 string,
 comm_nurses_improvement_points                 string,
 comm_nurses_dimension_score                    string,
 comm_doctors_achievement_points                string,
 comm_doctors_improvement_points                string,
 comm_doctors_dimension_score                   string,
 respons_hospital_staff_achievement_points      string,
 respons_hospital_staff_improvement_points      string,
 respons_hospital_staff_dimension_score         string,
 pain_mgmt_achievement_points                   string,
 pain_mgmt_improvement_points                   string,
 pain_mgmt_dimension_score                      string,
 comm_medicine_achievement_points               string,
 comm_medicine_improvement_points               string,
 comm_medicine_dimension_score                  string,
 clean_quiet_hosp_environ_achievement_points    string,
 clean_quiet_hosp_environ_improvement_points    string,
 clean_quiet_hosp_environ_dimension_score       string,
 discharge_info_achievment_points               string,
 discharge_info_improvement_points              string,
 discharge_info_dimension_score                 string,
 overall_rating_hospital_achievement_points     string,
 overall_rating_hospital_improvement_points     string,
 overall_rating_hospital_dimension_score        string,
 hcahps_base_score                              string,
 hcahps_consistency_score                       string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';

-- create the readmissions_raw table
CREATE EXTERNAL TABLE readmissions_raw
(provider_id              string,
 hospital_name            string,
 address                  string,
 city                     string,
 state                    string,
 zip_code                 string,
 county_name              string,
 phone_number             string,
 measure_name             string,
 measure_id               string,
 compared_to_national     string,
 denominator              string,
 score                    int,
 lower_estimate           float,
 higher_estimate          float,
 footnote                 string,
 measure_start_date       date,
 measure_end_date         date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

-- create the hospitals_raw table
CREATE EXTERNAL TABLE hospitals_raw
(provider_id        string,
 hospital_name      string,
 address            string,
 city               string,
 state              string,
 zip_code           string,
 county_name        string,
 phone_number       string,
 hospital_type      string,
 hospital_ownership string,
 emergency_services string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

-- create the measures_raw table
CREATE EXTERNAL TABLE measures_raw 
  (measure_name STRING, 
   measure_id STRING, 
   measure_start_quarter STRING, 
   measure_start_date TIMESTAMP, 
   measure_end_quarter STRING, 
   measure_end_date TIMESTAMP)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';
