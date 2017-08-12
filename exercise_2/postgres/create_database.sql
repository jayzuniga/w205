-- This file creates the database for the w205 exercise

-- create the w205 user which we will use for the exercise if it
-- doesn't already exist
create user w205 with password 'finishex2';

-- create the database for the tweetwordcount app
create database tcount;

-- give w205 all the privileges it will need
grant all privileges on database tcount to w205;
