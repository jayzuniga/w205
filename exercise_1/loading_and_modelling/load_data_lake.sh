# load_data_lake.sh

sudo su - w205

hdfs dfs -mkdir /user/w205/hospital_compare/measures/
hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses/
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals/
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care/
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions/

cd /user/w205/hospital_compare/

hdfs dfs -put Measures.csv /user/w205/hospital_compare/measures/
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care/
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals/
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions/
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare/survey_responses/
