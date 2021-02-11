---- Relational Databases

-- Inner Join
SELECT albums.id, albums.name, SUM(songs.length) AS Minutes 
FROM songs 
INNER JOIN albums ON songs.album_id = albums.id
GROUP BY albums.id;

-- Switching the Tables FROM albums not songs 
SELECT albums.id, albums.name, SUM(songs.length) AS Minutes 
FROM albums
INNER JOIN songs ON songs.album_id = albums.id
GROUP BY albums.id;


-- Left Join
SELECT 
	albums.name,
	songs.name, 
	songs.length AS Minutes 
FROM albums 
LEFT JOIN songs ON albums.id = songs.album_id
ORDER BY albums.name, Minutes;


-- Multiple Joins
SELECT 
    artists.name AS Artist,
    songs.name AS Song,
    songs.length AS Minutes,
	albums.name AS Album,
    albums.label AS Label,
    albums.year_released AS Released
FROM albums
INNER JOIN songs ON albums.id = songs.album_id 
INNER JOIN artists ON albums.artist_id = artists.id
GROUP BY albums.name
ORDER BY artists.name;


-- Sub-Select in Joins
SELECT 
	albums.name,
	songSubSelect.name, 
	songSubSelect.length AS Minutes 
FROM albums 
INNER JOIN 
(
	SELECT * FROM songs
) songSubSelect ON albums.id = songSubSelect.album_id;


-- Union
SELECT id, name, created_at FROM songs --a dataset
UNION ALL
SELECT id, name, updated_at FROM albums; --another dataset


-- Union All
SELECT * FROM songs 
UNION 
SELECT * FROM songs;


-- Intersect
SELECT album_id, name FROM songs 
INTERSECT
SELECT id, name FROM albums;


SELECT COUNT(album_id) FROM
(
    SELECT album_id, name FROM songs 
    INTERSECT
    SELECT id, name FROM albums
);


-- Except
SELECT name
FROM songs
WHERE album_id < 65

EXCEPT 

SELECT name
FROM songs
WHERE name = 'Ironic';

-- Challenge 
SELECT COUNT (name)
FROM (SELECT name FROM songs WHERE album_id < 65
	  EXCEPT 
	  SELECT name
	  FROM songs
	  WHERE name = 'Ironic');

-- Other project without EXCEPT
SELECT DISTINCT COUNT(name)
FROM songs 
WHERE album_id < 65 AND name <> "Ironic";


/*
-- Temp Tables 
CREATE TEMPORARY TABLE MusicNames 
(
  MusicNameID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  ArtistName VARCHAR NOT NULL,
  SongName VARCHAR NOT NULL,
  AlbumName VARCHAR NOT NULL,
  GenreName VARCHAR NOT NULL
);

INSERT INTO MusicNames 
(
  ArtistName,
  SongName,
  AlbumName,
  GenreName 
)
SELECT 
    art.name,
   	s.name,
    al.name,
    g.name
FROM albums al
INNER JOIN songs s ON al.id = s.album_id 
INNER JOIN genres g ON al.genre_id = g.id 
INNER JOIN artists art ON al.artist_id = art.id; 
--Notice that I did not use 'AS' before the alias. 
--Yes, that is allowed!

SELECT * 
FROM MusicNames mn
INNER JOIN genres ON mn.GenreName = genres.name; 
--select whatever you want!
*/
