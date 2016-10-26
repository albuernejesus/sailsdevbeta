-- sails dev beta db initialization script

-- create the sailsdevbeta database and switch to sailsdevbeta
create database if not exists sailsdevbetadb;
use sailsdevbetadb;

-- start creating our tables

-- entry table definition
create table if not exists entry 
(
	id int primary key,
    name nvarchar(100),
    entryCompetition int,
    createdAt datetime,
    updatedAt datetime
);
	
-- piece table definition
create table if not exists item
(
	id int primary key,
    name nvarchar(100),
    attachment nvarchar(150),
    itemEntry int,
    createdAt datetime,
    updatedAt datetime
);
-- contact table definition
create table if not exists contact
(
	id int primary key,
    name nvarchar(100),
    year int,
    createdAt datetime,
    updatedAt datetime
);

-- company table definition
create table if not exists company
(
	id int primary key,
    name nvarchar(100),
    createdAt datetime,
    updatedAt datetime
);

-- create database user
create user if not exists 'dev1'@'localhost' identified by 'dev1localhost';
grant select on sailsdevbetadb.* to 'dev1'@'localhost';