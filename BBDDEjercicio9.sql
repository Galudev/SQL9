DROP DATABASE IF EXISTS Ejercicio9;
CREATE DATABASE IF NOT EXISTS Ejercicio9;
USE Ejercicio9;

DROP TABLE IF EXISTS movies;
CREATE TABLE IF NOT EXISTS movies (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    certificate VARCHAR(45),
    runtime INT,
    imdb_rating FLOAT,
    description TEXT,
    metascore INT,
    votes INT,
    gross INT
);

DROP TABLE IF EXISTS directors;
CREATE TABLE IF NOT EXISTS directors (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL UNIQUE,
    about TEXT
);

DROP TABLE IF EXISTS movies_directors;
CREATE TABLE IF NOT EXISTS movies_directors (
	movies_id INT UNSIGNED NOT NULL,
    directors_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (movies_id, directors_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (directors_id) REFERENCES directors(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS stars;
CREATE TABLE IF NOT EXISTS stars (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    about TEXT
);

DROP TABLE IF EXISTS movies_stars;
CREATE TABLE IF NOT EXISTS movies_stars (
	movies_id INT UNSIGNED NOT NULL,
    stars_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (movies_id, stars_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (stars_id) REFERENCES stars(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS genres;
CREATE TABLE IF NOT EXISTS genres (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL
);

DROP TABLE IF EXISTS movies_genres;
CREATE TABLE IF NOT EXISTS movies_genres (
	movies_id INT UNSIGNED NOT NULL,
    genres_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (movies_id, genres_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY (genres_id) REFERENCES genres(id) ON DELETE CASCADE
);


INSERT INTO movies (title, year, image_url) VALUES
('Interstellar', 2014, 'https://www.imdb.com/title/tt0816692/mediaviewer/rm2861200384/?ref_=tt_ov_i'),
('Origen', 2010, 'https://www.imdb.com/title/tt1375666/mediaviewer/rm442856448/?ref_=tt_ov_i'),
('Memento', 2000, 'https://www.imdb.com/title/tt0209144/mediaviewer/rm655365120/?ref_=tt_ov_i'),
('Harry Potter y la piedra filosofal', 2001, 'https://www.imdb.com/title/tt0241527/mediaviewer/rm2919985408/?ref_=tt_ov_i'),
('Harry Potter y la cámara secreta', 2002, 'https://www.imdb.com/title/tt0295297/mediaviewer/rm3589240064/?ref_=tt_ov_i');

INSERT INTO directors (name) VALUES
('Christopher Nolan'),
('Chris Columbus');

INSERT INTO movies_directors (movies_id, directors_id) VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2);

INSERT INTO genres (name) VALUES
('Ciencia Ficción'),
('Misterio'),
('Fantasía');

INSERT INTO movies_genres (movies_id, genres_id) VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,3);

INSERT INTO stars (name) VALUES
('Matthew McConaughey'),
('Leonardo DiCaprio'),
('Guy Pearce'),
('Daniel Radcliffe');

INSERT INTO movies_stars (movies_id, stars_id) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,4);


DELETE FROM movies;
DELETE FROM directors;
DELETE FROM stars;
DELETE FROM genres;

-- DELETE FROM movies_directors;
-- DELETE FROM movies_stars;
-- DELETE FROM movies_genres;
-- DELETE FROM movies;
-- DELETE FROM directors;
-- DELETE FROM stars;
-- DELETE FROM genres;