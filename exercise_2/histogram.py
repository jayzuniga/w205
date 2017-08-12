# This file runs a query on the tweetwordcount table returning all rows between
# low_value and high_value.
#
# To use:
# python histogram.py <low_value> <high_value>

# Imports and connection setup
import sys
import psycopg2
conn = psycopg2.connect(database="tcount", user="w205", password="finishex2", host="localhost", port="5432")
tweetdb = conn.cursor()

# passed user parameters
arg1 = str(sys.argv[1])
arg2 = str(sys.argv[2])

# Check if user passed low_value and high_value 
if len(sys.argv) < 2:
  print "Please enter low_value and high_value"
# Check if user passed higher value first
elif (arg1 > arg2):
  print "Please enter low_value first"
else:
  # Run query
  tweetdb.execute("select word, count from tweetwordcount where count between %s AND %s order by count desc", (arg1, arg2));
  records = tweetdb.fetchall()
  for rec in records:
    print "%s : %s" % (rec[0], rec[1])
  conn.commit()

conn.close()
