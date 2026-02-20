-- Active: 1771307265500@@127.0.0.1@5432@netflix_db
create database netflix_db;
--tabla de peliculas
drop table users;
create table movies (
    "movieID" varchar(8) primary key,
    "title" varchar(100) not null,
    "releaseDate" date not null,
    "gender" varchar(100) not null,
    "participantName" varchar(100) not null,
    "roleParticipant" varchar(100) not null,
    "awardMovie" varchar(50) not null 
);
--tabla de usuarios
create table users(
    "userID" int primary key,
    "userName" varchar(100) not null,
    "country" varchar(100) not null,
    "subscription" varchar(100) not null
);
--tabla de observaciones
create table observations(
    
    "userID" int not null,
    "movieID" varchar(8) not null,
    "rating" decimal(3,1),
    "timestamp" timestamp,
    constraint fk_observations_movie foreign key ("movieID") references movies("movieID"),
    constraint fk_observations_user foreign key ("userID") references users("userID")
);
SELECT * from users;
