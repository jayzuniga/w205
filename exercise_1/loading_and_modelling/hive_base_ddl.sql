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

/user/w205/hospital_compare/Measure
