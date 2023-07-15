# Spotify-Library-Database v1.0

## About
This project was based off of [Codecademy's Design Databases With PostgreSQL Skill Path](https://www.codecademy.com/paths/design-databases-with-postgresql/tracks/how-do-i-make-and-populate-my-own-database/modules/designing-a-database-schema-off-platform-project/informationals/off-platform-project-designing-a-database-from-scratch
).

I created a mock database based off of the music-streaming application - Spotify. There are various tables that contain artists, songs, 
albums, playlists, podcasts and users. Some of these tables are interconnected through keys that allow users to develop queries that combine
information accross the database.

## Purpose
The purpose of this project is to highlight my knowledge of developing a simple database using PostgreSQL. Using Postbird as my client, I demonstrated an understanding of:
- Basic SQL query writing
- One-to-one, one-to-many, many-to-many relationships

## Contents
In the main branch, there are 3 different files (2 folders and 1 image)
- **queries to initialize tables**: this folder contains several .sql files that demonstrate how each table was created and how they were populated
- **tables**: contains .csv files that are the tables from the database and their rows (I will explain in-depth about each table below)
- `schema v1.png`: database schema that illustrates the tables, the relationships they have with one another, and their columns. The 
schema was developed using [SqlDBM](https://sqldbm.com).

## Tables
There are a total of 9 tables, with a brief explanation about each of their columns:
### album
This table represents an album on Spotify.
- `id`: unique identifier for every album in the table. This is the *Primary Key* of this table
- `name`: the name of the album
- `genre`: the genre of the album
- `music_label`: the music label which the album was released under
- `release_date`: date the album was released on Spotify (in the format YYYY-MM-DD)
- `artist_id`: *Foreign Key* that references the **artist** table - shows the artist that made the album
### artist
This table reperesents an artist on Spotify.
- `id`: unique identifier for every artist in the table. This is the *Primary Key* of this table
- `name`: the name of the artist
- `monthly_listeners`: how many users are listening to this artist on a monthly basis
- `followers`: how many users follow the artist
- `ranking`: world ranking of artist based off of monthly listeners
- `wiki_page`: a link to the artist's Wikipedia page
### song
This table represents a song on Spotify.
- `id`: unique identifier for every song in the table. This is the *Primary Key* of this table
- `artist_id`: *Foreign Key* that references the **artist** table - shows the artist that made the song
- `album_id`: *Foreign Key* that references the **album** table - shows the album the song is under
- `title`: title of the song
- `runtime`: runtime of the song (in seconds)
- `plays`: the total number of times the song was played
- `release_date`: date the song was released on Spotify (in the format YYYY-MM-DD)
- `is_explicit`: identifies if the song is tagged as "Explicit" on Spotify
### spotify_user
This table represents a user on Spotify.
- `id`: unique identifier for every user in the table. This is the *Primary Key* of this table
- `username`: the user's display name on Spotify
- `followers`: how many followers the user has
- `following`: how many users the user is following
- `is_premium`: identifies if the user has a Spotify Premium membership
### playlist
This table represents a playlist on Spotify.
- `id`: unique identifier for every playlist in the table. This is the *Primary Key* of this table
- `name`: the name of the playlist
- `description`: an optional description users add on the playlist
- `followers`: the number of followers the playlist has
### users_playlists
This table represents the user(s) that own the playlist. This represents the many-to-many relationship that users and playlists have on Spotify, 
as a user can have many playlists and vice-versa (through Spotify's collaborative playlist feature).
- `user_id`: *Composite Key* that references the *spotify_user* table
- `playlist_id`: *Composite Key* that references the *playlist* table
### playlists_songs
This table represents the song(s) that are in a playlist. This represents the many-to-many relationship that songs and playlists have on Spotify,
as a song can be on many playlists and a playlist can have many songs.
- `song_id`: *Composite Key* that references the *song* table
- `playlist_id`: *Composite Key* that references the *playlist* table
### podcast
This table represents a podcast series on Spotify.
- `id`: unique identifier for every podcast in the table. This is the *Primary Key* of this table
- `name`: the name of the podcast
- `host`: the host or channel of the podcast
- `about`: description of the podcast
- `category`: category of the podcast
### podcast_episode
This table represents a podcast episode on Spotify.
- `id`: unique identifier for every podcast episode in the table. This is the *Primary Key* of this table
- `title`: title of the episode
- `podcast_id`: *Foreign Key* that references the **podcast** table - shows the podcast the episode is under
- `description`: description of the episode
- `runtime_mins`: runtime of the episdoe (in minutes)
- `release_date`: date the episode was released

## Note
All data are obtained from Spotify. Numbers such as artist followers and song plays were obtained the day they were inserted into the database - 
numbers will be incorrect in the future. Users and playlists were made-up and do not reflect real Spotify users or playlists. Full discographies 
of artists are not completed. This was not to be an accurate depiction of Spotify's service - rather this project was meant to showcase my 
knowlwedge of SQL query development and database creation. I am not affiliated with the company at all.

## Final Remarks and Contact Information
I enjoyed creating this database and therefore want to insert more data and improve its overall usability. 
Any questions or suggestions you may have is much appreciated: raeven.ruiz98@gmail.com





