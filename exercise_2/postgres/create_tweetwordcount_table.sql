-- if table already exists, drop to make sure we can refresh it
drop table tweetwordcount;

-- create the table required for the exercise
create table tweetwordcount (
  word         varchar(200),
  count        bigint);
