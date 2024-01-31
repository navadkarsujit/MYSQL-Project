
# Music Streaming Platform Database System
### Introduction
Our project is a database system for a music streaming platform, allowing artists to share their music with users. Users can explore new music and artists based on their preferences. The database manages data related to artists, albums, songs, users, and playlists on the platform.

### Tables in the Database:
* Artists: Stores data of artists.
* Albums: Stores data of albums released by artists.
* Songs: Stores data of songs from albums.
* Users: Stores data of users.
* Playlists: Stores playlists created by users.
* Playlist_Tracks: Links playlists and songs.
* Tables are related using foreign keys, and cascading deletes 

### Table Relationships:
* One artist can have multiple albums (One to Many).
* One album can have multiple songs (One to Many).
* One user can have multiple playlists (One to Many).
* One playlist can have multiple songs (One to Many).

### ER Diagram
![image](https://github.com/navadkarsujit/MYSQL-Project/assets/144350681/67cf8a64-cd00-4d33-962d-dcb1a6162c6d)

 
### Database Design
####	Database: Music
####	Tables:
* a)	Artists
* b)	Albums
* c)	Songs
* d)	Users
* e)	Playlists
* f)	Playlist_songs
