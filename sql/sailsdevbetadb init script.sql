-- sails dev beta db initialization script

-- create the sailsdevbeta database and switch to sailsdevbeta
create database if not exists sailsdevbetadb;
use sailsdevbetadb;

-- start creating our tables

-- entry table 
create table if not exists entry 
(
	id int primary key,
    name nvarchar(255),
    entryCompetition int,	
    createdAt datetime,
    updatedAt datetime
);

-- item table 
create table if not exists item
(
	id int primary key,
    name nvarchar(255),
    itemEntry int,
    createdAt datetime,
    updatedAt datetime
);

-- piece table 
create table if not exists piece
(
	id int primary key,
    name nvarchar(255),
    attachment nvarchar(255),
    pieceItem int,
    createdAt datetime,
    updatedAt datetime
);

-- contact table 
create table if not exists contact
(
	id int primary key,
    firstName nvarchar(255),
    lastName nvarchar(255),
    email nvarchar(255),
    password nvarchar(255),
    groupid int,
    createdAt datetime,
    updatedAt datetime
);

-- contact role xref 
create table if not exists contactrolexref
(
	id int primary key,
    contactid int,
    roleid int,
    roleTitle nvarchar(255),
    startDate datetime,
    endDate datetime,
    status nvarchar(255),
    createdAt datetime,
    updatedAt datetime
);

-- contact role 
create table if not exists contactrole
(
	id int primary key,
    name nvarchar(255),
	createdAt datetime,
    updatedAt datetime
);

-- contact address xref 
create table if not exists contactaddrxref
(
	id int primary key,
    contactid int,
    contactAddrid int,
    startDate datetime,
    endDate datetime,
    status nvarchar(255),
    createdAt datetime,
    updatedAt datetime
);

-- contact address 
create table if not exists contactaddr
(
	id int primary key,
    addrtype  nvarchar(255),
    addr1 nvarchar(255),
    addr2 nvarchar(255),
    addr3 nvarchar(255),
    addr4 nvarchar(255),
    city nvarchar(255),
    state nvarchar(255),
    zip nvarchar(255),
    country nvarchar(255),
    email nvarchar(255),
    phoneCountryCode int,
    phoneAreaCode int,
    phoneNumber int,
    createdAt datetime,
    updatedAt datetime
);

-- contact/contact group xref table
create table if not exists contactgroupxref
(
	id int primary key,
    contactid int,
    groupid int,
    startDate datetime,
    endDate datetime,
    status nvarchar(255),
    createdAt datetime,
    updatedAt datetime
);

-- contact group table 
create table if not exists contactgroup
(
	id int primary key,
    name nvarchar(255),
    groupType nvarchar(255),
    createdAt datetime,
    updatedAt datetime
);

-- contact group hierarchy table
create table if not exists groupxref
(
	id int primary key,
    parentid int,
    childid int,
    createdAt datetime,
    updatedAt datetime
);

-- session table
create table if not exists session
(
	id int primary key,
    sessionCompetition int,
    sessionType int,
    sessionIsLive int,
    createdAt datetime,
    updatedAt datetime
);

-- session rounds table
create table if not exists sessionround
(
	id int primary key,
    sessionid int,
    roundid int,
    createdAt datetime,
    updatedAt datetime
);

-- session items table
create table if not exists sessionitemxref
(
	id int primary key,
    sessionid int,
    itemid int,
    createdAt datetime,
    updatedAt datetime
);

-- session scores table
create table if not exists sessionitemscore
(
	id int primary key,
    sessionid int,
    itemid int,
    roundid int,
    score nvarchar(255),
    scoretype nvarchar(255),
    createdAt datetime,
    updatedAt datetime
);


-- create database user
create user if not exists 'dev1'@'localhost' identified by 'dev1localhost';
grant select on sailsdevbetadb.* to 'dev1'@'localhost';