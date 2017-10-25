export $DROP_DIR = "$1"
export $MIDS_DIR = "$2"


cd $DROP_DIR

mv Hospital\ General\ Information.csv hospitals.csv
mv Timely\ and\ Effective\ Care\ -\ Hospital.csv effective_care.csv
mv Readmissions\ and\ Deaths\ -\ Hospital.csv readmissions.csv
mv hvbp_hcahps_05_28_2015.csv survey_responses.csv
mv Measure\ Dates.csv Measures.csv

tail -n +2 hospitals.csv > $MIDS_DIR/w205/hospitals.csv
tail -n +2 effective_care.csv > $MIDS_DIR/w205/effective_care.csv
tail -n +2 readmissions.csv > $MIDS_DIR/w205/readmissions.csv
tail -n +2 survey_responses.csv > $MIDS_DIR/w205/survey_responses.csv
tail -n +2 Measures.csv > $MIDS_DIR/w205/Measures.csv

scp -i "UCB1.pem" /Users/jayz/Documents/MIDS/w205/* root@ec2-54-84-223-39.compute-1.amazonaws.com:/home/w205/hospital_compare/


