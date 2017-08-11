from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt


# ---------------------------------------
# Additional code to create connection with local postgres database
# This assumes the database tcount, the table tweetwordcount and the 
# user/role w205 have been set up in accordance with the readme.txt.
import psycopg2
conn = psycopg2.connect(database="tcount", user="w205", password="finishex2", host="localhost", port="5432")
# End set up connection
# ---------------------------------------

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]


        # ---------------------------------------
        # Additional code that adds the word that was just found into the tweetwordcount table. This creates
        # a new entry if word is new and increments existing entry if word already exists in table
        tweetdb = conn.cursor()
        if self.counts[word] == 0:
          tweetdb.execute("insert into tweetwordcount (word, count) values (%s, %s)", (word, self.counts[word]+1));
        else:
          tweetdb.execute("update tweetwordcount set count=%s where word=%s", (self.counts[word],word));
        conn.commit()
        # End code to update tweetwordcount table
        # ---------------------------------------

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
