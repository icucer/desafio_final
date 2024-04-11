-- Creacion de base de datos:
CREATE DATABASE Preguntas_Respuestas;
USE Preguntas_Respuestas;

-- Creacion de tablas:
CREATE TABLE preguntas (
    id INT PRIMARY KEY,
    pregunta VARCHAR(255),
    respuesta_corecta VARCHAR(255)
);

CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    edad INT
);

CREATE TABLE respuestas (
    id INT PRIMARY KEY,
    respuesta VARCHAR(255),
    usuario_id INT,
    pregunta_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (pregunta_id) REFERENCES preguntas(id)
);

-- Inserción de registros
INSERT INTO preguntas (id, pregunta, respuesta_corecta) VALUES
    (1, '¿Cuál es la capital de Francia?', 'París'),
    (2, '¿Cuál es el río más largo del mundo?', 'Nilo'),
    (3, '¿En qué año se descubrió América?', '1492'),
    (4, '¿Cuál es el símbolo químico del agua?', 'H2O'),
    (5, '¿Quién escribió "Cien años de soledad"?', 'Gabriel García Márquez');

INSERT INTO usuarios (id, nombre, edad) VALUES
    (1, 'Ana', 30),
    (2, 'Carlos', 25),
    (3, 'Elena', 28),
    (4, 'Roma', 32),
    (5, 'Tomas', 45);

INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES
    (1, 'París', 1, 1),
    (2, 'París', 2, 1),
    (3, 'Nilo', 3, 2),
    (4, 'Nilo', 4, 3),
    (5, 'Londres', 5, 4);

-- Consultas:
-- 1) Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta).
SELECT nombre, COUNT(*) AS respuestas_correctas FROM usuarios
JOIN respuestas ON usuarios.id = respuestas.usuario_id
JOIN preguntas ON respuestas.pregunta_id = preguntas.id
WHERE respuestas.respuesta = preguntas.respuesta_corecta
GROUP BY usuarios.id, usuarios.nombre;

-- 2) Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la
-- respuesta correcta.
SELECT preguntas.id, pregunta, COUNT(respuesta) AS usuarios_con_respuesta_correcta FROM preguntas
JOIN respuestas ON preguntas.id = pregunta_id
WHERE respuesta = respuesta_corecta
GROUP BY id, pregunta;

-- 3) Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el
-- primer usuario para probar la implementación.
    -- Paso 1: Eliminar la restricción de clave externa existente
ALTER TABLE respuestas DROP FOREIGN KEY respuestas_ibfk_1;

    -- Paso 2: Volver a crear la restricción de clave externa con ON DELETE CASCADE
ALTER TABLE respuestas ADD CONSTRAINT respuestas_ibfk_1
FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE;

    -- Paso 3: Borrado del primer usuario.
DELETE FROM usuarios WHERE id = 1;

-- 4) Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.
ALTER TABLE usuarios
ADD CONSTRAINT edad_mayor_igual_18 CHECK (edad >= 18);

-- 5) Altera la tabla existente de usuarios agregando el campo email con la restricción de único.
ALTER TABLE usuarios
ADD COLUMN email VARCHAR(255) UNIQUE;
