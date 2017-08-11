# Run file as root
sudo su - postgres
psql -f create_database.sql

sudo su - w205
psql -f create_tweetwordcount_table.sql
