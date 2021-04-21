-- MySQL Script generated by MySQL Workbench
-- Tue Apr 20 18:27:37 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `laravel` ;
-- -----------------------------------------------------
-- Table `laravel`.`lista_negra_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`lista_negra_usuarios` (
  `id_usuario_lista_negra` INT NOT NULL,
  `bloqueado` TINYINT NOT NULL,
  `eliminado` TINYINT NOT NULL,
  `Reintegro` TINYINT NOT NULL,
  PRIMARY KEY (`id_usuario_lista_negra`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`datos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`datos_usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `contraseña_usuario` VARCHAR(45) NOT NULL,
  `código_usuario` INT NOT NULL,
  `correo_usuario` VARCHAR(45) NOT NULL,
  `nombre_curso_usuario` VARCHAR(45) NOT NULL,
  `id_usuario_lista_negra` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `id_usuario_lista_negra_idx` (`id_usuario_lista_negra` ASC),
  CONSTRAINT `id_usuario_lista_negra`
    FOREIGN KEY (`id_usuario_lista_negra`)
    REFERENCES `laravel`.`lista_negra_usuarios` (`id_usuario_lista_negra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`ciclos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`ciclos` (
  `cod_ciclo` INT NOT NULL AUTO_INCREMENT,
  `ciclo` INT NOT NULL,
  PRIMARY KEY (`cod_ciclo`),
  UNIQUE INDEX `id_ciclo_UNIQUE` (`cod_ciclo` ASC))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`horarios` (
  `id_horario` INT NOT NULL AUTO_INCREMENT,
  `dìa` DATE NOT NULL,
  `hora` DATETIME NOT NULL,
  `cod_ciclo` INT NOT NULL,
  PRIMARY KEY (`id_horario`),
  UNIQUE INDEX `id_horario_UNIQUE` (`id_horario` ASC),
  INDEX `cod_ciclo_idx` (`cod_ciclo` ASC),
  CONSTRAINT `cod_ciclo`
    FOREIGN KEY (`cod_ciclo`)
    REFERENCES `laravel`.`ciclos` (`cod_ciclo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`idiomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`idiomas` (
  `cod_idioma` INT NOT NULL,
  `idioma` VARCHAR(45) NOT NULL,
  `nivel` INT NOT NULL,
  PRIMARY KEY (`cod_idioma`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`Salas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`Salas` (
  `nro_sala_online` INT NOT NULL AUTO_INCREMENT,
  `capacidad` INT NOT NULL,
  PRIMARY KEY (`nro_sala_online`),
  UNIQUE INDEX `nro_sala_online_UNIQUE` (`nro_sala_online` ASC))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`nivel_idiomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`nivel_idiomas` (
  `cod_nivel` INT NOT NULL,
  `nivel` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`cod_nivel`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`profesores` (
  `cod_profesor` INT NOT NULL AUTO_INCREMENT,
  `nombre_profesor` VARCHAR(45) NOT NULL,
  `correo_profesor` VARCHAR(45) NOT NULL,
  `teléfono_profesor` VARCHAR(45) NOT NULL,
  `direcciòn_profesor` VARCHAR(45) NOT NULL,
  `cod_idioma` INT NOT NULL,
  PRIMARY KEY (`cod_profesor`),
  UNIQUE INDEX `cod_profesor_UNIQUE` (`cod_profesor` ASC),
  INDEX `cod_idioma_idx` (`cod_idioma` ASC),
  CONSTRAINT `cod_idioma`
    FOREIGN KEY (`cod_idioma`)
    REFERENCES `laravel`.`idiomas` (`cod_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`programación_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`programación_cursos` (
  `id_programación_curso` INT NOT NULL AUTO_INCREMENT,
  `cod_idioma` INT NOT NULL,
  `nro_sala_online` INT NOT NULL,
  `cod_profesor` INT NOT NULL,
  `cod_nivel_idioma` INT NOT NULL,
  `id_horario` INT NOT NULL,
  `cod_ciclo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_programación_curso`),
  INDEX `id_horario_idx` (`id_horario` ASC),
  INDEX `nro_sala_online_idx` (`nro_sala_online` ASC),
  INDEX `cod_nivel_idx` (`cod_nivel_idioma` ASC),
  INDEX `cod_profesor_idx` (`cod_profesor` ASC),
  INDEX `cod_ciclo_idx` (`cod_ciclo` ASC),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  INDEX `cod_idioma_idx` (`cod_idioma` ASC),
  CONSTRAINT `id_horario`
    FOREIGN KEY (`id_horario`)
    REFERENCES `laravel`.`horarios` (`id_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nro_sala_online`
    FOREIGN KEY (`nro_sala_online`)
    REFERENCES `laravel`.`Salas` (`nro_sala_online`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_idioma1`
    FOREIGN KEY (`cod_idioma`)
    REFERENCES `laravel`.`idiomas` (`cod_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_nivel`
    FOREIGN KEY (`cod_nivel_idioma`)
    REFERENCES `laravel`.`nivel_idiomas` (`cod_nivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_profesor`
    FOREIGN KEY (`cod_profesor`)
    REFERENCES `laravel`.`profesores` (`cod_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_ciclo1`
    FOREIGN KEY (`cod_ciclo`)
    REFERENCES `laravel`.`ciclos` (`cod_ciclo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `laravel`.`datos_usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`residencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`residencias` (
  `id_residencia` INT NOT NULL AUTO_INCREMENT,
  `residencia` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_residencia`),
  UNIQUE INDEX `id_residencia_UNIQUE` (`id_residencia` ASC))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`alumnos` (
  `cod_alumno` INT NOT NULL AUTO_INCREMENT,
  `id_residencia` INT NOT NULL,
  `nombre_alumno` VARCHAR(45) NOT NULL,
  `apellido_alumno` VARCHAR(45) NOT NULL,
  `código_curso` INT NOT NULL,
  `teléfono_alumno` VARCHAR(45) NOT NULL,
  `dirección_alumno` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`cod_alumno`),
  UNIQUE INDEX `cod_alumno_UNIQUE` (`cod_alumno` ASC),
  INDEX `id_residencia_idx` (`id_residencia` ASC),
  CONSTRAINT `id_residencia`
    FOREIGN KEY (`id_residencia`)
    REFERENCES `laravel`.`residencias` (`id_residencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- ----------------------------------------------------
-- Table `laravel`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`pagos` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `precio` INT NOT NULL,
  `id_residencia` INT NOT NULL,
  `cod_ciclo` INT NOT NULL,
  `id_horario` INT NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE INDEX `id_pago_UNIQUE` (`id_pago` ASC),
  INDEX `id_residencia_idx` (`id_residencia` ASC),
  INDEX `id_horario_idx` (`id_horario` ASC),
  INDEX `cod_ciclo_idx` (`cod_ciclo` ASC),
  CONSTRAINT `id_residencia1`
    FOREIGN KEY (`id_residencia`)
    REFERENCES `laravel`.`residencias` (`id_residencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_ciclo0`
    FOREIGN KEY (`cod_ciclo`)
    REFERENCES `laravel`.`ciclos` (`cod_ciclo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_horario0`
    FOREIGN KEY (`id_horario`)
    REFERENCES `laravel`.`horarios` (`id_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`metodo_pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`metodo_pagos` (
  `id_metodo_pago` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_metodo_pago`),
  UNIQUE INDEX `id_metodo_pago_UNIQUE` (`id_metodo_pago` ASC))
ENGINE = InnoDB;
-- ----------------------------------------------------
-- Table `laravel`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`facturas` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `cod_alumno` INT NOT NULL,
  `id_pago` INT NOT NULL,
  `cod_ciclo` INT NOT NULL,
  `id_horario` INT NOT NULL,
  `id_metodo_pago` INT NOT NULL,
  `total` INT NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE INDEX `id_factura_UNIQUE` (`id_factura` ASC),
  INDEX `cod_alumno_idx` (`cod_alumno` ASC),
  INDEX `id_pago_idx` (`id_pago` ASC),
  INDEX `id_horario_idx` (`id_horario` ASC),
  INDEX `cod_ciclo_idx` (`cod_ciclo` ASC),
  INDEX `id_metodo_pago_idx` (`id_metodo_pago` ASC),
  CONSTRAINT `cod_alumno`
    FOREIGN KEY (`cod_alumno`)
    REFERENCES `laravel`.`alumnos` (`cod_alumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_pago`
    FOREIGN KEY (`id_pago`)
    REFERENCES `laravel`.`pagos` (`id_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_ciclo2`
    FOREIGN KEY (`cod_ciclo`)
    REFERENCES `laravel`.`ciclos` (`cod_ciclo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_horario1`
    FOREIGN KEY (`id_horario`)
    REFERENCES `laravel`.`horarios` (`id_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_metodo_pago`
    FOREIGN KEY (`id_metodo_pago`)
    REFERENCES `laravel`.`metodo_pagos` (`id_metodo_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- ----------------------------------------------------
-- Table `laravel`.`matrículas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`matrículas` (
  `id_matrícula` INT NOT NULL AUTO_INCREMENT,
  `id_programación` INT NOT NULL,
  `cod_idioma` INT NOT NULL,
  `cod_alumno` INT NOT NULL,
  `cod_factura` INT NOT NULL,
  `id_horario` INT NOT NULL,
  `nro_sala_online` INT NOT NULL,
  `id_pago` INT NOT NULL,
  `cod_profesor` INT NOT NULL,
  `cod_nivel_curso` INT NOT NULL,
  PRIMARY KEY (`id_matrícula`),
  INDEX `id_horario_idx` (`id_horario` ASC),
  INDEX `cod_idioma_idx` (`cod_idioma` ASC),
  INDEX `nro_sala_online_idx` (`nro_sala_online` ASC),
  INDEX `id_programación_idx` (`id_programación` ASC),
  INDEX `cod_alumno_idx` (`cod_alumno` ASC),
  INDEX `cod_factura_idx` (`cod_factura` ASC),
  INDEX `id_pago_idx` (`id_pago` ASC),
  INDEX `cod_profesor_idx` (`cod_profesor` ASC),
  CONSTRAINT `id_horario2`
    FOREIGN KEY (`id_horario`)
    REFERENCES `laravel`.`horarios` (`id_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_idioma0`
    FOREIGN KEY (`cod_idioma`)
    REFERENCES `laravel`.`idiomas` (`cod_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nro_sala_online0`
    FOREIGN KEY (`nro_sala_online`)
    REFERENCES `laravel`.`Salas` (`nro_sala_online`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_programación`
    FOREIGN KEY (`id_programación`)
    REFERENCES `laravel`.`programación_cursos` (`id_programación_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_alumno0`
    FOREIGN KEY (`cod_alumno`)
    REFERENCES `laravel`.`alumnos` (`cod_alumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_factura`
    FOREIGN KEY (`cod_factura`)
    REFERENCES `laravel`.`facturas` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_pago0`
    FOREIGN KEY (`id_pago`)
    REFERENCES `laravel`.`pagos` (`id_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_profesor0`
    FOREIGN KEY (`cod_profesor`)
    REFERENCES `laravel`.`profesores` (`cod_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`notas` (
  `id_notas` INT NOT NULL AUTO_INCREMENT,
  `nota1` DECIMAL NOT NULL,
  `nota2` DECIMAL NOT NULL,
  `nota3` DECIMAL NOT NULL,
  `parcial` DECIMAL NOT NULL,
  `nota_final` DECIMAL NOT NULL,
  `estado` VARCHAR(80) NOT NULL,
  `cod_alumno` INT NOT NULL,
  `cod_idioma` INT NOT NULL,
  `cod_nivel` INT NOT NULL,
  `id_residencia` INT NOT NULL,
  PRIMARY KEY (`id_notas`),
  INDEX `cod_idioma_idx` (`cod_idioma` ASC),
  INDEX `cod_alumno_idx` (`cod_alumno` ASC),
  INDEX `id_residencia_idx` (`id_residencia` ASC),
  INDEX `cod_nivel_idx` (`cod_nivel` ASC) ,
  CONSTRAINT `cod_idioma3`
    FOREIGN KEY (`cod_idioma`)
    REFERENCES `laravel`.`idiomas` (`cod_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_nivel0`
    FOREIGN KEY (`cod_nivel`)
    REFERENCES `laravel`.`nivel_idiomas` (`cod_nivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_alumno1`
    FOREIGN KEY (`cod_alumno`)
    REFERENCES `laravel`.`alumnos` (`cod_alumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_residencia0`
    FOREIGN KEY (`id_residencia`)
    REFERENCES `laravel`.`residencias` (`id_residencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre_curso` VARCHAR(120) NOT NULL,
  `fecha` DATE NOT NULL,
  `precio` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_producto` ASC))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`carrito` (
  `id_carrito` INT NOT NULL AUTO_INCREMENT,
  `id_datos_usuario` INT NOT NULL,
  `productos` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cod_alumno` INT NOT NULL,
  PRIMARY KEY (`id_carrito`),
  UNIQUE INDEX `id_carrito_UNIQUE` (`id_carrito` ASC),
  INDEX `id_producto_idx` (`id_producto` ASC) ,
  INDEX `cod_alumno_idx` (`cod_alumno` ASC) ,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `laravel`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_alumno2`
    FOREIGN KEY (`cod_alumno`)
    REFERENCES `laravel`.`alumnos` (`cod_alumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `laravel`.`materiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`materiales` (
  `id_materia` INT NOT NULL AUTO_INCREMENT,
  `temario` VARCHAR(100) NOT NULL,
  `materias` VARCHAR(100) NOT NULL,
  `libros` VARCHAR(100) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_materia`),
  UNIQUE INDEX `id_materia_UNIQUE` (`id_materia` ASC) ,
  INDEX `id_usuario_idx` (`id_usuario` ASC) ,
  CONSTRAINT `id_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `laravel`.`datos_usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
  