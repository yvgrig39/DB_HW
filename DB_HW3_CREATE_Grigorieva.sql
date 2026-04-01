  -- Таблица жанров
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Таблица исполнителей
CREATE TABLE singers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Связь многие-ко-многим: исполнители ↔ жанры
CREATE TABLE singer_genres (
    singer_id INT REFERENCES singers(id) ON DELETE CASCADE,
    genre_id INT REFERENCES genres(id) ON DELETE CASCADE,
    PRIMARY KEY (singer_id, genre_id)
);

-- Таблица альбомов
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year INT NOT NULL
);

-- Связь многие-ко-многим: альбомы ↔ исполнители
CREATE TABLE album_singers (
    album_id INT REFERENCES albums(id) ON DELETE CASCADE,
    singer_id INT REFERENCES singers(id) ON DELETE CASCADE,
    PRIMARY KEY (album_id, singer_id)
);

-- Таблица треков
CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INT NOT NULL, -- длительность в секундах
    album_id INT REFERENCES albums(id) ON DELETE CASCADE
);

-- Таблица сборников
CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year INT NOT NULL
);

-- Связь многие-ко-многим: сборники ↔ треки
CREATE TABLE collection_songs (
    collection_id INT REFERENCES collections(id) ON DELETE CASCADE,
    song_id INT REFERENCES songs(id) ON DELETE CASCADE,
    PRIMARY KEY (collection_id, song_id)
);