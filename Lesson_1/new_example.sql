drop database IF EXISTS example;
CREATE database example;

use example;

drop table if exists users;
create table users (
id serial primary key,
name varchar(50)
);