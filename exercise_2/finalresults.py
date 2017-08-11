# This file does two queries on the tweetwordcount table.
#
# To use:
# python finalresults.py <word>
# - returns how many instances of the words were found during run
# python finalresults.py
# - returns all the words and the number of instances during run 
import sys
import psycopg2
conn = psycopg2.connect(database="tcount", user="w205", password="finishex2", host="localhost", port="5432")
tweetdb = conn.cursor()

# Checking if there were any arguments passed during run will determine whether to use
# the first form or not 
if len(sys.argv) > 1:
  # There was a word passed, querying for the instances of that specific word
  tweetdb.execute("select word, count from tweetwordcount where word=%s",  [str(sys.argv[1])] );
  records = tweetdb.fetchall()
  for rec in records:
    print "Total number of occurences of \"%s\": %d" % (rec[0],rec[1])
  conn.commit()
else:
  # There was no word passed, querying for everything
  tweetdb.execute("select word, count from tweetwordcount order by count desc");
  records = tweetdb.fetchall()
  print "Printing all words in word count table!"
  for rec in records:
    print (rec[0],rec[1])
  conn.commit()

conn.close()
