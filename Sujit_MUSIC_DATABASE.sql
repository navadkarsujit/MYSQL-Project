create database music;
use music;
create table artists(
artist_id int auto_increment Primary Key,
artist_name varchar(100) NOT NULL,
genres varchar(100),
country varchar(100)
);
create table albums(
album_id int auto_increment Primary Key,
album_name varchar(100), 
release_date datetime default current_timestamp,
artist_id int,
Foreign Key (artist_id) References artists(artist_id) ON DELETE CASCADE
);
create table songs (
song_id int auto_increment Primary Key,
song_name varchar(100),
duration int CHECK(duration<= 900),
album_id int,
Foreign Key (album_id) References albums(album_id) ON DELETE CASCADE 
);
create table users (
user_id int auto_increment Primary Key,
username varchar(100),
email varchar(100) unique not null,
password varchar(100) not null
);
create table playlists (
playlist_id int auto_increment Primary key,
playlist_name varchar(100),
user_id int,
Foreign Key (user_id) References users(user_id) ON DELETE CASCADE
);
create table playlist_songs (
id int auto_increment Primary key,
playlist_id int,
song_id int,
Foreign Key (playlist_id) References playlists(playlist_id) on DELETE CASCADE,  
Foreign Key (song_id) References songs(song_id) ON DELETE CASCADE
);
show tables;
desc artists;
desc albums;
desc songs;
desc users;
desc playlists;
desc playlist_songs;

INSERT INTO artists (artist_name, genres, country) VALUES
('Raftaar', 'Hip-Hop', 'India'),
('Divine', 'Hip-Hop', 'India'),
('Talha Yunus', 'Hip-Hop', 'Pakistan'),
('Talha Anjum', 'Hip-Hop', 'Pakistan'),
('Faris Shafi', 'Hip-Hop', 'Pakistan'),
('A. R. Rahman', 'Film Music', 'India'),
('Atif Aslam', 'Pop', 'Pakistan'),
('Kishore Kumar', 'Playback Singing', 'India'),
('Lata Mangeshkar', 'Playback Singing', 'India'),
('Eminem', 'Rap', 'United States'),
('Ed Sheeran', 'Pop', 'United Kingdom');

insert into albums (album_name, release_date,artist_id) values 
('HARD DRIVE','2023-02-15','1'),
('Punya Paap','2020-12-03','2'),
('Two Tone','2023-01-28','3'),
('Open Letter','2023-04-05','4'),
('Introduction','2020-03-22','5'),
('Ajnabee','1974-09-01','8'),
('Pehli Dafa','2017-09-15','7'),
('Eminem Show','2022-02-18','10'),
('Divide','2017-02-18','11');

Insert INTO songs (song_name, duration, album_id) values
("Raashah",210,1),
("f16",220,1),
("36",240,1),
("Satya",183,2),
("Punya Paap",181,2),
("Rider",183,2),
("Punya Paap",181,2);
Insert INTO songs (song_name, duration, album_id) values
("Two Tone",240,3),
("False Prophets",260,4),
("Secrets",279,4),
("Melancholy",106,4),
("Flex",220,4);
Insert INTO songs (song_name, duration, album_id) values
("Introduction",260,5),
("Dafa",181,6);
Insert INTO songs (song_name, duration, album_id) values
("Pehli Dafa",181,7),
("Business",250,8);
Insert INTO songs (song_name, duration, album_id) values
("Without me",290,8),
("White America",324,8);
Insert INTO songs (song_name, duration, album_id) values
("Perfect",200,9),
("Shape of you",189,9);

INSERT INTO users (username, email, password) VALUES
('Sujit123', 'sujitt@gmail.com', 'Sujit@125'),
('Amit123', 'amit@gmail.com', 'Amit@12345'),
('Priya456', 'priya@gmail.com', 'Priya@678'),
('Rajesh789', 'rajesh@gmail.com', 'Rajesh@478'),
('Kavita234', 'kavita@gmail.com', 'Kavita@589'),
('Anil', 'anil@gmail.com', 'Anil@123'),
('Rakhi890', 'rakhi@gmail.com', 'Rakhi@7890'),
('Vijay123', 'vijay@gmail.com', 'Vijay@5678'),
('Sunita456', 'sunita@gmail.com', 'Sunita@6789'),
('Rohit', 'rohit@gmail.com', 'Rohit@1245'),
('Meera234', 'meera@gmail.com', 'Meera@670');

insert into playlists (playlist_name,user_id) values
("Sujit-P1",1),
("Amit-P1",2),
("Priya-P1",3),
("Rajesh-P1",4),
("Kavita-P1",5),
("Anil-P1",6),
("Rakhi-P1",7),
("Vijay-P1",8),
("Sunita-P1",9),
("Rohit-P1",10),
("Meera-P1",11),
("Priya-P2",3),
("Sujit-P2",1),
("Amit-P2",2);

# INSERT INTO playlist_songs (playlist_id, song_id) 
# SELECT rand( playlist_id) FROM playlists union SELECT rand(song_id) FROM songs;


insert into playlists_songs (playlist_id,song_id) values
(1, 2);

INSERT INTO playlist_songs (playlist_id, song_id)
SELECT
   #  (SELECT playlist_id FROM playlists ORDER BY RAND() LIMIT 1),
	(1),
    (SELECT song_id FROM songs ORDER BY RAND() LIMIT 1);


#Queries
select distinct album_id from songs;
select * from songs where album_id=1;
select * from songs where duration<200;

#like
select * from artists where country LIKE 'i%';
#And
select * from users where username='sujit123' and email='sujitt@gmail.com';
#in
select * from artists where genres in('Hip-Hop','pop','Rap');
#Between
Select * from songs where duration BETWEEN 100 and 200;
#Or
Select * from songs where duration=240 or duration>300;
#NOt
Select * from artists where Not Genres='Hip-Hop';
#Limit
select * from songs Limit 3,10;
#Order by
Select * from albums order BY release_date; 
Select * from albums order BY release_date desc;
#Renaming Attribute or SQL Aliases
select album_name as Album, release_date as "Date of release" from albums;
#1.Concat
select concat(Username,"    " ,password) as User_Info from users;
#2.Lower
select lower(album_name) from albums;
#3.Upper
select Upper(Artist_name) from Artists;
#4.Replace
select replace(email,'gmail','outlook') from users;
#5.Reverse
select reverse(username) FROM users;
#6.Length
select length(album_name) from albums;
#7.Substring
select substr(album_name,1,3) from albums;
#8.Trim
select trim(username) name from users;
#date
select date_format(release_date,'%b %d %Y %h : %i %p') date from albums;
select year(release_date) year from albums;
select month(release_date) year from albums;
#AVG, count, min, max, sum
select sum(duration) duration from songs;
select min(duration) duration from songs;
select max(duration) duration from songs;
select avg(duration) duration from songs;
select count(song_name) duration from songs;
#Group By
Select country, genres from artists group by country,genres;
select country,count(genres) from artists group by country;
select min(duration),album_id from songs GROUP BY album_id;
#Having
select album_id ,sum(duration) from songs GROUP BY album_id having sum(duration)>300;
select album_id ,count(song_name) from songs GROUP BY album_id having count(Song_name)>2;
# Sub-Queries
# Single row subqueries
#Retrieve the album name for the song with song_id 5
select * from albums where album_id = (select album_id from songs where song_name = '36');
#Find the username of the user who has a playlist named "Sujit-P1"
select username from users where user_id = (select user_id from playlists where playlist_name = 'Sujit-P1');
# Multiple row subqueries
#find all users data who created playlists.
SELECT * FROM users WHERE user_id IN (SELECT user_id FROM playlists);
#find user with more than one playlist
SELECT * FROM users WHERE user_id IN (SELECT user_id FROM playlists GROUP BY user_id HAVING COUNT(*) > 1);
#find album more than one song
select album_name, release_date from albums where album_id in(select album_id from songs group by album_id having COUNT(*) >= 3);
# Multiple column subqueries
select * from songs where(album_id,duration) in(select album_id,max(duration) from songs group by album_id);
select * from playlists where(user_id,playlist_id) in(select user_id ,playlist_id from playlists group by user_id, playlist_id having count(user_id) <2  );
# 11.	DML with subqueries
#insert
insert into songs (song_name,duration,album_id) select 'Vibe hai', 300, album_id from albums where album_name = 'Punya Paap';
# Update
update songs set duration = 200 where album_id in (select album_id from albums where artist_id=7 );
# 12.	Joins 
# INNER JOIN
select s.song_name, ar.artist_name from songs s inner join albums a on s.album_id = a.album_id inner join artists ar on a.artist_id = ar.artist_id;
# LEFT JOIN
select artist_name ,album_name from artists a left join albums s on a.artist_id=s.artist_id;
# RIGHT JOIN
select album_name,artist_name from albums s right join artists a on a.artist_id=s.artist_id;
# FULL JOIN (Using ‘UNION’ in mysql)
select artist_name,album_name from albums s right outer join artists a on a.artist_id=s.artist_id UNION
 select artist_name ,album_name from albums s left outer join artists a on a.artist_id=s.artist_id;
select album_name,song_name from albums s right outer join songs a on a.album_id=s.album_id UNION
 select album_name,song_name from albums s left outer join songs a on a.album_id=s.album_id;
# CROSS JOIN
select username, song_name from users cross join songs;
# SELF JOIN
select a.song_id,a.song_name,b.song_id, b.song_name from songs a join songs b on a.duration = b.duration AND a.song_id < b.song_id;
#view
create view user_info as select email ,password from users;
select * from user_info;
create view song_info as select song_name,Duration,a.album_name from songs s inner join albums a on a.album_id=s.album_id;
select * from song_info;
create view artist_raftaar as select al.album_name, s.song_name, a.artist_name, s.duration from songs s
inner join albums al on s.album_id = al.album_id inner join artists a on al.artist_id = a.artist_id where artist_name='Raftaar';
select * from artist_raftaar;
#update view
update user_info set password='sujit@000' where email='sujitt@gmail.com' ;
#delete from view
delete from user_info where email='meera@gmail.com';
#drop view
drop view user_info;
select * from playlist_songs;
select * from users;
select * from songs;
select * from albums;
select * from artists;
select * from playlists;