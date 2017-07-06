#!/bin/bash
#
# This file uploads the files to AWS server

# Check and set these variables first
KEY_DIR=$HOME/Documents/Keys
HOSP_DATA_DIR=$HOME/Documents/MIDS/w205
AWS_DATA_DIR=/home/w205
EC2_IP=ec2-54-87-217-215

# Remove header record from data files and then rename to more friendly file names
tail -n +2 $HOSP_DATA_DIR/Hospital\ General\ Information.csv > $HOSP_DATA_DIR/hospitals.csv
tail -n +2 $HOSP_DATA_DIR/Timely\ and\ Effective\ Care\ -\ Hospital.csv > $HOSP_DATA_DIR/effective_care.csv
tail -n +2 $HOSP_DATA_DIR/Readmissions\ and\ Deaths\ -\ Hospital.csv > $HOSP_DATA_DIR/readmissions.csv
tail -n +2 $HOSP_DATA_DIR/hvbp_hcahps_05_28_2015.csv > $HOSP_DATA_DIR/survey_responses.csv
tail -n +2 $HOSP_DATA_DIR/Measure\ Dates.csv > $HOSP_DATA_DIR/Measures.csv
tail -n +2 $HOSP_DATA_DIR > $HOSP_DATA_DIR/

# Upload files to AWS
scp -i $KEY_DIR/UCB1.pem $HOSP_DATA_DIR/hospitals.csv root@${EC2_IP}.amazonaws.com:${AWS_DATA_DIR}
scp -i $KEY_DIR/UCB1.pem $HOSP_DATA_DIR/readmissions.csv root@${EC2_IP}.amazonaws.com:${AWS_DATA_DIR}
scp -i $KEY_DIR/UCB1.pem $HOSP_DATA_DIR/Measures.csv root@${EC2_IP}.amazonaws.com:${AWS_DATA_DIR}
scp -i $KEY_DIR/UCB1.pem $HOSP_DATA_DIR/survey_responses.csv root@${EC2_IP}.amazonaws.com:${AWS_DATA_DIR}
scp -i $KEY_DIR/UCB1.pem $HOSP_DATA_DIR/effective_care.csv root@${EC2_IP}.amazonaws.com:${AWS_DATA_DIR}
