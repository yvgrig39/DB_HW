-- ЗАДАНИЕ 2

-- Самый длинный трек
SELECT name, duration
FROM songs
ORDER BY duration DESC
LIMIT 1;

-- Треки не менее 3.5 минут
SELECT name
FROM songs
WHERE duration >= 210;

-- Сборники 2018–2020
SELECT name
FROM collections
WHERE year BETWEEN 2018 AND 2020;

-- Исполнители с одним словом
SELECT name
FROM singers
WHERE name NOT LIKE '% %';

-- Треки со словом my или мой
SELECT name
FROM songs
WHERE
    -- MY
    LOWER(name) LIKE 'my %' OR
    LOWER(name) LIKE '% my' OR
    LOWER(name) LIKE '% my %' OR
    LOWER(name) = 'my' OR
    LOWER(name) LIKE 'мой %' OR
    LOWER(name) LIKE '% мой' OR
    LOWER(name) LIKE '% мой %' OR
    LOWER(name) = 'мой';


-- ЗАДАНИЕ 3

-- Количество исполнителей в каждом жанре
SELECT g.name, COUNT(sg.singer_id)
FROM genres g
LEFT JOIN singer_genres sg ON g.id = sg.genre_id
GROUP BY g.name;

-- Количество треков в альбомах 2019–2020
SELECT COUNT(s.id)
FROM songs s
JOIN albums a ON s.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по альбомам
SELECT a.name, AVG(s.duration)
FROM albums a
JOIN songs s ON a.id = s.album_id
GROUP BY a.name;

-- Исполнители без альбомов 2020 года
SELECT DISTINCT s.name
FROM singers s
WHERE s.id NOT IN (
    SELECT singer_id
    FROM album_singers als
    JOIN albums a ON als.album_id = a.id
    WHERE a.year = 2020
);

-- Сборники с исполнителем "Руки Вверх!"
SELECT DISTINCT c.name
FROM collections c
JOIN collection_songs cs ON c.id = cs.collection_id
JOIN songs s ON cs.song_id = s.id
JOIN album_singers als ON s.album_id = als.album_id
JOIN singers si ON als.singer_id = si.id
WHERE si.name = 'Руки Вверх!';


-- ЗАДАНИЕ 4

-- Альбомы с исполнителями более одного жанра
SELECT DISTINCT a.name
FROM albums a
JOIN album_singers als ON a.id = als.album_id
JOIN singer_genres sg ON als.singer_id = sg.singer_id
GROUP BY a.name, als.singer_id
HAVING COUNT(DISTINCT sg.genre_id) > 1;

-- Треки, не входящие в сборники
SELECT name
FROM songs
WHERE id NOT IN (
    SELECT song_id FROM collection_songs
);

-- Самый короткий трек и его исполнитель
SELECT s.name, si.name
FROM songs s
JOIN album_singers als ON s.album_id = als.album_id
JOIN singers si ON als.singer_id = si.id
WHERE s.duration = (SELECT MIN(duration) FROM songs);

-- Альбомы с наименьшим количеством треков
SELECT a.name
FROM albums a
JOIN songs s ON a.id = s.album_id
GROUP BY a.name
HAVING COUNT(s.id) = (
    SELECT MIN(cnt)
    FROM (
        SELECT COUNT(*) cnt
        FROM songs
        GROUP BY album_id
    ) t
);