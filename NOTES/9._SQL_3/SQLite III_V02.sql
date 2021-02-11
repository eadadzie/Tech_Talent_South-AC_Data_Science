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
*/

SELECT * 
FROM MusicNames mn
INNER JOIN genres ON mn.GenreName = genres.name; 
--select whatever you want!

-- Delete Temp Table 
--DROP TABLE MusicNames;


-- Distinct function 
/*SELECT DISTINCT column 1, column 2
    FROM table name
    WHERE (condition)
*/  

SELECT DISTINCt album_id FROM songs; --71
--vs
SELECT album_id FROM songs; -- 799


---- Sorting function 
/*
-- Sorting by one column
SELECT column
    FROM table name
    ORDER BY sort_column [ASC | DESC]
    
-- Sorting by multiple columns
SELECT column
    FROM table
    ORDER BY column 1, column 2, column N [ASC | DESC]

-- Sorting by relative column positions
SELECT column
    FROM table
    ORDER BY sort_num1 [ASC | DESC]; sort_num2 [ASC | DESC]; sort_num N [ASC | DESC]    
*/

-- Example 1 with Order by
SELECT * from albums ORDER BY artist_id, name ASC;

-- Example 2 with order by
SELECT albums.name AS Album, songs.name AS Song, artists.name AS Artist
FROM songs 
INNER JOIN albums ON songs.album_id = albums.id
INNER JOIN artists ON albums.artist_id = artists.id
ORDER BY Album, Song; 

-- Sorting: Group by
/*
SELECT column 1, column 2
    FROM table name
    WHERE (condition)
    GROUP BY column 1, column 2
    ORDER BY column 1, column 2
*/

-- Example 3 with Group by
SELECT songs.name AS Song, albums.name AS Album, artists.name AS Artist
FROM songs 
INNER JOIN albums ON songs.album_id = albums.id
INNER JOIN artists ON albums.artist_id = artists.id
GROUP BY Album
ORDER BY Album, Song



   


