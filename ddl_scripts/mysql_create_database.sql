--
-- Database and user creation script for MySQL
--
create database weblog_demo character set 'utf8' collate 'utf8_general_ci';
grant select, insert, update, delete, create, drop, alter, index on weblog_demo.* to weblog_demo@localhost identified by '123456';
flush privileges;
