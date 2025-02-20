DROP TABLE estadistica;
DROP TABLE estudiante;
DROP TABLE administrador;
DROP TABLE curso;


SELECT * FROM estudiante;
SELECT * FROM administrador;
SELECT * FROM curso;
SELECT * FROM estadistica;

CREATE TABLE ADMINISTRADOR (
    IDADMINISTRADOR INT PRIMARY KEY, 
    NOMBRE VARCHAR2(100),                        
    CORREO VARCHAR2(100),            
    CLAVE VARCHAR2(255)        
);

CREATE TABLE ESTUDIANTE (
    IDESTUDIANTE INT PRIMARY KEY, 
    NOMBRE VARCHAR2(100),             
    FECHANACIMIENTO VARCHAR2(100),            
    CORREO VARCHAR2(100),            
    DIRECCION VARCHAR2(255)        
);

CREATE TABLE CURSO (
    IDCURSO INT PRIMARY KEY, 
    NOMBRE VARCHAR2(100), 
    CODIGO VARCHAR2(20), 
    DESCRIPCION VARCHAR2(600), 
    CREDITOS INT,
    DURACION NUMBER
);

CREATE TABLE ESTADISTICA (
    IDESTADISTICA INT PRIMARY KEY,
    IDESTUDIANTE INT,
    IDCURSO INT,
    ASISTENCIA NUMBER(5,2),           -- Porcentaje de asistencia
    TIEMPOESTUDIO NUMBER(5,2),         -- Tiempo de estudio por semana (en horas)
    PROMEDIO NUMBER(5,2),              -- Promedio del estudiante en el curso
    PARTICIPACION NUMBER(5,2),         -- Porcentaje de participación
    IDIOMAS VARCHAR2(100)
);

ALTER TABLE ESTADISTICA
ADD CONSTRAINT FK_ESTUDIANTE
FOREIGN KEY (IDESTUDIANTE) REFERENCES ESTUDIANTE(IDESTUDIANTE);

ALTER TABLE ESTADISTICA
ADD CONSTRAINT FK_CURSO
FOREIGN KEY (IDCURSO) REFERENCES CURSO(IDCURSO);


-- DATOS:
--datos estudiantes
INSERT INTO estudiante (idestudiante, nombre, fechanacimiento, correo, direccion)
VALUES (1, 'Lucas', '2000-12-20', 'lucas@gmail.com','San Isidro');
INSERT INTO estudiante (idestudiante, nombre, fechanacimiento, correo, direccion)
VALUES (2, 'Ana', '1998-06-15', 'ana@gmail.com','Av. larco');
INSERT INTO estudiante (idestudiante, nombre, fechanacimiento, correo, direccion)
VALUES (3, 'Carlos', '1999-03-30', 'carlos@gmail.com','La molina');
INSERT INTO estudiante (idestudiante, nombre, fechanacimiento, correo, direccion)
VALUES (4, 'Marta', '2001-08-10', 'marta@gmail.com','San Isidro');
INSERT INTO estudiante (idestudiante, nombre, fechanacimiento, correo, direccion)
VALUES (5, 'Pedro', '1997-11-05', 'pedro@gmail.com','La molina');

--datos de administrador
INSERT INTO administrador (idAdministrador, nombre, correo, clave)
VALUES (1, 'Ricardo', 'ricardo@gmail.com','1234');
INSERT INTO administrador (idAdministrador, nombre, correo, clave)
VALUES (2, 'Lucas', 'lucas@gmail.com','1234');
INSERT INTO administrador (idAdministrador, nombre, correo, clave)
VALUES (3, 'German', 'german@gmail.com','1234');

-- Datos de curso
INSERT INTO CURSO (idcurso, nombre, codigo, descripcion, creditos, duracion)
    VALUES (1, 'Matemáticas', 'MAT101', 'Este curso es una introducción al estudio del álgebra y cálculo básico. Se enfoca en enseñar los conceptos fundamentales de las operaciones algebraicas, la resolución de ecuaciones, la teoría de funciones y los principios básicos de cálculo diferencial e integral. Ideal para estudiantes que desean construir una sólida base en matemáticas para futuras asignaturas más complejas.', 4, 16);
INSERT INTO CURSO (idcurso, nombre, codigo, descripcion, creditos, duracion)
    VALUES (2, 'Historia Universal', 'HIS102', 'Este curso ofrece una visión detallada de los eventos más significativos que han marcado la historia de la humanidad, desde las civilizaciones antiguas hasta la era contemporánea. Los estudiantes explorarán los cambios políticos, sociales, económicos y culturales que han dado forma al mundo moderno, con énfasis en la historia política, los grandes movimientos sociales y las guerras más importantes.', 3, 12);
INSERT INTO CURSO (idcurso, nombre, codigo, descripcion, creditos, duracion)
    VALUES (3, 'Física', 'FIS103', 'El curso de Física cubre los principios fundamentales de la física clásica, incluyendo la mecánica, la termodinámica, el electromagnetismo y la óptica. A través de experimentos y problemas prácticos, los estudiantes comprenderán las leyes que rigen el movimiento de los cuerpos, la energía, la materia y las interacciones fundamentales. Este curso proporciona una base sólida para aquellos interesados en carreras científicas o ingenieriles.', 5, 20);
INSERT INTO CURSO (idcurso, nombre, codigo, descripcion, creditos, duracion)
    VALUES (4, 'Química General', 'QUI104', 'Este curso introduce los principios fundamentales de la química, incluyendo la teoría atómica, la estructura molecular, las reacciones químicas y las propiedades de los materiales. Los estudiantes aprenderán a aplicar estos principios a situaciones cotidianas y entenderán la química que ocurre en el mundo que nos rodea. Es un curso esencial para estudiantes que planean seguir estudios en ciencias biológicas, ingenierías o ciencias ambientales.', 4, 14);
INSERT INTO CURSO (idcurso, nombre, codigo, descripcion, creditos, duracion)
    VALUES (5, 'Literatura Española', 'LIT105', 'En este curso se estudian las principales obras literarias de la literatura española, desde los inicios de la literatura medieval hasta los autores contemporáneos más influyentes. Los estudiantes leerán y analizarán textos de autores como Cervantes, Lorca y Pérez Galdós, abordando temas como la identidad cultural, la evolución de los géneros literarios y el contexto histórico de cada periodo. Ideal para estudiantes interesados en las humanidades, el análisis literario y la cultura española.', 3, 10);
INSERT INTO CURSO (idcurso, nombre, codigo, descripcion, creditos, duracion)
    VALUES (6, 'Biología', 'BIO106', 'Este curso proporciona una introducción integral a los principios básicos de la biología, enfocándose en la biología celular, la genética, la ecología y la evolución. Los estudiantes explorarán los procesos biológicos fundamentales como la mitosis, la fotosíntesis y la herencia genética, así como los ecosistemas y su equilibrio. Es ideal para aquellos que buscan una comprensión profunda de los seres vivos y sus interacciones con el medio ambiente, y sirve de base para estudios avanzados en biología, medicina o ciencias ambientales.', 5, 18);

-- Insertando datos en la tabla ESTADISTICA

INSERT INTO ESTADISTICA (idEstadistica, idEstudiante, idCurso, asistencia, tiempoEstudio, promedio, participacion, idiomas)
VALUES (1, 1, 1, 85.5, 10.0, 9.2, 80.0, 'Español, Inglés');
INSERT INTO ESTADISTICA (idEstadistica, idEstudiante, idCurso, asistencia, tiempoEstudio, promedio, participacion, idiomas)
VALUES (2, 2, 2, 92.0, 8.0, 8.5, 75.0, 'Español');
INSERT INTO ESTADISTICA (idEstadistica, idEstudiante, idCurso, asistencia, tiempoEstudio, promedio, participacion, idiomas)
VALUES (3, 3, 3, 78.5, 12.0, 7.8, 65.0, 'Español, Inglés');
INSERT INTO ESTADISTICA (idEstadistica, idEstudiante, idCurso, asistencia, tiempoEstudio, promedio, participacion, idiomas)
VALUES (4, 4, 4, 85.5, 10.0, 9.2, 80.0, 'Español, Inglés');


DELETE FROM ESTUDIANTE WHERE IDCURSO = 7;

UPDATE CURSO
SET NOMBRE = 'Programacion con Java'
WHERE IDCURSO = 1;

DROP TABLE curso;

DELETE FROM ESTUDIANTE WHERE IDESTUDIANTE = 4;

DELETE FROM CURSO WHERE IDCURSO = 1;

SELECT e.idEstadistica, 
       est.idEstudiante, 
       est.nombre AS nombreEst, 
       c.idCurso, 
       c.nombre AS nombreCurso, 
       c.duracion AS duracionCurso, 
       e.asistencia, 
       e.tiempoEstudio, 
       e.promedio, 
       e.participacion, 
       e.idiomas 
FROM estadistica e
INNER JOIN estudiante est ON e.idEstudiante = est.idEstudiante
INNER JOIN curso c ON e.idCurso = c.idCurso;

UPDATE estadistica SET idestudiante=?, idcurso=?, asistencia=?, tiempoestudio=?, promedio=?, participacion=?, idiomas=? WHERE idEstadistica=?;

UPDATE estadistica SET idestudiante=1, idcurso=1, asistencia=2, tiempoestudio=85.5, promedio=9.2, participacion=80, idiomas='Español, Portuguez' WHERE idEstadistica= 1;
