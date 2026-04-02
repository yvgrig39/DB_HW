INSERT INTO genres (name) VALUES
('Pop'),
('Dance'),
('Eurodance');

INSERT INTO singers (name) VALUES
('Иванушки International'),
('Руки Вверх!'),
('Demo'),
('HiFi'),
('Zivert');

INSERT INTO singer_genres VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 3),
(4, 1),
(5, 2);

INSERT INTO albums (name, year) VALUES
('Конечно он', 1996),
('Твои письма', 1997),
('Сделай погромче', 1998),
('Без тормозов', 1999),
('Vinyl #1', 2020);

INSERT INTO album_singers VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 2),
(5, 5);

INSERT INTO songs (name, duration, album_id) VALUES
('Тучи', 230, 1),
('Кукла', 210, 1),
('Твои письма', 215, 2),
('Студент', 200, 3),
('Крошка моя', 240, 4),
('My Love Song', 260, 4),
('Credo', 210, 5);

INSERT INTO collections (name, year) VALUES
('Лучшие хиты 90-х', 1998),
('Дискотека 90-х', 1999),
('Русский поп', 2019),
('Золотые хиты', 2020);

INSERT INTO collection_songs VALUES
(1,1),
(1,2),
(2,4),
(2,5),
(3,3),
(3,6),
(4,5),
(4,7);