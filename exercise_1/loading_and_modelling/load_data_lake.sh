# load_data_lake.sh

hdfs dfs -mkdir /user/w205/hospital_compare/measures/
hdfs dfs -put Measures.csv /user/w205/hospital_compare/measures/
