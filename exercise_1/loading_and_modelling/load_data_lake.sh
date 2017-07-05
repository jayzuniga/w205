#!/bin/bash
# This script loads hospital data into hdfs so they can be processed
# by the hive_base_ddl.sql script.
# Usage: sh load_data_lake.sh
#        after setting HOSP_DATA_DIR to location of data files

# Changes to data user
sudo su - w205

# Sets directory for location of data files
HOSP_DATA_DIR=/user/w205/hospital_compare

# Creates HDFS directories, one directory is created for each data file type
# because the external table loads all files in a directory
hdfs dfs -mkdir /user/w205/hospital_compare/measures/
hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses/
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals/
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care/
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions/

# Uploads data files to HDFS, with each file having its specific directory
hdfs dfs -put $HOSP_DATA_DIR/Measures.csv /user/w205/hospital_compare/measures/
hdfs dfs -put $HOSP_DATA_DIR/effective_care.csv /user/w205/hospital_compare/effective_care/
hdfs dfs -put $HOSP_DATA_DIR/hospitals.csv /user/w205/hospital_compare/hospitals/
hdfs dfs -put $HOSP_DATA_DIR/readmissions.csv /user/w205/hospital_compare/readmissions/
hdfs dfs -put $HOSP_DATA_DIR/survey_responses.csv /user/w205/hospital_compare/survey_responses/

# End script
