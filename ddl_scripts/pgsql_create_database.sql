--
-- Database and user creation script for PostgreSQL
--
create user weblog_demo password '123456';
create database weblog_demo encoding 'utf8' owner weblog_demo;
-- create database weblog_demo encoding ='utf8' LC_CTYPE = 'en_US.utf8' LC_COLLATE = 'en_US.utf8' owner = weblog_demo template = template0;
