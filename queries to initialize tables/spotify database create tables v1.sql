CREATE TABLE song (
  id integer PRIMARY KEY,
  title varchar(50) NOT NULL,
  runtime integer NOT NULL,
  plays bigint NOT NULL, 

-- UPDATE:
-- Had to reinsert the title column to the table on Postbird,
-- therefore the order of the songs table is as follows:
-- * id 
-- * artist_id
-- * album_id
-- * title
-- * runtime
-- * plays
-- * release_date
-- * is_explicit

CREATE TABLE artist (
  id integer PRIMARY KEY,
  name varchar(50) NOT NULL,
  monthly_listeners bigint,
  followers bigint,
  ranking integer,
  wiki_page varchar(100)
);

CREATE TABLE album (
  id integer PRIMARY KEY,
  name varchar(100) NOT NULL,
  genre varchar(50) NOT NULL,
  music_label varchar(100) NOT NULL,
  release_date date NOT NULL
);

ALTER TABLE song
ADD COLUMN artist_id integer REFERENCES artist(id);
ALTER TABLE song
ADD COLUMN album_id integer REFERENCES album(id);
ALTER TABLE album
ADD COLUMN artist_id integer REFERENCES artist(id);

CREATE TABLE spotify_user (
  id integer PRIMARY KEY,
  username varchar(50) NOT NULL,
  followers integer,
  following integer,
  is_premium boolean NOT NULL
);

CREATE TABLE playlist (
	id integer PRIMARY KEY,
  name varchar(50) NOT NULL,
  description varchar(200) NOT NULL,
  followers integer
);

CREATE TABLE users_playlists (
  user_id integer REFERENCES spotify_user(id),
  playlist_id integer REFERENCES playlist(id),
	PRIMARY KEY (user_id, playlist_id)
);

CREATE TABLE playlists_songs (
  song_id integer REFERENCES song(id),
  playlist_id integer REFERENCES playlist(id),
  PRIMARY KEY (song_id, playlist_id)
);

CREATE TABLE podcast (
	id INTEGER PRIMARY KEY,
  name varchar(50) NOT NULL,
  host varchar(50) NOT NULL,
  about varchar(1000),
  category varchar(50) NOT NULL
);

CREATE TABLE podcast_episode (
  id integer PRIMARY KEY,
  title varchar(100) NOT NULL,
  podcast_id integer REFERENCES podcast(id),
  description varchar(1000),
  runtime_mins integer,
  release_date date NOT NULL
);




