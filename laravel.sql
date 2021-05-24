-- drop database laravel;
--  create  database laravel;
use laravel;

-- -----------------------------------------------------
-- Table Salas
-- -----------------------------------------------------
DROP TABLE IF EXISTS Salas;
CREATE TABLE IF NOT EXISTS Salas (
  nro_sala_online INT NOT NULL AUTO_INCREMENT,
  capacidad INT NOT NULL,
  PRIMARY KEY (nro_sala_online),
  UNIQUE INDEX nro_sala_online_UNIQUE (nro_sala_online ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table alumnos
-- -----------------------------------------------------
DROP TABLE IF EXISTS alumnos;
CREATE TABLE IF NOT EXISTS alumnos (
  cod_alumno INT NOT NULL AUTO_INCREMENT,
  nombre_alumno VARCHAR(45) NOT NULL,
  apellido_alumno VARCHAR(45) NOT NULL,
  código_curso INT NOT NULL,
  teléfono_alumno VARCHAR(45) NOT NULL,
  PRIMARY KEY (cod_alumno),
  UNIQUE INDEX cod_alumno_UNIQUE (cod_alumno ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table descuentos
-- -----------------------------------------------------
DROP TABLE IF EXISTS descuentos;
CREATE TABLE IF NOT EXISTS descuentos(
  id_descuento INT NOT NULL AUTO_INCREMENT,
  curso VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_descuento),
  UNIQUE INDEX id_descuento_UNIQUE (id_descuento ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table productos
-- -----------------------------------------------------
DROP TABLE IF EXISTS productos;
CREATE TABLE IF NOT EXISTS productos (
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre_curso VARCHAR(120) NOT NULL,
  fecha DATETIME NOT NULL,
  precio INT NOT NULL,
  id_descuento int NOT NULL,
  PRIMARY KEY (id_producto),
  UNIQUE INDEX id_producto_UNIQUE (id_producto ASC),
  INDEX id_descuento_idx (id_descuento ASC),
  CONSTRAINT id_descuento
    FOREIGN KEY (id_descuento)
    REFERENCES descuentos (id_descuento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table carrito
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrito;
CREATE TABLE IF NOT EXISTS carrito (
  id_carrito INT NOT NULL AUTO_INCREMENT,
  id_datos_usuario INT NOT NULL,
  productos INT NOT NULL,
  cantidad INT NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (id_carrito),
  UNIQUE INDEX id_carrito_UNIQUE (id_carrito ASC),
  INDEX id_producto_idx (id_producto ASC),
  CONSTRAINT id_producto
    FOREIGN KEY (id_producto)
    REFERENCES productos (id_producto))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- ----------------------------------------------------
-- Table ciclos
-- -----------------------------------------------------
DROP TABLE IF EXISTS ciclos;
CREATE TABLE IF NOT EXISTS ciclos (
  cod_ciclo INT NOT NULL AUTO_INCREMENT,
  ciclo INT NOT NULL,
  PRIMARY KEY (cod_ciclo),
  UNIQUE INDEX id_ciclo_UNIQUE (cod_ciclo ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS usuarios;
CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nombre_usuario VARCHAR(45) NOT NULL,
  contraseña_usuario VARCHAR(45) NOT NULL,
  código_usuario INT NOT NULL,
  correo_usuario VARCHAR(45) NOT NULL,
  nombre_curso_usuario VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_usuario),
  UNIQUE INDEX id_usuario_UNIQUE (id_usuario ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table horarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS horarios;
CREATE TABLE IF NOT EXISTS horarios (
  id_horario INT NOT NULL AUTO_INCREMENT,
  día datetime NOT NULL,
  hora varchar (80) NOT NULL,
  cod_ciclo INT NOT NULL,
  PRIMARY KEY (id_horario),
  UNIQUE INDEX id_horario_UNIQUE (id_horario ASC),
  INDEX cod_ciclo_idx (cod_ciclo ASC),
  CONSTRAINT cod_ciclo
    FOREIGN KEY (cod_ciclo)
    REFERENCES ciclos (cod_ciclo))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table nivel_idiomas
-- -----------------------------------------------------
DROP TABLE IF EXISTS nivel_idiomas;
CREATE TABLE IF NOT EXISTS nivel_idiomas (
  cod_nivel INT NOT NULL AUTO_INCREMENT,
  nivel INT NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (cod_nivel))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table idiomas
-- -----------------------------------------------------
DROP TABLE IF EXISTS idiomas;
CREATE TABLE IF NOT EXISTS idiomas (
  cod_idioma INT NOT NULL AUTO_INCREMENT ,
  idioma VARCHAR(45) NOT NULL,
  nivel VARCHAR(100) NOT NULL,
  cod_nivel INT NOT NULL,
  PRIMARY KEY (cod_idioma),
  INDEX cod_nivel_idx (cod_nivel ASC),
  CONSTRAINT cod_nivel
    FOREIGN KEY (cod_nivel)
    REFERENCES nivel_idiomas (cod_nivel))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table lista_negra_usuarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS lista_negra_usuarios;
CREATE TABLE IF NOT EXISTS lista_negra_usuarios (
  id_usuario_lista_negra INT NOT NULL AUTO_INCREMENT,
  bloqueado TINYINT NOT NULL,
  eliminado TINYINT NOT NULL,
  Reintegro TINYINT NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_usuario_lista_negra),
  UNIQUE INDEX id_usuario_lista_negra (id_usuario_lista_negra ASC),
  INDEX id_usuario_idx (id_usuario ASC),
  CONSTRAINT id_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table metodo_pagos
-- -----------------------------------------------------
DROP TABLE IF EXISTS metodo_pagos;
CREATE TABLE IF NOT EXISTS metodo_pagos (
  id_metodo_pago INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  efectivo TINYINT NOT NULL,
  tarjeta_credito TINYINT NOT NULL,
  PRIMARY KEY (id_metodo_pago),
  UNIQUE INDEX id_metodo_pago_UNIQUE (id_metodo_pago ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table notas
-- -----------------------------------------------------
DROP TABLE IF EXISTS notas;
CREATE TABLE IF NOT EXISTS notas (
  id_notas INT NOT NULL AUTO_INCREMENT,
  nota1 DECIMAL  NOT NULL,
  nota2 DECIMAL  NOT NULL,
  nota3 DECIMAL NOT NULL,
  parcial DECIMAL  NOT NULL,
  nota_final DECIMAL  NOT NULL,
  estado VARCHAR(80) NOT NULL,
  cod_alumno INT NOT NULL,
  cod_nivel INT NOT NULL,
  PRIMARY KEY (id_notas),
  UNIQUE INDEX id_notas (id_notas ASC),
  INDEX cod_alumno_idx (cod_alumno ASC),
  INDEX cod_nivel_idx (cod_nivel ASC),
  CONSTRAINT cod_alumno1
    FOREIGN KEY (cod_alumno)
    REFERENCES alumnos (cod_alumno),
  CONSTRAINT cod_nivel0
    FOREIGN KEY (cod_nivel)
    REFERENCES nivel_idiomas (cod_nivel))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table pagos
-- -----------------------------------------------------
DROP TABLE IF EXISTS pagos;
CREATE TABLE IF NOT EXISTS pagos (
  id_pago INT NOT NULL AUTO_INCREMENT,
  id_alumno INT NOT NULL,
  cvv INT NOT NULL,
  PRIMARY KEY (id_pago),
  UNIQUE INDEX id_pago_UNIQUE (id_pago ASC),
  INDEX id_alumno_idx (id_alumno ASC),
  CONSTRAINT id_alumno
    FOREIGN KEY (id_alumno)
    REFERENCES alumnos (cod_alumno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table profesores
-- -----------------------------------------------------
DROP TABLE IF EXISTS profesores;
CREATE TABLE IF NOT EXISTS profesores (
  cod_profesor INT NOT NULL AUTO_INCREMENT,
  nombre_profesor VARCHAR(45) NOT NULL,
  correo_profesor VARCHAR(45) NOT NULL,
  teléfono_profesor VARCHAR(45) NOT NULL,
  dirección_profesor VARCHAR(45) NOT NULL,
  cod_idioma INT NOT NULL,
  PRIMARY KEY (cod_profesor),
  UNIQUE INDEX cod_profesor_UNIQUE (cod_profesor ASC),
  INDEX cod_idioma_idx (cod_idioma ASC),
  CONSTRAINT cod_idioma
    FOREIGN KEY (cod_idioma)
    REFERENCES idiomas (cod_idioma))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table cursos
-- -----------------------------------------------------
DROP TABLE IF EXISTS cursos;
CREATE TABLE IF NOT EXISTS cursos (
  id_curso INT NOT NULL AUTO_INCREMENT,
  cod_idioma INT NOT NULL,
  nro_sala_online INT NOT NULL,
  cod_profesor INT NOT NULL,
  id_horario INT NOT NULL,
  cod_ciclo INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  dirección VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_curso),
  INDEX id_horario_idx (id_horario ASC),
  INDEX nro_sala_online_idx (nro_sala_online ASC),
  INDEX cod_profesor_idx (cod_profesor ASC),
  INDEX cod_ciclo_idx (cod_ciclo ASC),
  INDEX cod_idioma_idx (cod_idioma ASC),
  CONSTRAINT cod_ciclo1
    FOREIGN KEY (cod_ciclo)
    REFERENCES ciclos (cod_ciclo),
  CONSTRAINT cod_idioma1
    FOREIGN KEY (cod_idioma)
    REFERENCES idiomas (cod_idioma),
  CONSTRAINT cod_profesor
    FOREIGN KEY (cod_profesor)
    REFERENCES profesores (cod_profesor),
  CONSTRAINT id_horario
    FOREIGN KEY (id_horario)
    REFERENCES horarios (id_horario),
  CONSTRAINT nro_sala_online
    FOREIGN KEY (nro_sala_online)
    REFERENCES Salas (nro_sala_online))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table residencias
-- -----------------------------------------------------
DROP TABLE IF EXISTS residencias;
CREATE TABLE IF NOT EXISTS residencias (
  id_residencia INT NOT NULL AUTO_INCREMENT,
  residencia VARCHAR(100) NOT NULL,
  cod_alumno INT NOT NULL,
  PRIMARY KEY (id_residencia),
  UNIQUE INDEX id_residencia_UNIQUE (id_residencia ASC),
  INDEX cod_alumno_idx (cod_alumno ASC),
  CONSTRAINT cod_alumno
    FOREIGN KEY (cod_alumno)
    REFERENCES alumnos (cod_alumno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table Temarios
-- -----------------------------------------------------
DROP TABLE IF EXISTS Temarios;
CREATE TABLE IF NOT EXISTS Temarios (
  id_Temario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  texto VARCHAR(45) NOT NULL,
  idioma VARCHAR(45) NOT NULL,
  usuarios_id_usuario INT NOT NULL,
  id_curso INT NOT NULL,
  PRIMARY KEY (id_Temario),
  UNIQUE INDEX id_Temario_UNIQUE (id_Temario ASC),
  INDEX fk_Temarios_usuarios1_idx (usuarios_id_usuario ASC),
  INDEX id_curso_idx (id_curso ASC),
  CONSTRAINT fk_Temarios_usuarios1
    FOREIGN KEY (usuarios_id_usuario)
    REFERENCES usuarios (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_curso
    FOREIGN KEY (id_curso)
    REFERENCES cursos (id_curso)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table  ordenes
-- -----------------------------------------------------
DROP TABLE IF EXISTS  ordenes;
CREATE TABLE IF NOT EXISTS ordenes (
  id_orden INT NOT NULL AUTO_INCREMENT,
  id_alumno INT NOT NULL,
  id_carrito INT NOT NULL,
  id_pago INT NOT NULL,
  id_metodo_pago INT NOT NULL,
  total INT NOT NULL,
  PRIMARY KEY (id_orden),
  UNIQUE INDEX id_orden_UNIQUE (id_orden ASC),
  INDEX id_alumno_idx (id_alumno ASC),
  INDEX id_carrito_idx (id_carrito ASC),
  INDEX id_pago_idx (id_pago ASC) ,
  INDEX id_metodo_pago_idx (id_metodo_pago ASC),
  CONSTRAINT id_alumno1
    FOREIGN KEY (id_alumno)
    REFERENCES alumnos (cod_alumno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_carrito
    FOREIGN KEY (id_carrito)
    REFERENCES carrito (id_carrito)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_pago
    FOREIGN KEY (id_pago)
    REFERENCES pagos (id_pago)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_metodo_pago
    FOREIGN KEY (id_metodo_pago)
    REFERENCES metodo_pagos (id_metodo_pago)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


<<<<<<< HEAD
   insert into `laravel`.`datos_usuarios` (nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario, id_usuario_lista_negra) values ('Ruddy', 'Bb2XOXPSNR', 1, 'rtixall0@wsj.com', 'frances', 1),
  ('Daphna', '8FfjJjPxB', 2, 'dsambeck1@yahoo.co.jp', 'ingles', 2), ('Kenon', 'XsKv2Kvj', 3, 'kguirardin2@senate.gov', 'frances', 3), ('Shela', 'LCh9wD', 4, 'spartener3@instagram.com', 'ingles', 4),
  ('Bord', 'Aymiysa9Zit1', 5, 'bigonet4@i2i.jp', 'español', 5), ('Clare', 'n0Udll9kg7i', 6, 'cblomefield5@seattletimes.com', 'catalan', 6), ('Avigdor', 'hQefYoA1bNz', 7, 'aipgrave6@spotify.com', 'frances', 7),
  ('Silvan', 'wfFpF4', 8, 'spenman7@bizjournals.com', 'español', 8), ('Troy', 'zaBCLzB0F', 9, 'tpecht8@irs.gov', 'español', 9), ('Myrwyn', 'k71yV9HqA', 10, 'mtrewman9@issuu.com', 'español', 10),
  ('Hendrick', '4wFtWofk8', 11, 'hhecksa@springer.com', 'español', 11), ('Randee', '6obRmfUG9Lzc', 12, 'rdelhantyb@technorati.com', 'catalan', 12), ('Jarrad', 'sm1dQR', 13, 'jmumbesonc@about.me', 'catalan', 13), 
  ('Lib', 'RRhstnZ1AMX0', 14, 'layrsd@spotify.com', 'ingles', 14), ('Roxi', 'KseKE5Ni', 15, 'rdenere@nasa.gov', 'frances', 15), ('Dalton', 'Fc2aj9Q8', 16, 'dkrzyzanowskif@aol.com', 'español', 16),
  ('Bessy', 'I9KsxqpMYQ', 17, 'bmarrillg@flavors.me', 'ingles', 17), ('Janetta', 'lMrtnLtIscN', 18, 'jbaintonh@dmoz.org', 'ingles', 18), ('Cammy', 'gGZcvWrp9OoK', 19, 'chanshawi@imdb.com', 'ingles', 19),
  ('Toddy', 'NGyX5e', 20, 'twinterscalej@home.pl', 'frances', 20), ('Claudette', 'ZKhaCQ3qbL0', 21, 'ctudork@jimdo.com', 'frances', 21), ('Sauveur', 'jxs0L1RF8m', 22, 'sturmell@istockphoto.com', 'catalan', 22),
  ('Kelvin', 'tUxgu7UmA', 23, 'kmouldm@hatena.ne.jp', 'frances', 23), ('Antonie', '2YkPxZ', 24, 'aviantn@cornell.edu', 'frances', 24), ('Valentia', '8tMtsno', 25, 'vabbso@pagesperso-orange.fr', 'español', 25);
  
 insert into `laravel`.`programación_cursos` (cod_idiomas, nro_sala_online, cod_profesor, cod_nivel_idioma, id_horario, cod_ciclo, id_usuario) values (1, 1, 1, 1, '12:23 PM', 1, 1),
 (2, 2, 2, 2, '11:45 AM', 2, 2), (3, 3, 3, 3, '11:01 AM', 3, 3), (4, 4, 4, 4, '5:19 AM', 4, 4), (5, 5, 5, 5, '7:17 PM', 5, 5), (6, 6, 6, 6, '1:18 AM', 6, 6),
 (7, 7, 7, 7, '9:50 AM', 7, 7), (8, 8, 8, 8, '12:23 PM', 8, 8), (9, 9, 9, 9, '3:29 PM', 9, 9), (10, 10, 10, 10, '7:22 PM', 10, 10), (11, 11, 11, 11, '12:25 AM', 11, 11),
 (12, 12, 12, 12, '4:41 AM', 12, 12), (13, 13, 13, 13, '2:43 AM', 13, 13), (14, 14, 14, 14, '1:03 AM', 14, 14), (15, 15, 15, 15, '2:18 AM', 15, 15),
 (16, 16, 16, 16, '11:55 AM', 16, 16), (17, 17, 17, 17, '10:26 AM', 17, 17), (18, 18, 18, 18, '6:38 AM', 18, 18), (19, 19, 19, 19, '9:53 AM', 19, 19),
 (20, 20, 20, 20, '7:49 AM', 20, 20), (21, 21, 21, 21, '11:39 AM', 21, 21), (22, 22, 22, 22, '10:54 AM', 22, 22), (23, 23, 23, 23, '1:47 AM', 23, 23),
 (24, 24, 24, 24, '3:34 PM', 24, 24), (25, 25, 25, 25, '8:36 AM', 25, 25);
 
insert into `laravel`.`alumnos` (id_residencia, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno, dirección_alumno) values (1, 'Zsazsa', 'Liles', 1, '727-827-5594', '5 Canary Drive'),
 (2, 'Curtis', 'Beazer', 2, '593-408-8485', '734 Straubel Road'), (3, 'Reade', 'Robroe', 3, '569-883-3959', '81023 Daystar Crossing'), (4, 'Ivie', 'De Lisle', 4, '346-204-0106', '8 Arapahoe Street'),
 (5, 'Demetria', 'Henke', 5, '604-227-0167', '7220 Schlimgen Park'), (6, 'Nara', 'Dumelow', 6, '945-729-53 ', '38 Pankratz Junction'), (7, 'Arnold', 'Denziloe', 7, '576-711-3923', '37686 Wayridge Alley'),
 (8, 'Antonia', 'Tiffney', 8, '386-431-7231', '13 Delladonna Pass'), (9, 'Nicolette', 'Alabaster', 9, '670-393-5934', '788 Hudson Hill'), (10, 'Sterne', 'Petrusch', 10, '152-112-0616', '7971 Hallows Street'),
 (11, 'Dredi', 'Defond', 11, '674-646-3557', '455 Cascade Circle'), (12, 'Jaye', 'Weadick', 12, '271-298-7089', '1432 Transport Street'), (13, 'Timofei', 'McAirt', 13, '587-7 -2307', '877 Saint Paul Pass'),
 (14, 'Jacobo', 'Lindeboom', 14, '365-330-9748', '0 Utah Street'), (15, 'Alejoa', 'Heister', 15, '580-429-6190', '89034 Ramsey Court'), (16, 'Casandra', 'Waggatt', 16, '773-722-7179', '6 Hanson Alley'),
 (17, 'Winnah', 'Cullinan', 17, '423-881-6214', '068 Tennyson Terrace'), (18, 'Leslie', 'Gunnell', 18, '225-167-8594', '05116 Troy Alley'), (19, 'Immanuel', 'Minter', 19, '671-236-6523', '5 Kim Lane'),
 (20, 'Rosalia', 'Vinnick', 20, '324-233-8785', '71849 Harper Junction'), (21, 'Wyndham', 'Mussetti', 21, '930-520-4233', '94343 Brown Road'), (22, 'Rustie', 'Scanlan', 22, '695-409-2219', '5 Armistice Trail'),
 (23, 'Minta', 'Janjusevic', 23, '683-439-3730', '0 Elka Road'), (24, 'Jared', 'McCauley', 24, '879-396-7889', '18516 Bartillon Street'), (25, 'Edsel', 'Skerritt', 25, '102-276-3547', '1592 Walton Junction');
 
insert into MOCK_DATA (ciclo) values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (17), (18), (19),
(20), (21), (22), (23), (24), (25);
 
insert into `laravel`.`nivel_idiomas` (nivel, fecha) values (1, '6/4/2021'),
 (2, '10/10/2020'), (3, '9/10/2021'), (4, '2/14/2022'), (5, '8/12/2021'),
 (6, '1/16/2021'), (7, '3/5/2022'), (8, '1/5/2021'), (9, '6/11/2021'),
 (10, '5/9/2020'), (11, '11/23/2021'), (12, '2/8/2022'), (13, '7/6/2020'),
 (14, '11/2/2020'), (15, '7/19/2021'), (16, '1/27/2021'), (17, '6/23/2021'),
 (18, '7/7/2020'), (19, '5/24/2021'), (20, '1/27/2022'), (21, '2/25/2021'),
 (22, '7/29/2021'), (23, '1/6/2021'), (24, '12/9/2021'), (25, '12/14/2020');
 
 insert into `laravel`.`notas` (nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno, cod_idioma, cod_nivel, id_residencia) values (7.87, 9.98, 7.24, 6.2, 2.33, 'Aprobado', 1, 1, 1, 1),
 (5.46, 9.88, 5.41, 9.79, 8.67, 'Aprobado', 2, 2, 2, 2), (2.63, 4.74, 5.53, 7.55, 6.2, 'Aprobado', 3, 3, 3, 3), (6.64, 8.34, 8.94, 5.34, 1.93, 'Aprobado', 4, 4, 4, 4),
 (0.14, 7.32, 2.1, 6.15, 0.05, 'Reprobado', 5, 5, 5, 5), (6.01, 4.59, 3.36, 3.59, 0.57, 'Aprobado', 6, 6, 6, 6), (8.46, 4.62, 1.99, 8.95, 3.93, 'Aprobado', 7, 7, 7, 7),
 (2.07, 8.21, 2.14, 9.23, 2.26, 'Reprobado', 8, 8, 8, 8), (2.97, 1.89, 2.97, 5.3, 8.21, 'Aprobado', 9, 9, 9, 9), (0.8, 8.3, 0.74, 3.95, 5.56, 'Aprobado', 10, 10, 10, 10),
 (5.43, 0.95, 5.31, 9.73, 9.87, 'Aprobado', 11, 11, 11, 11), (6.33, 1.01, 8.81, 6.52, 3.49, 'Aprobado', 12, 12, 12, 12), (5.67, 3.56, 7.84, 7.89, 2.74, 'Aprobado', 13, 13, 13, 13),
 (6.12, 1.57, 5.94, 1.6, 3.31, 'Aprobado', 14, 14, 14, 14), (8.32, 1.6, 8.89, 0.64, 5.91, 'Reprobado', 15, 15, 15, 15), (1.7, 6.45, 5.46, 6.91, 2.31, 'Reprobado', 16, 16, 16, 16),
 (5.98, 0.29, 6.03, 0.72, 6.56, 'Reprobado', 17, 17, 17, 17), (3.7, 0.8, 6.13, 5.04, 3.42, 'Reprobado', 18, 18, 18, 18), (2.69, 7.11, 9.01, 1.54, 2.09, 'Aprobado', 19, 19, 19, 19),
 (6.08, 0.37, 5.83, 2.89, 7.71, 'Aprobado', 20, 20, 20, 20), (2.45, 0.11, 7.49, 5.17, 0.67, 'Reprobado', 21, 21, 21, 21), (0.25, 1.03, 7.18, 2.73, 4.33, 'Reprobado', 22, 22, 22, 22),
 (8.49, 2.33, 9.47, 8.34, 4.79, 'Aprobado', 23, 23, 23, 23), (7.79, 6.89, 5.18, 5.23, 8.02, 'Aprobado', 24, 24, 24, 24), (6.55, 9.22, 0.29, 8.1, 2.99, 'Reprobado', 25, 25, 25, 25);
  
=======
 (23, 'Minta', 'Janjusevic', 23, '683-439-3730', '00 Elka Road'), (24, 'Jared', 'McCauley', 24, '879-396-7889', '18516 Bartillon Street'), (25, 'Edsel', 'Skerritt', 25, '102-276-3547', '1592 Walton Junction');
 
 -- insterts de la tabla lista_negra_usuarios --
=======
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla metodo_pagos
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Luisa', 'Martinez', 'luisamartinez@gmai.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Camila', 'Moreno', 'camilaOrtiz@gmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Juan', 'Becerra', 'juanbecerra@hotmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Lorduy', 'Peréz', 'Lorduyperez01@gmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Rosa', 'Solorzano', 'Rosasolor@hotmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Claudia', 'Cortes', 'claudiacortes05@hotmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Samuel', 'Cardona', 'samuelcardona02@gmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Manuel', 'Monsalve', 'manuel02monsalve@hotmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Uriel', 'Martinez', 'urielmartinez@gmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Monica', 'Monserrat', 'monica02monserrat@hotmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Guadalupe', 'Lopéz', 'guadalupe09@gmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Alejandra', 'Peréz', 'aeljandrap@gmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Nevin', 'Brompton', 'nbromptonc@gmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Danielle', 'Oglevie', 'doglevied@gmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Melosa', 'Parris', 'mparrise@hotmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Carina', 'Guye', 'cguyef@gmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Brandon', 'Sanchez', 'bjanczakg@hotmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Bernete', 'Delue', 'bdelueh@gmail.com' , true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Jobey', 'Durram', 'jdurrami@gmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ( 'Dayanna', 'Ortiz', 'DayannaOrtiz@gmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Laura', 'Saénz', 'laurasaeco@gmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Camila', 'Cortes', 'camilacortes05@hotmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Angie', 'Castro', 'angiecastro02@hotmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Sebastian', 'Monsalve', 'sebastianMonsalve02@gmail.com',false,true);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Sergio', 'Morales', 'SergioMorales010@hotmail.com', true,false);
insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values ('Sergio', 'Morales', 'SergioMorales010@hotmail.com',false,true);
>>>>>>> 9b26682502e3fbbf32bde9cd8c52fea76a6a66c5


-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla salas
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into Salas (nro_sala_online, capacidad) values (1, 15);
insert into Salas (nro_sala_online, capacidad) values (2, 19);
insert into Salas (nro_sala_online, capacidad) values (3, 4);
insert into Salas (nro_sala_online, capacidad) values (4, 29);
insert into Salas (nro_sala_online, capacidad) values (5, 23);
insert into Salas (nro_sala_online, capacidad) values (6, 27);
insert into Salas (nro_sala_online, capacidad) values (7, 11);
insert into Salas (nro_sala_online, capacidad) values (8, 5);
insert into Salas (nro_sala_online, capacidad) values (9, 1);
insert into Salas (nro_sala_online, capacidad) values (10, 28);
insert into Salas (nro_sala_online, capacidad) values (11, 3);
insert into Salas (nro_sala_online, capacidad) values (12, 27);
insert into Salas (nro_sala_online, capacidad) values (13, 20);
insert into Salas (nro_sala_online, capacidad) values (14, 12);
insert into Salas (nro_sala_online, capacidad) values (15, 14);
insert into Salas (nro_sala_online, capacidad) values (16, 12);
insert into Salas (nro_sala_online, capacidad) values (17, 26);
insert into Salas (nro_sala_online, capacidad) values (18, 13);
insert into Salas (nro_sala_online, capacidad) values (19, 30);
insert into Salas (nro_sala_online, capacidad) values (20, 19);
insert into Salas (nro_sala_online, capacidad) values (21, 11);
insert into Salas (nro_sala_online, capacidad) values (22, 15);
insert into Salas (nro_sala_online, capacidad) values (23, 1);
insert into Salas (nro_sala_online, capacidad) values (24, 21);
insert into Salas (nro_sala_online, capacidad) values (25, 21);

-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla alumnos
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (1, 'Camila', 'Ceballos', 1, '+62 (605) 527-2268');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (2, 'Juan', 'Ortiz', 2, '+680 (512) 689-3283');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (3, 'Alejandro', 'Cortes', 3, '+98 (885) 962-3358');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (4, 'Jordan', 'Cruz', 4, '+48 (399) 644-7153');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (5, 'Byron', 'Suaréz', 5, '+1 (516) 543-3007');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (6, 'Camilo', 'Due', 6, '+7 (937) 471-5039');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (7, 'Dayanna', 'Varón', 7, '+57 (390) 761-6913');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (8, 'Esteban', 'Oris', 8, '+63 (694) 273-0705');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (9, 'Felipe', 'Tapia', 9, '+86 (717) 443-5351');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (10, 'Gabriela', 'Sierra', 10, '+81 (533) 818-4537');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (11, 'Hernan', 'Torres', 11, '+86 (843) 317-5841');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (12, 'Iris', 'Martinez', 12, '+86 (622) 303-4569');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (13, 'Juno', 'Ortiz', 13, '+86 (966) 256-3421');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (14, 'Katherine', 'Villa', 14, '+62 (690) 102-5151');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (15, 'Laura', 'Montaner', 15, '+598 (461) 952-1630');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (16, 'María', 'Monsalve', 16, '+46 (389) 543-2781');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (17, 'Nicolas', 'Estupiñan', 17, '+86 (604) 149-3922');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (18, 'Gabriela', 'Osorio', 18, '+94 (511) 253-6916');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (19, 'Pamela', 'Burgos', 19, '+46 (864) 113-8975');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (20, 'Rosa', 'Manrique', 20, '+7 (335) 963-3851');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (21, 'Tatiana', 'Salinas', 21, '+62 (371) 446-2295');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (22, 'Andrea', 'Montes', 22, '+86 (110) 506-6243');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (23, 'Cristina', 'Cruz', 23, '+507 (382) 907-0492');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (24, 'Dylan', 'Torres', 24, '+63 (782) 614-2565');
insert into alumnos (cod_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values (25, 'Angie', 'Castro', 25, '+54 (389) 220-2089');

-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla descuentos
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into descuentos (id_descuento, curso) values (1, 'Inglés');
insert into descuentos (id_descuento, curso) values (2, 'Catalán');
insert into descuentos (id_descuento, curso) values (3, 'Francés');
insert into descuentos (id_descuento, curso) values (4, 'Catalán');
insert into descuentos (id_descuento, curso) values (5, 'Inglés');
insert into descuentos (id_descuento, curso) values (6, 'Inglés');
insert into descuentos (id_descuento, curso) values (7, 'Francés');
insert into descuentos (id_descuento, curso) values (8, 'Francés');
insert into descuentos (id_descuento, curso) values (9, 'Inglés');
insert into descuentos (id_descuento, curso) values (10, 'Catalán');
insert into descuentos (id_descuento, curso) values (11, 'Francés');
insert into descuentos (id_descuento, curso) values (12, 'Inglés');
insert into descuentos (id_descuento, curso) values (13, 'Catalán');
insert into descuentos (id_descuento, curso) values (14, 'Francés');
insert into descuentos (id_descuento, curso) values (15, 'Francés');
insert into descuentos (id_descuento, curso) values (16, 'Catalán');
insert into descuentos (id_descuento, curso) values (17, 'Inglés');
insert into descuentos (id_descuento, curso) values (18, 'Inglés');
insert into descuentos (id_descuento, curso) values (19, 'Francés');
insert into descuentos (id_descuento, curso) values (20, 'Catalán');
insert into descuentos (id_descuento, curso) values (21, 'Inglés');
insert into descuentos (id_descuento, curso) values (22, 'Inglés');
insert into descuentos (id_descuento, curso) values (23, 'Catalán');
insert into descuentos (id_descuento, curso) values (24, 'Francés');
insert into descuentos (id_descuento, curso) values (25, 'Catalán');
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla productos
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into productos (id_producto, nombre_curso, fecha, precio , id_descuento) values (1, 'Inglés', '2020-09-20', 340,1);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (2, 'Francés', '2021-04-14', 340,2);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (3, 'Catalán', '2020-01-09', 340,3);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (4, 'Francés', '2020-09-27', 340,4);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (5, 'Catalán', '2020-01-12', 340,5);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (6, 'Francés', '2021-03-04', 340,6);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (7, 'Catalán', '2021-03-05', 340,7);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (8, 'Francés', '2021-02-19', 340,8);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (9, 'Catalán', '2021-06-15', 340,9);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (10, 'Catalán', '2020-10-11',340,10);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (11, 'Francés', '2021-06-10', 340,11);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (12, 'Catalán', '2021-04-17', 340,12);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (13, 'Francés', '2021-05-24', 340,13);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (14, 'Catalán', '2020-12-30', 340,14);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (15, 'Inglés', '2021-03-28', 340,15);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (16, 'Catalán', '2021-02-23', 340,16);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (17, 'Inglés', '2021-02-25', 340,17);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (18, 'Catalán', '2021-02-04', 340,18);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (19, 'Catalán', '2020-10-14', 340,19);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (20, 'Inglés', '2021-05-21', 340,20);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (21, 'Inglés', '2020-09-09', 340,21);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (22, 'Catalán', '2020-12-31', 340,22);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (23, 'Inglés', '2020-08-12', 340,23);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (24, 'Inglés', '2021-01-09', 340,24);
insert into productos (id_producto, nombre_curso, fecha, precio,id_descuento) values (25, 'Inglés', '2020-09-23', 340,25);

-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla carrito
-- --------------------------------------------------------------------------------------------------------------------------------------

insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (1, 1, 1, 2, 1);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (3, 3, 1, 1, 3);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (4, 4, 1, 1, 4);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (5, 5, 1, 1, 5);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (6, 6, 1, 2, 6);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (7, 7, 1, 1, 7);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (8, 8, 1, 1, 8);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (9, 9, 1, 1, 9);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (10, 10, 1, 1, 10);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (11, 11, 1, 2, 11);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (12, 12, 1, 1, 12);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (13, 13, 1, 1, 13);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (14, 14, 1, 1, 14);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (15, 15, 1, 2, 15);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (16, 16, 1, 2, 16);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (17, 17, 1, 1, 17);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (18, 18, 1, 1, 18);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (19, 19, 1, 1, 19);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (20, 20, 1, 2, 20);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (21, 21, 1, 2, 21);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (22, 22, 1, 2, 22);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (23, 23, 1, 2, 23);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (24, 24, 1, 2, 24);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (25, 25, 1, 1, 25);
insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values (26, 25, 1, 1, 25);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla ciclos
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into ciclos (cod_ciclo, ciclo) values (1, 1);
insert into ciclos (cod_ciclo, ciclo) values (2, 1);
insert into ciclos (cod_ciclo, ciclo) values (3, 1);
insert into ciclos (cod_ciclo, ciclo) values (4, 2);
insert into ciclos (cod_ciclo, ciclo) values (5, 2);
insert into ciclos (cod_ciclo, ciclo) values (6, 2);
insert into ciclos (cod_ciclo, ciclo) values (7, 1);
insert into ciclos (cod_ciclo, ciclo) values (8, 1);
insert into ciclos (cod_ciclo, ciclo) values (9, 1);
insert into ciclos (cod_ciclo, ciclo) values (10, 1);
insert into ciclos (cod_ciclo, ciclo) values (11, 1);
insert into ciclos (cod_ciclo, ciclo) values (12, 1);
insert into ciclos (cod_ciclo, ciclo) values (13, 1);
insert into ciclos (cod_ciclo, ciclo) values (14, 1);
insert into ciclos (cod_ciclo, ciclo) values (15, 1);
insert into ciclos (cod_ciclo, ciclo) values (16, 1);
insert into ciclos (cod_ciclo, ciclo) values (17, 1);
insert into ciclos (cod_ciclo, ciclo) values (18, 1);
insert into ciclos (cod_ciclo, ciclo) values (19, 1);
insert into ciclos (cod_ciclo, ciclo) values (20, 2);
insert into ciclos (cod_ciclo, ciclo) values (21, 2);
insert into ciclos (cod_ciclo, ciclo) values (22, 2);
insert into ciclos (cod_ciclo, ciclo) values (23, 2);
insert into ciclos (cod_ciclo, ciclo) values (24, 2);
insert into ciclos (cod_ciclo, ciclo) values (25, 1);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla usuarios
-- ------------------------------------------------------------------------------------------------------------------------------------

insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (1, 'Camila', 'Ceballos', 1, 'CamilaCeballos@tuidioma.com', 'CamilaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (2, 'Alejandro', 'Cortes', 2, 'AlejandroCortes07@tuidioma.com', 'AlejandroIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (3, 'Jordan', 'Cruz', 3, 'JordanCruz892@tuidioma.com', 'JordanIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (4, 'Byron', 'Suaréz', 4, 'Byron2Suarez@tuidioma.com', 'ByronIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (5, 'Camilo', 'Due', 5, 'Camilodue4@tuidioma.com', 'CamiloIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (6, 'Dayanna', 'Varón', 6, 'Dayannavaron567@tuidioma.com', 'DayannaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (7, 'Esteban', 'Oris', 7, 'EstebanOris096@tuidioma.com', 'EstebanIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (8, 'Felipe', 'Tapia', 8, 'FelipeTapia09@tuidioma.com', 'FelipeIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (9, 'Gabriela', 'Sierra', 9, 'vdemeter8@tuidioma.com', 'gabrielaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (10, 'Hernan', 'Torres', 10, 'spepye9@tuidioma.com', 'HernanIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (11, 'Iris', 'Martinez', 11, 'akenwarda@tuidioma.com', 'IrisIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (12, 'Juno', 'Ortiz', 12, 'junoortiz09@tuidioma.com', 'JunoIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (13, 'Katherine', 'Villa', 13, 'katherine0907@gtuidioma.com', 'katherienIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (14, 'Laura', 'Montaner', 14, 'LauraMonstaner04@tuidioma.com', 'LauraIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (15, 'Pablo', 'Dybala', 15, 'Profesor_Pablo_Dybala@tuidioma.com', 'Profesor_Dybala');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (16, 'Alicia', 'Chancey', 16, 'Profesora_Alicia_Chancey@tuidioma.com', 'Profesora_Alicia');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (17, 'Camila', 'Diaz', 17, 'Profesora_Camila_Diaz@tuidioma.com', 'Profesora_Camila');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (18, 'Gabriela', 'Osorio', 18, 'gabrielaosorio0@tuidioma.com', 'gabrielaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (19, 'Pamela', 'Burgos', 19, 'pamelaburgos00@tuidioma.com', 'PamelaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (20, 'Rosa', 'Manrique', 20, 'rosa_manrique@tuidioma.com', 'RosaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (21, 'Tatiana', 'Salinas', 21, 'Tatianaasalinas@tuidioma.com', 'TatianaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (22, 'Andrea', 'Montes', 22, 'AndreaaaMontes@tuidioma.com', 'Andreaidioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (23, 'Cristina', 'Cruz', 23, 'Cristinacruz09@tuidioma.com', 'CristinaIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (24, 'Dylan', 'Torres', 24, 'DylanTorres@tuidioma.com', 'DylanIdioma');
insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values (25, 'Angie', 'Castro', 25, 'Angie07castroo@tuidioma.com', 'AngieIdioma');

-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla horarios
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into horarios (id_horario, día, hora, cod_ciclo) values (1, '2021-04-16', '3:00 pm - 9:00 pm', 1);
insert into horarios (id_horario, día, hora, cod_ciclo) values (2, '2021-06-06', '9:00 am - 3:00 pm', 2);
insert into horarios (id_horario, día, hora, cod_ciclo) values (3, '2020-11-15', '3:00 pm - 9:00 pm', 3);
insert into horarios (id_horario, día, hora, cod_ciclo) values (4, '2020-09-27', '9:00 am - 3:00 pm', 4);
insert into horarios (id_horario, día, hora, cod_ciclo) values (5, '2021-04-04', '3:00 pm - 9:00 pm', 5);
insert into horarios (id_horario, día, hora, cod_ciclo) values (6, '2020-12-17', '9:00 am - 3:00 pm', 6);
insert into horarios (id_horario, día, hora, cod_ciclo) values (7, '2020-08-12', '9:00 am - 3:00 pm', 7);
insert into horarios (id_horario, día, hora, cod_ciclo) values (8, '2020-11-20', '3:00 pm - 9:00 pm', 8);
insert into horarios (id_horario, día, hora, cod_ciclo) values (9, '2020-12-31', '9:00 am - 3:00 pm', 9);
insert into horarios (id_horario, día, hora, cod_ciclo) values (10, '2021-01-06', '3:00 pm - 9:00 pm', 10);
insert into horarios (id_horario, día, hora, cod_ciclo) values (11, '2021-02-16', '9:00 am - 3:00 pm', 11);
insert into horarios (id_horario, día, hora, cod_ciclo) values (12, '2020-12-16', '3:00 pm - 9:00 pm', 12);
insert into horarios (id_horario, día, hora, cod_ciclo) values (13, '2021-2-17', '9:00 am - 3:00 pm', 13);
insert into horarios (id_horario, día, hora, cod_ciclo) values (14, '2021-05-10', '3:00 pm - 9:00 pm', 14);
insert into horarios (id_horario, día, hora, cod_ciclo) values (15, '2021-06-12', '3:00 pm - 9:00 pm', 15);
insert into horarios (id_horario, día, hora, cod_ciclo) values (16, '2021-05-08', '9:00 am - 3:00 pm', 16);
insert into horarios (id_horario, día, hora, cod_ciclo) values (17, '2020-10-27', '3:00 pm - 9:00 pm', 17);
insert into horarios (id_horario, día, hora, cod_ciclo) values (18, '2021-06-19', '9:00 am - 3:00 pm', 18);
insert into horarios (id_horario, día, hora, cod_ciclo) values (19, '2021-02-25', '3:00 pm - 9:00 pm', 19);
insert into horarios (id_horario, día, hora, cod_ciclo) values (20, '2020-09-28', '9:00 am - 3:00 pm', 20);
insert into horarios (id_horario, día, hora, cod_ciclo) values (21, '2021-05-09', '3:00 pm - 9:00 pm', 21);
insert into horarios (id_horario, día, hora, cod_ciclo) values (22, '2020-11-11', '3:00 pm - 9:00 pm', 22);
insert into horarios (id_horario, día, hora, cod_ciclo) values (23, '2021-03-06', '3:00 pm - 9:00 pm', 23);
insert into horarios (id_horario, día, hora, cod_ciclo) values (24, '2021-01-14', '9:00 am - 3:00 pm', 24);
insert into horarios (id_horario, día, hora, cod_ciclo) values (25, '2021-04-09', '9:00 am - 3:00 pm', 25);

-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla nivel_idiomas
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (1, 1, '2020-11-11');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (2, 1, '2021-05-09');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (3, 1, '2020-09-28');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (4, 1, '2020-10-23');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (5, 2, '2021-02-25');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (6, 2, '2021-06-19');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (7, 1, '2020-10-27');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (8, 1, '2021-05-08');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (9, 1, '2020-10-27');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (10, 1, '2021-05-08');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (11, 1, '2021-06-12');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (12, 2, '2021-05-10');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (13, 2, '2021-2-17');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (14, 2, '2020-12-16');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (15, 2, '2021-02-16');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (16, 2, '2021-01-06');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (17, 2, '2020-12-31');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (18, 1, '2020-11-20');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (19, 1, '2020-08-12');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (20, 2, '2020-12-17');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (21, 2, '2021-04-04');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (22, 1, '2020-09-27');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (23, 2, '2021-01-14');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (24, 2, '2021-03-06');
insert into nivel_idiomas (cod_nivel, nivel, fecha) values (25, 2, '2021-04-09');
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert idiomas
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (1, 'Inglés', 'Avanzado', 1);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (2, 'Francés', 'Medio', 2);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (3, 'Catalán', 'Principiante', 3);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (4, 'Francés', 'Medio', 4);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (5, 'Catalán', 'Principiante', 5);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (6, 'Catalán', 'Principiante', 6);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (7, 'Francés', 'Medio', 7);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (8, 'Francés', 'Medio', 8);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (9, 'Francés', 'Principiante', 9);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (10, 'Catalán', 'Principiante', 10);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (11, 'Catalán', 'Medio', 11);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (12, 'Inglés', 'Medio', 12);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (13, 'Nataniel', 'Medio', 13);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (14, 'Inglés', 'Avanzado', 14);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (15, 'Francés', 'Avanzado', 15);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (16, 'Catalán', 'Avanzado', 16);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (17, 'Catalán', 'Avanzado', 17);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (18, 'Inglés', 'Avanzado', 18);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (19, 'Catalán', 'Principiante', 19);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (20, 'Inglés', 'Principiante', 20);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (21, 'Catalán', 'Avanzado', 21);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (22, 'Catalán', 'Medio', 22);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (23, 'Inglés', 'Principiante', 23);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (24, 'Catalán', 'Medio', 24);
insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values (25, 'Inglés', 'Avanzado', 25);

-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla lista_negra_usuarios
-- ------------------------------------------------------------------------------------------------------------------------------------

insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (1, false, false, true, 1);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (2, true, true, false, 2);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (3, false, false, true, 3);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (4, false, true, false, 4);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (5, true, true, true, 5);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (6, false, true, true, 6);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (7, true, false, true, 7);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (8, true, true, true, 8);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (9, true, false, false, 9);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (10, false, true, true, 10);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (11, true, true, false, 11);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (12, false, true, true, 12);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (13, false, true, false, 13);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (14, true, true, true, 14);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (15, false, false, true, 15);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (16, false, false, true, 16);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (17, false, true, false, 17);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (18, true, false, true, 18);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (19, true, false, false, 19);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (20, true, false, false, 20);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (21, false, true, false, 21);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (22, true, true, true, 22);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (23, true, false, true, 23);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (24, false, true, false, 24);
insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values (25, true, false, true, 25);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla metodo_pagos
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (1, 'Alejandro', 'Cortes', 'AlejandroCortes07@gmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (2, 'Jordan', 'Cruz',  'JordanCruz892@hotmail.com', true, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (3, 'Byron', 'Suaréz', 'Byron2Suarez@gmail.com', true, false);
insert into metodo_pagos(id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (4, 'Camilo', 'Due', 'Camilodue4@hotmail.com',  true, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (5, 'Dayanna', 'Varón',  'Dayannavaron567@hotmail.com', true, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (6, 'Esteban', 'Oris',  'EstebanOris096@gmail.com', true, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (7, 'Felipe', 'Tapia',  'FelipeTapia09@hotmail.com', false, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (8, 'Gabriela', 'Sierra',  'vdemeter8@gmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (9, 'Hernan', 'Torres',  'spepye9@hotmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (10, 'Iris', 'Martinez',  'akenwarda@gmail.com', true, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (11, 'Juno', 'Ortiz',  'junoortiz09@hotmail.com', false, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (12, 'Katherine', 'Villa',  'katherine0907@ghotmail.com', true, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (13, 'Laura', 'Montaner',  'LauraMonstaner04@gmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (14, 'Monica', 'Lopez',  'Lopezmoni@hotmail.com', false, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (15, 'Alejandra', 'Marquez',  'AlejandraMarquesita@outlook.es', true, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (16, 'Camilo', 'Gonzales',  'camilo-gonzales@outlook.es', true, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (17, 'Gabriela', 'Osorio',  'gabrielaosorio0@gmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (18, 'Pamela', 'Burgos',  'pamelaburgos00@gmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (19, 'Rosa', 'Manrique', 'rosa_manrique@gmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (20, 'Tatiana', 'Salinas',  'Tatianaasalinas@outlook.es', true, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (21, 'Andrea', 'Montes',  'AndreaaaMontes@outlook.es', true, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (22, 'Cristina', 'Cruz', 'Cristinacruz09@gmail.com', false, true);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (23, 'Dylan', 'Torres', 'DylanTorres@gmail.com', false, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (24, 'Angie', 'Castro', 'Angie07castroo@gmail.com', false, false);
insert into metodo_pagos (id_metodo_pago, nombre, apellidos, correo, efectivo, tarjeta_credito) values (25, 'Camila', 'Ceballos','CamilaCeballos@outlook.es', true, false);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla notas
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (1, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 1,1);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (2, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 2,  2);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (3, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 3,  3);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno, cod_nivel) values (4, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 4,  4);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (5, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 5,  5);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (6, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 6,  6);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (7,7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 7,  7);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (8, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 8,  8);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (9, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 9,  9);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (10, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 10,  10);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (11,2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 11,  11);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (12, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 12,  12);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (13, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 13,  13);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (14, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 14,  14);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (15, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 15,  15);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (16, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 16,  16);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (17, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 17,  17);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (18, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 18,  18);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (19, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 19,  19);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (20,7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 20,  20);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (21, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 21,  21);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (22, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 22,  22);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (23, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 23,  23);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (24, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 24,  24);
insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, cod_alumno,  cod_nivel) values (25, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 25,  25);

<<<<<<< HEAD
insert into `laravel`.`matrículas`  (id_programación, cod_idioma, cod_alumno, cod_factura, id_horario, nro_sala_online, id_pago, cod_profesor, cod_nivel_curso) values (1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4, 4, 4, 4),
(5, 5, 5, 5, 5, 5, 5, 5, 5),
(6, 6, 6, 6, 6, 6, 6, 6, 6),
(7, 7, 7, 7, 7, 7, 7, 7, 7),
(8, 8, 8, 8, 8, 8, 8, 8, 8),
(9, 9, 9, 9, 9, 9, 9, 9, 9),
(10, 10, 10, 10, 10, 10, 10, 10, 10),
(11, 11, 11, 11, 11, 11, 11, 11, 11),
(12, 12, 12, 12, 12, 12, 12, 12, 12),
(13, 13, 13, 13, 13, 13, 13, 13, 13),
(14, 14, 14, 14, 14, 14, 14, 14, 14),
(15, 15, 15, 15, 15, 15, 15, 15, 15),
(16, 16, 16, 16, 16, 16, 16, 16, 16),
(17, 17, 17, 17, 17, 17, 17, 17, 17),
(18, 18, 18, 18, 18, 18, 18, 18, 18),
(19, 19, 19, 19, 19, 19, 19, 19, 19),
(20, 20, 20, 20, 20, 20, 20, 20, 20),
(21, 21, 21, 21, 21, 21, 21, 21, 21),
(22, 22, 22, 22, 22, 22, 22, 22, 22),
(23, 23, 23, 23, 23, 23, 23, 23, 23),
(24, 24, 24, 24, 24, 24, 24, 24, 24),
(25, 25, 25, 25, 25, 25, 25, 25, 25);
 
=======
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla pagos
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into pagos (id_pago, id_alumno, cvv) values (1, 1, 908);
insert into pagos (id_pago, id_alumno, cvv) values (2, 2, 678);
insert into pagos (id_pago, id_alumno, cvv) values (3, 3, 305);
insert into pagos (id_pago, id_alumno, cvv) values (4, 4, 567);
insert into pagos (id_pago, id_alumno, cvv) values (5, 5, 243);
insert into pagos (id_pago, id_alumno, cvv) values (6, 6, 546);
insert into pagos (id_pago, id_alumno, cvv) values (7, 7, 456);
insert into pagos (id_pago, id_alumno, cvv) values (8, 8, 234);
insert into pagos (id_pago, id_alumno, cvv) values (9, 9, 576);
insert into pagos (id_pago, id_alumno, cvv) values (10, 10, 100);
insert into pagos (id_pago, id_alumno, cvv) values (11, 11, 778);
insert into pagos (id_pago, id_alumno, cvv) values (12, 12, 908);
insert into pagos (id_pago, id_alumno, cvv) values (13, 13, 231);
insert into pagos (id_pago, id_alumno, cvv) values (14, 14, 144);
insert into pagos (id_pago, id_alumno, cvv) values (15, 15, 345);
insert into pagos (id_pago, id_alumno, cvv) values (16, 16, 233);
insert into pagos (id_pago, id_alumno, cvv) values (17, 17, 122);
insert into pagos (id_pago, id_alumno, cvv) values (18, 18, 345);
insert into pagos (id_pago, id_alumno, cvv) values (19, 19, 109);
insert into pagos (id_pago, id_alumno, cvv) values (20, 20, 446);
insert into pagos (id_pago, id_alumno, cvv) values (21, 21, 243);
insert into pagos (id_pago, id_alumno, cvv) values (22, 22, 567);
insert into pagos (id_pago, id_alumno, cvv) values (23, 23, 554);
insert into pagos (id_pago, id_alumno, cvv) values (24, 24, 345);
insert into pagos (id_pago, id_alumno, cvv) values (25, 25, 889);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla profesores
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into profesores (cod_profesor, nombre_profesor, correo_profesor, teléfono_profesor, dirección_profesor, cod_idioma) values (1, 'Dybala', 'DybalaPaulo@gmail.com', '+34 603456783','calle san agustin 9',1);
insert into profesores (cod_profesor, nombre_profesor, correo_profesor, teléfono_profesor,dirección_profesor, cod_idioma) values (2, 'Camila', 'CamilaCab@gmail.com', '+34 690567','calle osorio 34', 2);
insert into profesores (cod_profesor, nombre_profesor, correo_profesor, teléfono_profesor, dirección_profesor,cod_idioma) values (3, 'Alicia', 'aliciasanchez@hotmail.com', '+34 64519306','calle torres 23', 3);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla cursos
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (1, 1, 1,  1, 1, 1, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (2, 2, 2,  1, 2, 2, 'Francés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (3, 3, 3,  1, 3, 3, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (4, 4, 4,  2, 4, 4, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (5, 5, 5,  2, 5, 5, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (6, 6, 6,  2, 6, 6, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (7, 7, 7,  3, 7, 7, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (8, 8, 8,  1, 8, 8, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (9, 9, 9,  3, 9, 9, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (10, 10, 10,  1, 10, 10, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (11, 11,  11, 1, 11, 11, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (12, 12,  12, 2, 12, 12, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (13, 13, 13,  3, 13, 13, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (14, 14, 14,  1, 14, 14, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (15, 15, 15,  1, 15, 15, 'Inglés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (16, 16, 16,  1, 16, 16, 'Francés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (17, 17, 17,  2, 17, 17, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (18, 18, 18, 2, 18, 18, 'Francés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (19, 19, 19,  2, 19, 19, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (20, 20, 20,  3, 20, 20, 'Francés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (21, 21, 21,  3, 21, 21, 'Francés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (22, 22, 22,  2, 22, 22, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (23, 23, 23,  2, 23, 23, 'Catalán', 'Calle de goya sede barcelona');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (24, 24, 24,  1, 24, 24, 'Francés', 'Calle Camarillo sede principal');
insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values (25, 25, 25,  1, 25, 25, 'Francés', 'Calle Camarillo sede principal');
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla residencias
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into residencias (id_residencia, residencia, cod_alumno) values (1, 'Extranjero', 1);
insert into residencias (id_residencia, residencia, cod_alumno) values (2, 'Español', 2);
insert into residencias (id_residencia, residencia, cod_alumno) values (3, 'Español', 3);
insert into residencias (id_residencia, residencia, cod_alumno) values (4, 'Español', 4);
insert into residencias (id_residencia, residencia, cod_alumno) values (5, 'Español', 5);
insert into residencias (id_residencia, residencia, cod_alumno) values (6, 'Extranjero', 6);
insert into residencias (id_residencia, residencia, cod_alumno) values (7, 'Extranjero', 7);
insert into residencias (id_residencia, residencia, cod_alumno) values (8, 'Extranjero', 8);
insert into residencias (id_residencia, residencia, cod_alumno) values (9, 'Extranjero', 9);
insert into residencias (id_residencia, residencia, cod_alumno) values (10, 'Español', 10);
insert into residencias (id_residencia, residencia, cod_alumno) values (11, 'Español', 11);
insert into residencias (id_residencia, residencia, cod_alumno) values (12, 'Español', 12);
insert into residencias (id_residencia, residencia, cod_alumno) values (13, 'Español', 13);
insert into residencias (id_residencia, residencia, cod_alumno) values (14, 'Español', 14);
insert into residencias (id_residencia, residencia, cod_alumno) values (15, 'Español', 15);
insert into residencias (id_residencia, residencia, cod_alumno) values (16, 'Español', 16);
insert into residencias (id_residencia, residencia, cod_alumno) values (17, 'Español', 17);
insert into residencias (id_residencia, residencia, cod_alumno) values (18, 'Extranjero', 18);
insert into residencias (id_residencia, residencia, cod_alumno) values (19, 'Extranjero', 19);
insert into residencias (id_residencia, residencia, cod_alumno) values (20, 'Extranjero', 20);
insert into residencias (id_residencia, residencia, cod_alumno) values (21, 'Extranjero', 21);
insert into residencias (id_residencia, residencia, cod_alumno) values (22, 'Español', 22);
insert into residencias (id_residencia, residencia, cod_alumno) values (23, 'Español', 23);
insert into residencias (id_residencia, residencia, cod_alumno) values (24, 'Español', 24);
insert into residencias (id_residencia, residencia, cod_alumno) values (25, 'Español', 25);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla Temarios
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (1, 'introduction to language', 'Primer tomo', 'Inglés', 1, 1);
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (2, 'introduction à la langue', 'Primer tomo', 'Francés', 2, 2);
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (3, 'introducció a l llenguatge', 'Primer tomo', 'Catalán', 3, 3);
insert into Temarios(id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (4, 'literary essay expose', 'segundo tomo', 'Inglés', 4, 4);
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (5, 'essai littéraire exposer', 'segundo tomo', 'Francés', 5, 5);
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (6, 'assaig literari exposar', 'segundo tomo', 'Catalán', 6, 6);
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (7, 'final certified project', 'tercer tomo', 'Inglés', 7, 7);
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (8, 'projet final certifié', 'tercer tomo', 'Francés', 8, 8);
insert into Temarios (id_Temario, nombre, texto, idioma, usuarios_id_usuario, id_curso) values (10, 'projecte final certificat', 'tercer tomo', 'Catalán', 10, 10);
-- ------------------------------------------------------------------------------------------------------------------------------------
-- insert tabla ordenes
-- ------------------------------------------------------------------------------------------------------------------------------------
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (1, 1, 1, 1, 1, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (2, 2, 26, 2, 2, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (3, 3, 3, 3, 3, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (4, 4, 4, 4, 4, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (5, 5, 5, 5, 5, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (6, 6, 6, 6, 6, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (7, 7, 7, 7, 7, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (8, 8, 8, 8, 8, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (9, 9, 9, 9, 9, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (10, 10, 10, 10, 10, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (11, 11, 11, 11, 11, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (12, 12, 12, 12, 12, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (13, 13, 13, 13, 13, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (14, 14, 14, 14, 14, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (15, 15, 15, 15, 15, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (16, 16, 16, 16, 16, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (17, 17, 17, 17, 17, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (18, 18, 18, 18, 18, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (19, 19, 19, 19, 19, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (20, 20, 20, 20, 20, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (21, 21, 21, 21, 21, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (22, 22, 22, 22, 22, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (23, 23, 23, 23, 23, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (24, 24, 24, 24, 24, 340);
insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values (25, 25, 25, 25, 25, 340);
>>>>>>> 9b26682502e3fbbf32bde9cd8c52fea76a6a66c5
