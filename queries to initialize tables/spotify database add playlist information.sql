-- Inserting songs into the BROCKHAMPTON playlist
INSERT INTO playlists_songs VALUES (10036, 500000);
INSERT INTO playlists_songs VALUES (10037, 500000);
INSERT INTO playlists_songs VALUES (10045, 500000);
INSERT INTO playlists_songs VALUES (10053, 500000);
INSERT INTO playlists_songs VALUES (10061, 500000);
INSERT INTO playlists_songs VALUES (10067, 500000);
INSERT INTO playlists_songs VALUES (10038, 500000);
INSERT INTO playlists_songs VALUES (10074, 500000);
INSERT INTO playlists_songs VALUES (10078, 500000);
INSERT INTO playlists_songs VALUES (10079, 500000);
INSERT INTO playlists_songs VALUES (10214, 500000);
INSERT INTO playlists_songs VALUES (10222, 500000);
INSERT INTO playlists_songs VALUES (10226, 500000);
INSERT INTO playlists_songs VALUES (10229, 500000);
INSERT INTO playlists_songs VALUES (10233, 500000);
INSERT INTO playlists_songs VALUES (10234, 500000);
INSERT INTO playlists_songs VALUES (10235, 500000);
INSERT INTO playlists_songs VALUES (10239, 500000);
INSERT INTO playlists_songs VALUES (10240, 500000);
INSERT INTO playlists_songs VALUES (10242, 500000);
INSERT INTO playlists_songs VALUES (10243, 500000);

-- Because I am the owner of this playlist, I will assign myself to it
INSERT INTO users_playlists VALUES (100000, 500000);

-- Let's look at this playlist in its entirety (user, playlist information, song, artist, album)
SELECT spotify_user.username, playlist.name as playlist, playlist.description,
	song.title as song, artist.name as artist, album.name as album
FROM spotify_user JOIN users_playlists
	ON spotify_user.id = users_playlists.user_id
JOIN playlist
	ON playlist.id = users_playlists.playlist_id
JOIN playlists_songs
	ON playlist.id = playlists_songs.playlist_id
JOIN song
	ON song.id = playlists_songs.song_id
JOIN artist
	ON artist.id = song.artist_id
JOIN album
	ON album.id = song.album_id
WHERE playlist.id = 500000;
  
-- ###########################################################################################

-- Inserting songs into the 'Road Trip w/ Bebes' playlist
INSERT INTO playlists_songs VALUES (10084, 500001);
INSERT INTO playlists_songs VALUES (10089, 500001);
INSERT INTO playlists_songs VALUES (10103, 500001);
INSERT INTO playlists_songs VALUES (10109, 500001);
INSERT INTO playlists_songs VALUES (10125, 500001);
INSERT INTO playlists_songs VALUES (10129, 500001);
INSERT INTO playlists_songs VALUES (10147, 500001);
INSERT INTO playlists_songs VALUES (10178, 500001);
INSERT INTO playlists_songs VALUES (10192, 500001);

-- Since it its a collaborative playlist between my girlfriend and I, I will add both of us
-- as the owners. This is an example of why the playlist and song tables are a many-to-many
-- relationship.

INSERT INTO users_playlists VALUES (100000, 500001);
INSERT INTO users_playlists VALUES (100001, 500001);

SELECT playlist.name as playlist, playlist.description,
	song.title as song, artist.name as artist, album.name as album
FROM spotify_user JOIN users_playlists
	ON spotify_user.id = users_playlists.user_id
JOIN playlist
	ON playlist.id = users_playlists.playlist_id
JOIN playlists_songs
	ON playlist.id = playlists_songs.playlist_id
JOIN song
	ON song.id = playlists_songs.song_id
JOIN artist
	ON artist.id = song.artist_id
JOIN album
	ON album.id = song.album_id
WHERE playlist.id = 500001;

-- If we select usernames as well to the above query, then the row values will double as they will be grouped with
-- both me and Kassie, but the query below will show that we are both the owners of the playlist.
SELECT DISTINCT spotify_user.username
FROM spotify_user JOIN users_playlists
	ON spotify_user.id = users_playlists.user_id
JOIN playlist
	ON playlist.id = users_playlists.playlist_id
WHERE playlist.id = 500001;
