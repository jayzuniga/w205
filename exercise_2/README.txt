Please follow the steps to run the app for this exercise.

Assumptions
1. You have access to root.
2. Postgres and Storm are all properly setup

Directions

1. Copy Files and Directories

The configuration I used during my run assumed all the files were under the directory ./exercise_2, however you can use any top directory (will use $EX_TOP_DIR to refer to this directory).

Also assume that storm template files have been copied to $EX_TOP_DIR/extweetwordcount. I used "streamparse quickstart extweetwordcount" for that.

Please copy the files to the following destinations:

$EX2_TOP_DIR/extweetwordcount/src/spouts/tweets.py
$EX2_TOP_DIR/extweetwordcount/src/bolts/parse.py
$EX2_TOP_DIR/extweetwordcount/src/bolts/wordcount.py
$EX2_TOP_DIR/extweetwordcount/topologies/tweetwordcount.clj
$EX2_TOP_DIR/postgres/create_database.sql
$EX2_TOP_DIR/postgres/create_tweetwordcount_table.sql
$EX2_TOP_DIR/postgres/run_postgres_setup.sh
$EX2_TOP_DIR/finalresults.py
$EX2_TOP_DIR/histogram.py

You may need to make run_postgres_setup.sh executable.

chmod 755 $EX2_TOP_DIR/postgres/run_postgres_setup.sh

2. Set up Database

To set up the database, log in as root (to allow changing to postgres, w205 user) and run the “run_postgres_setup.sh” file passing in the full path to the postgres directory.

	# cd $EX2_TOP_DIR/postgres
  # ./run_postgres_setup.sh $EX2_TOP_DIR

	This step assumes postgres is up.

3. Run Storm

Before running storm, please enter the twitter credentials in $EX2_TOP_DIR/extweetwordcount/src/spouts/tweets.py.

	$ cd $EX_TOP_DIR/extweetwordcount/
	$ streamparse run -t 60 

4. Run scripts

	After Storm has populated the tweetwordcount table, the data can now be used.

	$ cd $EX2_TOP_DIR

	To get number of times a word appears:

	$ python finalresults.py <word>

	To get all the words and their counts:

	$ python finalresults.py

	To get all words within a count range:

	$ python histogram.py <low_value> <high_value>
