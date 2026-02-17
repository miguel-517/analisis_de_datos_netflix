create database if not exists netflix_db;
--exitencion para uuid
create extension if not exists pgcrypto;
--tabla de peliculas
create table movies (
    movieID varchar(8) primary key,
    title varchar(100) not null,
    releaseDate date not null,
    genre varchar(100) not null,
    participantName varchar(100) not null,
    roleParticipant varchar(100) not null,
    awardMovie varchar(50) not null 
);
--tabla de usuarios
create table users(
    userID uuid primary key default gen_random_uuid(),
    userName varchar(100) not null,
    country varchar(100) not null,
    subscription varchar(100) not null
);
--tabla de observaciones
create table observations(
    
    userID uuid not null,
    movieID varchar(8) not null,
    rating decimal(3,1),
    timestamp timestamp,
    constraint fk_observations_movie foreign key (movieID) references movies(movieID),
    constraint fk_observations_user foreign key (userID) references users(userID)
);
