# SQL9

~~~
DROP DATABASE IF EXISTS Ejercicio9;
CREATE DATABASE IF NOT EXISTS Ejercicio9;
USE Ejercicio9;

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

CREATE TABLE IF NOT EXISTS directors (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL UNIQUE,
    about TEXT
);

CREATE TABLE IF NOT EXISTS movies_directors (
	movies_id INT UNSIGNED NOT NULL,
    directors_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (movies_id, directors_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id),
    FOREIGN KEY (directors_id) REFERENCES directors(id)
);

CREATE TABLE IF NOT EXISTS stars (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    about TEXT
);

CREATE TABLE IF NOT EXISTS movies_stars (
	movies_id INT UNSIGNED NOT NULL,
    stars_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (movies_id, stars_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id),
    FOREIGN KEY (stars_id) REFERENCES stars(id)
);

CREATE TABLE IF NOT EXISTS genres (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS movies_genres (
	movies_id INT UNSIGNED NOT NULL,
    genres_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (movies_id, genres_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id),
    FOREIGN KEY (genres_id) REFERENCES genres(id)
);
~~~
