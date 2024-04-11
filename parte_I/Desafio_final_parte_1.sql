-- Creacion de base de datos:
CREATE DATABASE Peliculas;
USE Peliculas;

-- Creacion de tablas:
CREATE TABLE peliculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    año INT
);

CREATE TABLE tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tag VARCHAR(34)
);

CREATE TABLE relacion_peliculas_tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pelicula_id INT,
    tag_id INT,
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- Insertamos datos en las tablas:
INSERT INTO peliculas (nombre, año) VALUES
    ('El Señor de los Anillos: La Comunidad del Anillo', 2001),
    ('El Señor de los Anillos: Las Dos Torres', 2002),
    ('El Señor de los Anillos: El Retorno del Rey', 2003),
    ('El Hobbit: Un Viaje Inesperado', 2012),
    ('El Hobbit: La Desolación de Smaug', 2013);

INSERT INTO tags (tag) VALUES
    ('Aventura'),
    ('Fantasía'),
    ('Épica'),
    ('Acción'),
    ('Drama');

INSERT INTO relacion_peliculas_tags (pelicula_id, tag_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5);

INSERT INTO relacion_peliculas_tags (pelicula_id) VALUES
    (3),
    (4),
    (5);

-- Consultas de datos:
SELECT pelicula_id, COUNT(tag_id) AS 'Cantidad de tags' FROM relacion_peliculas_tags WHERE pelicula_id = 1;

SELECT pelicula_id, COUNT(tag_id) AS 'Cantidad de tags' FROM relacion_peliculas_tags WHERE pelicula_id = 2;

SELECT pelicula_id, COUNT(tag_id) AS 'Cantidad de tags' FROM relacion_peliculas_tags WHERE pelicula_id = 3;

SELECT pelicula_id, COUNT(tag_id) AS 'Cantidad de tags' FROM relacion_peliculas_tags WHERE pelicula_id = 4;

SELECT pelicula_id, COUNT(tag_id) AS 'Cantidad de tags' FROM relacion_peliculas_tags WHERE pelicula_id = 5;