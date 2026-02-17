create database movies_netflix_db;
-- drop table movies;
create table movies (
    movieID varchar(8) primary key,
    title varchar(100) not null,
    releaseDate date not null,
    originalLanguage varchar(100) NOT NULL,
    link varchar(50) default null
);
insert into movies(movieID, title, releaseDate, originalLanguage, link) values 
('80192187','Triple Frontier','2019-04-12','English','https://www.netflix.com/pe-en/title/80192187'),
('81157374','Run','2021-05-21','English','https://www.netflix.com/pe-en/title/81157374'),
('80210920','The Mother','2023-01-05','English','https://www.netflix.com/pe-en/title/80210920');
-- select * from movies;
create table person(
    personID varchar(8) primary key not null,
    name varchar(100) not null,
    birthday date not null
)
--drop table person;
insert into person(personID, name, birthday) values
('72129839','Joseph Chavez Pineda','1997-04-12'),
('73235434','Maria Lopez Gutierrez','1987-05-21'),
('20432364','Maria Alejandra Navarro','1967-01-05');
--select * from person;
create table participant(
    movieID varchar(8) not null,
    personID varchar(8) not null,
    participantRole varchar(30),
    constraint fk_movie_participant foreign key(movieID) references movies(movieID),
    constraint fk_movie_person foreign key(personID) references person(personID)
);
-- drop table participant;
insert into participant(movieID, personID, participantRole) values
('80192187','72129839','Actor'),
('81157374','73235434','Director'),
('80210920','20432364','Actor');

-- select * from participant;
create table gender(
    genderID integer primary key not null,
    name varchar(100) not null
);
insert into gender (genderID, name) values
(1,'Action'),
(2,'Adventure'),
(3,'Drama');
-- select * from gender;
create table movieGender(
    movieID varchar(8) not null,
    genderID integer not null,
    constraint fk_movieGender_movie foreign key(movieID) references movies(movieID),
    constraint fk_movieGender_gender foreign key(genderID) references gender(genderID)
);
insert into movieGender(movieID, genderID) values
('80192187',1),
('81157374',2),
('80210920',3);
-- select * from movieGender;