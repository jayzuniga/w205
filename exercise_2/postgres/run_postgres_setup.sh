# Run file as root
# Usage:
#   ./run_postgres_setup.sh <postgres_directory>

# Set up postgres directory variable
export POSTGRES_DIR="$1"

# Run create database script as postgres superuser
sudo su - postgres
psql -f $POSTGRES_DIR/create_database.sql
exit

# Run create table script as w205 user
sudo su - w205
psql -f $POSTGRES_DIR/create_tweetwordcount_table.sql
