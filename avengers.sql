CREATE DATABASE avengers;
USE avengers;

CREATE TABLE DEPARTAMENTO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    total_personas INT

);

CREATE TABLE MIEMBRO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento VARCHAR(45),
    numero_documento VARCHAR(45),
    primer_nombre VARCHAR(45),
    segundo_nombre VARCHAR(45),
    primer_apellido VARCHAR(45),
    segundo_apellido VARCHAR(45),
    fecha_nacimiento DATETIME,
    estado VARCHAR(45),
    fotografia VARCHAR(45),
    asignado TINYINT,
    aumentado TINYINT,
    tipo_aumento VARCHAR(45),
    habilidad VARCHAR(45),
    tipo_miembro VARCHAR(45),
    hora_mision INT,
    cantidad_mision INT,
    DEPARTAMENTO_id INT NOT NULL,
    FOREIGN KEY (DEPARTAMENTO_id) REFERENCES DEPARTAMENTO(id)
);

CREATE TABLE GRUPOS_TRABAJO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(45),
    objetivo VARCHAR(45),
    DEPARTAMENTO_id INT NOT NULL,
    FOREIGN KEY (DEPARTAMENTO_id) REFERENCES DEPARTAMENTO(id)
);

CREATE TABLE MISION (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora_inicio DATETIME NOT NULL,
    fecha_hora_fin DATETIME,
    objetivo VARCHAR(45),
    lugar VARCHAR(45),
    equipamiento VARCHAR(45),
    grupo_apoyo VARCHAR(45),
    necesidad_departamento VARCHAR(45),
    total_horas INT,
    exito TINYINT,
    GRUPOS_TRABAJO_id INT,
    FOREIGN KEY (GRUPOS_TRABAJO_id) REFERENCES GRUPOS_TRABAJO(id)
);

CREATE TABLE INVENTARIOS_ARMAS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    modelo VARCHAR(45),
    tipo VARCHAR(45),
    funcion VARCHAR(45),
    partes_ensamblamiento VARCHAR(45),
    clasificada TINYINT,
    experimental TINYINT,
    prototipo TINYINT,
    unidades INT,
    MIEMBRO_id INT,
    GRUPOS_TRABAJO_id INT,
    FOREIGN KEY (MIEMBRO_id) REFERENCES MIEMBRO(id),
    FOREIGN KEY (GRUPOS_TRABAJO_id) REFERENCES GRUPOS_TRABAJO(id)
);

CREATE TABLE HISTORIAL_ASIGNACION (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_entidad VARCHAR(45),
    valor_anterior VARCHAR(45),
    valor_nuevo VARCHAR(45),
    fecha_cambio DATETIME,
    MIEMBRO_id INT NOT NULL,
    FOREIGN KEY (MIEMBRO_id) REFERENCES MIEMBRO(id)
);

CREATE TABLE ENEMIGO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pila VARCHAR(45),
    nombre_completo VARCHAR(45),
    ataque VARCHAR(45),
    ultime_ubicacion VARCHAR(45),
    prisionero TINYINT,
    MISION_id INT,
    FOREIGN KEY (MISION_id) REFERENCES MISION(id)
);

CREATE TABLE ASIGNACIONES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    MIEMBRO_id INT NOT NULL,
    MISION_id INT NOT NULL,
    FOREIGN KEY (MIEMBRO_id) REFERENCES MIEMBRO(id),
    FOREIGN KEY (MISION_id) REFERENCES MISION(id)
);

CREATE TABLE AMENAZA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora_amenaza DATETIME,
    descripcion VARCHAR(45),
    foto_video VARCHAR(45),
    ubicacion_exacta VARCHAR(45),
    tipo VARCHAR(45),
    MIEMBRO_id INT NOT NULL,
    GRUPOS_TRABAJO_id INT,
    MISION_id INT,
    prioridad VARCHAR(45),
    FOREIGN KEY (MIEMBRO_id) REFERENCES MIEMBRO(id),
    FOREIGN KEY (GRUPOS_TRABAJO_id) REFERENCES GRUPOS_TRABAJO(id),
    FOREIGN KEY (MISION_id) REFERENCES MISION(id)
);

CREATE TABLE PROVEEDORES_ARMAMENTO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tipo_servicio VARCHAR(45),
    armamento VARCHAR(45)
);

CREATE TABLE ARMA_PROVEEDOR (
    INVENTARIOS_ARMAS_id INT NOT NULL,
    PROVEEDORES_ARMAMENTO_id INT NOT NULL,
    PRIMARY KEY (INVENTARIOS_ARMAS_id, PROVEEDORES_ARMAMENTO_id),
    FOREIGN KEY (INVENTARIOS_ARMAS_id) REFERENCES INVENTARIOS_ARMAS(id),
    FOREIGN KEY (PROVEEDORES_ARMAMENTO_id) REFERENCES PROVEEDORES_ARMAMENTO(id)
);



INSERT INTO DEPARTAMENTO (nombre, total_personas) VALUES
('Defensa', 35),
('Inteligencia', 55),
('Investigacion y Desarrollo', 65),
('Logistica', 17);

INSERT INTO MIEMBRO (tipo_documento, numero_documento, primer_nombre, primer_apellido, fecha_nacimiento, estado, asignado, aumentado, tipo_miembro, hora_mision, cantidad_mision, DEPARTAMENTO_id) VALUES
('Cedula', '1001', 'Steve', 'Rogers', '1918-07-04', 'Activo', 1, 1, 'Principal', 420, 18, 1),
('Pasaporte', '1002', 'Tony', 'Stark', '1970-05-29', 'Activo', 1, 1, 'Principal', 500, 20, 3),
('Cedula', '1003', 'Thor', 'Odinson', '1500-01-01', 'Activo', 1, 1, 'Principal', 600, 25, 1),
('Pasaporte', '1004', 'Natasha', 'Romanoff', '1984-11-22', 'Inactivo', 0, 0, 'Principal', 310, 14, 2),
('Cedula', '1005', 'Maria', 'Hill', '1982-04-04', 'Activo', 0, 0, 'Militar', 280, 12, 2),
('Cedula', '1006', 'Sam', 'Wilson', '1978-03-15', 'Activo', 1, 1, 'Militar', 200, 10, 2),
('Cedula', '1007', 'Bruce', 'Banner', '1969-12-18', 'Activo', 1, 1, 'Principal', 350, 15, 4),
('Cedula', '1008', 'Nick', 'Fury', '1950-06-21', 'Activo', 1, 0, 'Militar', 150, 8, 2),
('Cedula', '1009', 'Pepper', 'Potts', '1974-09-01', 'Activo', 0, 0, 'Civil', 50, 3, 3),
('Cedula', '1010', 'Happy', 'Hogan', '1972-02-10', 'Activo', 0, 0, 'Civil', 30, 2, 4);

INSERT INTO GRUPOS_TRABAJO (nombre_departamento, objetivo, DEPARTAMENTO_id) VALUES
('Vengadores', 'Defensa', 1),
('Inteligencia Tactica', 'Analisis de Amenazas', 2),
('Laboratorio Stark', 'Desarrollo Tecnologico', 3),
('Logistica Operativa', 'Soporte de Recursos', 4);

INSERT INTO MISION (fecha_hora_inicio, fecha_hora_fin, objetivo, lugar, total_horas, exito, GRUPOS_TRABAJO_id) VALUES
('2009-05-30 09:20:24', '2009-06-12 08:52:40', 'Defender Nueva York', 'Nueva York', 120, 1, 1),
('1998-02-10 10:34:00', '1998-02-11 06:37:00', 'Interceptar HYDRA', 'Berlin', 120, 1, 1),
('2025-03-05 04:00:27', '2025-03-09 17:00:00', 'Investigar Taskmaster', 'Londres', 56, 0, 2),
('2018-01-05 08:00:00', '2018-01-06 12:00:00', 'Contrainteligencia', 'Moscu', 80, 1, 2),
('2015-04-20 08:00:00', '2015-04-25 20:00:00', 'Neutralizar Ultron', 'Sokovia', 150, 1, 3),
('2020-06-01 07:00:00', '2020-06-03 19:00:00', 'Reabastecer base', 'Wakanda', 110, 1, 4);

INSERT INTO INVENTARIOS_ARMAS (nombre, modelo, tipo, funcion, experimental, unidades, MIEMBRO_id, GRUPOS_TRABAJO_id) VALUES
('Traje Iron Man', 'Mark 85', 'Traje', 'Combate', 0, 1, 2, NULL),
('Escudo Capitan America', 'Vibranium', 'Escudo', 'Defensa', 0, 1, 1, NULL),
('Dron Stark', 'Sentry', 'Dron', 'Vigilancia', 1, 10, NULL, 3),
('Rayo Gamma Portatil', 'GX-1', 'Arma', 'Ofensiva', 1, 3, 7, 3),
('Traje Falcon', 'Redwing', 'Traje', 'Vigilancia', 1, 2, 6, 4);

INSERT INTO ENEMIGO (nombre_pila, nombre_completo, ataque, ultime_ubicacion, prisionero, MISION_id) VALUES
('Zemo', 'Helmut Zemo', 'Intento de fuga', 'The Raft', 1, NULL),
('Loki', 'Loki Laufeyson', 'Invasion', 'Asgard', 0, 1),
('Ultron', 'Ultron', 'Ataque robotico masivo', 'Sokovia', 0, 5);

INSERT INTO ASIGNACIONES (MIEMBRO_id, MISION_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 4),
(7, 5),
(6, 6);

INSERT INTO AMENAZA (fecha_hora_amenaza, descripcion, ubicacion_exacta, tipo, MIEMBRO_id, GRUPOS_TRABAJO_id, MISION_id, prioridad) VALUES
('2018-01-10 09:00:00', 'Movimiento inusual', 'Sokovia', 'Robotico', 5, 2, NULL, 'Alta'),
('2018-02-14 11:00:00', 'Senal encriptada', 'Wakanda', 'Ciberataque', 5, 2, NULL, 'Media'),
('2008-07-05 10:00:00', 'Actividad sospechosa', 'Nueva York', 'Seguridad', 5, 2, NULL, 'Media'),
('2026-08-15 13:00:00', 'Objeto en el cielo', 'Berlin', 'Alienigena', 1, 1, 1, 'Critica'),
('2015-03-01 08:00:00', 'Falla en laboratorio', 'Sokovia', 'Tecnologico', 1, 1, NULL, 'Alta'),
('2020-05-20 07:30:00', 'Intrusion en base', 'Wakanda', 'Seguridad', 6, 2, NULL, 'Media'),
('2020-06-02 09:00:00', 'Robo de suministros', 'Wakanda', 'Logistico', 6, 4, 6, 'Baja'),
('2019-11-11 10:00:00', 'Reporte civil', 'Nueva York', 'Menor', 9, 3, NULL, 'Baja');

INSERT INTO PROVEEDORES_ARMAMENTO (nombre, tipo_servicio, armamento) VALUES
('Stark Industries', 'Hardware', 'Trajes'),
('OSCORP', 'Biologico', 'Quimicos'),
('Wakanda Design Group', 'Hardware', 'Escudos');

INSERT INTO ARMA_PROVEEDOR (INVENTARIOS_ARMAS_id, PROVEEDORES_ARMAMENTO_id) VALUES
(1, 1),
(2, 3),
(3, 1),
(4, 2),
(5, 3);


--Consulta 1:
SELECT DEPARTAMENTO.nombre, COUNT(MIEMBRO.id) AS cantidad_miembros_activos
FROM DEPARTAMENTO
JOIN MIEMBRO ON MIEMBRO.DEPARTAMENTO_id = DEPARTAMENTO.id
WHERE MIEMBRO.estado = 'Activo'
GROUP BY DEPARTAMENTO.nombre
ORDER BY cantidad_miembros_activos DESC;

--Consulta 2: 
SELECT DEPARTAMENTO.nombre, SUM(MIEMBRO.hora_mision) AS total_horas
FROM DEPARTAMENTO
JOIN MIEMBRO ON MIEMBRO.DEPARTAMENTO_id = DEPARTAMENTO.id
WHERE MIEMBRO.aumentado = 1
AND MIEMBRO.tipo_miembro IN ('Principal', 'Militar')
GROUP BY DEPARTAMENTO.nombre
ORDER BY total_horas DESC;

--Consulta 3: 
SELECT PROVEEDORES_ARMAMENTO.nombre, COUNT(INVENTARIOS_ARMAS.id) AS cantidad_experimentales
FROM PROVEEDORES_ARMAMENTO
JOIN ARMA_PROVEEDOR ON ARMA_PROVEEDOR.PROVEEDORES_ARMAMENTO_id = PROVEEDORES_ARMAMENTO.id
JOIN INVENTARIOS_ARMAS ON INVENTARIOS_ARMAS.id = ARMA_PROVEEDOR.INVENTARIOS_ARMAS_id
WHERE INVENTARIOS_ARMAS.experimental = 1
GROUP BY PROVEEDORES_ARMAMENTO.nombre
HAVING COUNT(INVENTARIOS_ARMAS.id) >= 1
ORDER BY cantidad_experimentales DESC;

--Consulta 4:
SELECT DEPARTAMENTO.nombre, SUM(MISION.total_horas) AS total_horas
FROM DEPARTAMENTO
JOIN GRUPOS_TRABAJO ON GRUPOS_TRABAJO.DEPARTAMENTO_id = DEPARTAMENTO.id
JOIN MISION ON MISION.GRUPOS_TRABAJO_id = GRUPOS_TRABAJO.id
WHERE MISION.exito = 1
GROUP BY DEPARTAMENTO.nombre
HAVING SUM(MISION.total_horas) > 100
ORDER BY total_horas DESC;

--consulta 5:
SELECT CONCAT(MIEMBRO.primer_nombre, ' ', MIEMBRO.primer_apellido) AS nombre_completo,
COUNT(AMENAZA.id) AS cantidad_reportes
FROM MIEMBRO
JOIN AMENAZA ON AMENAZA.MIEMBRO_id = MIEMBRO.id
WHERE MIEMBRO.tipo_miembro <> 'Civil'
GROUP BY MIEMBRO.id, nombre_completo
HAVING COUNT(AMENAZA.id) > 1
ORDER BY cantidad_reportes DESC;