ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'default'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';

-- drop database laravel;
--  create  database laravel;

use laravel;

-- Table Salas
drop table if exists Salas;
create table if not exists Salas (
nro_sala_online int primary key not null auto_increment ,
capacidad int not null
) engine=innoDb;

-- Table alumnos
drop table if exists alumnos;
create table if not exists alumnos(
id_alumno int primary key not null auto_increment ,
nombre_alumno varchar(45) not null,
apellido_alumno  varchar(45) not null,
código_curso int not null,
 teléfono_alumno VARCHAR(45) not null
) engine=innoDb;

-- Table descuentos
drop table if exists descuentos;
create table if not exists descuentos(
  id_descuento int primary key not null auto_increment,
  curso varchar(45) not null
)engine = innoDb;

-- Table productos
drop table if exists productos;
create table if not exists productos(
id_producto int primary key not null auto_increment,
nombre_curso varchar(120) not null,
fecha datetime not null,
precio int not null,
id_descuento int not null
)engine = innoDb;

-- Table carrito
drop table if exists carrito;
create table if not exists carrito(
id_carrito int primary key not null auto_increment,
id_datos_usuario int not null,
productos int not null,
cantidad int not null,
id_producto int not null
)engine = innoDb;

-- Table ciclos
drop table if exists ciclos;
create table if not exists ciclos(
cod_ciclo int primary key not null auto_increment,
ciclo int not null
)engine = innoDb;

-- Table usuarios
drop table if exists usuarios;
create table if not exists usuarios(
id_usuario int primary key not null auto_increment,
nombre_usuario varchar(45)not null,
contraseña_usuario varchar(45)not null,
código_usuario int not null,
correo_usuario varchar(45)not null,
nombre_curso_usuario varchar(45)not null
)engine = innoDb;

-- Table horarios
drop table if exists horarios;
create table if not exists horarios(
id_horario int primary key not null auto_increment,
día datetime not null,
hora varchar(80) not null,
cod_ciclo int not null
)engine = innoDb;

-- Table nivel_idiomas
drop table if exists nivel_idiomas;
create table if not exists nivel_idiomas(
cod_nivel int primary key not null auto_increment,
nivel int not null,
fecha date not null
)engine = innoDb;

-- Table idiomas
drop table if exists idiomas;
create table if not exists idiomas(
cod_idioma  int primary key not null auto_increment,
idioma varchar(45) not null,
nivel varchar(100) not null,
cod_nivel int not null
)engine = innoDb;

-- Table lista_negra_usuarios
drop table if exists lista_negra_usuarios;
create table if not exists lista_negra_usuarios(
id_usuario_lista_negra int primary key not null auto_increment,
bloqueado tinyint not null,
eliminado tinyint not null,
Reintegro tinyint not null,
id_usuario int not null
)engine = innoDb;

-- Table metodo_pagos
drop table if exists metodo_pagos;
create table if not exists metodo_pagos(
id_metodo_pago int primary key not null auto_increment,
nombre varchar(45) not null,
apellidos varchar(45) not null,
correo varchar(45) not null,
efectivo tinyint not null,
tarjeta_credito tinyint not null
)engine = innoDb;

-- Table notas
drop table if exists notas;
create table if not exists notas(
id_notas int primary key not null auto_increment,
nota1 decimal not null,
nota2 decimal not null,
nota3 decimal not null,
parcial decimal not null,
nota_final decimal not null,
estado varchar(45) not null,
id_alumno int not null,
cod_nivel int not null,
cod_idioma int not null
)engine = innoDb;

-- Table pagos
drop table if exists pagos;
create table if not exists pagos(
id_pago int primary key not null auto_increment,
id_alumno int not null,
cvv int not null
)engine = innoDb;

-- Table profesores
drop table if exists profesores;
create table if not exists profesores(
cod_profesor int primary key not null auto_increment,
nombre_profesor varchar(45) not null,
correo_profesor varchar(45) not null,
teléfono_profesor varchar(45) not null,
dirección_profesor varchar(45) not null,
cod_idioma int not null
)engine = innoDb;

-- Table cursos
drop table if exists cursos;
create table if not exists cursos(
id_curso int primary key not null auto_increment,
cod_idioma int not null,
nro_sala_online int not null,
cod_profesor int not null,
id_horario int not null,
cod_ciclo int not null,
nombre varchar(100) not null,
dirección varchar(45) not null
)engine = innoDb;

-- Table residencias
drop table if exists residencias;
create table if not exists residencias(
id_residencia int primary key not null auto_increment,
residencia varchar(100) not null,
id_alumno int not null
)engine = innoDb;

-- Table temarios
drop table if exists temarios;
create table if not exists temarios(
id_Temario int primary key not null auto_increment,
nombre varchar(45) not null,
texto varchar(45) not null,
idioma varchar(45) not null,
id_usuario int not null,
id_curso int not null
)engine = innoDb;

-- Table ordenes
drop table if exists ordenes;
create table if not exists ordenes(
id_orden  int primary key not null auto_increment,
id_alumno int not null,
id_carrito int not null,
id_pago int not null,
id_metodo_pago int not null,
total int not null
)engine = innoDb;

-- Filtros para la tabla productos
alter table productos add foreign key (id_descuento) references descuentos (id_descuento);

-- Filtros para la tabla carrito
alter table carrito add foreign key (id_producto) references productos (id_producto);

-- Filtros para la tabla horarios
alter table horarios add foreign key (cod_ciclo) references ciclos (cod_ciclo);

-- Filtros para la tabla idiomas
alter table idiomas add foreign key (cod_nivel) references nivel_idiomas (cod_nivel);

-- Filtros para la tabla lista_negra_usuarios
alter table lista_negra_usuarios add foreign key (id_usuario) references usuarios (id_usuario);
-- Filtros para la tabla notas
alter table notas add foreign key (id_alumno) references alumnos (id_alumno);
alter table notas add foreign key (cod_idioma) references idiomas (cod_idioma);
alter table notas add foreign key (cod_nivel) references nivel_idiomas (cod_nivel);

-- Filtros para la tabla pagos
alter table pagos add foreign key (id_alumno) references alumnos (id_alumno);

-- Filtros para la tabla profesores
alter table profesores add foreign key (cod_idioma) references idiomas (cod_idioma);

-- Filtros para la tabla cursos
alter table cursos add foreign key (cod_idioma) references idiomas (cod_idioma);
alter table cursos add foreign key (nro_sala_online) references Salas (nro_sala_online);
alter table cursos add foreign key (cod_profesor) references profesores (cod_profesor);
alter table cursos add foreign key (id_horario) references horarios (id_horario);
alter table cursos add foreign key (cod_ciclo) references ciclos (cod_ciclo);

-- Filtros para la tabla residencias
alter table residencias add foreign key (id_alumno) references alumnos (id_alumno);

-- Filtros para la tabla temarios
alter table temarios add foreign key (id_usuario) references usuarios (id_usuario);
alter table temarios add foreign key (id_curso) references cursos (id_curso);

-- Filtros para la tabla ordenes
alter table ordenes add foreign key (id_alumno) references alumnos (id_alumno);
alter table ordenes add foreign key (id_carrito) references carrito (id_carrito);
alter table ordenes add foreign key (id_pago) references pagos (id_pago);
alter table ordenes add foreign key (id_metodo_pago) references metodo_pagos (id_metodo_pago);



-- insert tabla metodo_pagos

insert into metodo_pagos (nombre, apellidos, correo, efectivo, tarjeta_credito) values
('Luisa', 'Martinez', 'luisamartinez@gmai.com',false,true),
('Camila', 'Moreno', 'camilaOrtiz@gmail.com', true,false),
('Juan', 'Becerra', 'juanbecerra@hotmail.com', true,false),
('Lorduy', 'Peréz', 'Lorduyperez01@gmail.com',false,true),
('Rosa', 'Solorzano', 'Rosasolor@hotmail.com',false,true),
('Claudia', 'Cortes', 'claudiacortes05@hotmail.com', true,false),
('Samuel', 'Cardona', 'samuelcardona02@gmail.com', true,false),
('Manuel', 'Monsalve', 'manuel02monsalve@hotmail.com', true,false),
('Uriel', 'Martinez', 'urielmartinez@gmail.com', true,false),
('Monica', 'Monserrat', 'monica02monserrat@hotmail.com',false,true),
('Guadalupe', 'Lopéz', 'guadalupe09@gmail.com',false,true),
('Alejandra', 'Peréz', 'aeljandrap@gmail.com', true,false),
('Nevin', 'Brompton', 'nbromptonc@gmail.com',false,true),
('Danielle', 'Oglevie', 'doglevied@gmail.com', true,false),
('Melosa', 'Parris', 'mparrise@hotmail.com',false,true),
('Carina', 'Guye', 'cguyef@gmail.com',false,true),
('Brandon', 'Sanchez', 'bjanczakg@hotmail.com',false,true),
('Bernete', 'Delue', 'bdelueh@gmail.com' , true,false),
('Jobey', 'Durram', 'jdurrami@gmail.com',false,true),
( 'Dayanna', 'Ortiz', 'DayannaOrtiz@gmail.com',false,true),
('Laura', 'Saénz', 'laurasaeco@gmail.com', true,false),
('Camila', 'Cortes', 'camilacortes05@hotmail.com', true,false),
('Angie', 'Castro', 'angiecastro02@hotmail.com', true,false),
('Sebastian', 'Monsalve', 'sebastianMonsalve02@gmail.com',false,true),
('Sergio', 'Morales', 'SergioMorales010@hotmail.com', true,false);


-- insert tabla salas

insert into Salas (nro_sala_online, capacidad) values 
(1, 15),
(2, 19),
(3, 4),
(4, 29),
(5, 23),
(6, 27),
(7, 11),
(8, 5),
(9, 1),
(10, 28),
(11, 3),
(12, 27),
(13, 20),
(14, 12),
(15, 14),
(16, 12),
(17, 26),
(18, 13),
(19, 30),
(20, 19),
(21, 11),
(22, 15),
(23, 1),
(24, 21),
(25, 21);

-- insert tabla alumnos

insert into alumnos (id_alumno, nombre_alumno, apellido_alumno, código_curso, teléfono_alumno) values 
(1, 'Camila', 'Ceballos', 1, '+62 (605) 527-2268'),
(2, 'Juan', 'Ortiz', 2, '+680 (512) 689-3283'),
(3, 'Alejandro', 'Cortes', 3, '+98 (885) 962-3358'),
(4, 'Jordan', 'Cruz', 4, '+48 (399) 644-7153'),
(5, 'Byron', 'Suaréz', 5, '+1 (516) 543-3007'),
(6, 'Camilo', 'Due', 6, '+7 (937) 471-5039'),
(7, 'Dayanna', 'Varón', 7, '+57 (390) 761-6913'),
(8, 'Esteban', 'Oris', 8, '+63 (694) 273-0705'),
(9, 'Felipe', 'Tapia', 9, '+86 (717) 443-5351'),
(10, 'Gabriela', 'Sierra', 10, '+81 (533) 818-4537'),
(11, 'Hernan', 'Torres', 11, '+86 (843) 317-5841'),
(12, 'Iris', 'Martinez', 12, '+86 (622) 303-4569'),
(13, 'Juno', 'Ortiz', 13, '+86 (966) 256-3421'),
(14, 'Katherine', 'Villa', 14, '+62 (690) 102-5151'),
(15, 'Laura', 'Montaner', 15, '+598 (461) 952-1630'),
(16, 'María', 'Monsalve', 16, '+46 (389) 543-2781'),
(17, 'Nicolas', 'Estupiñan', 17, '+86 (604) 149-3922'),
(18, 'Gabriela', 'Osorio', 18, '+94 (511) 253-6916'),
(19, 'Pamela', 'Burgos', 19, '+46 (864) 113-8975'),
(20, 'Rosa', 'Manrique', 20, '+7 (335) 963-3851'),
(21, 'Tatiana', 'Salinas', 21, '+62 (371) 446-2295'),
(22, 'Andrea', 'Montes', 22, '+86 (110) 506-6243'),
(23, 'Cristina', 'Cruz', 23, '+507 (382) 907-0492'),
(24, 'Dylan', 'Torres', 24, '+63 (782) 614-2565'),
(25, 'Angie', 'Castro', 25, '+54 (389) 220-2089');

-- insert tabla descuentos

insert into descuentos (id_descuento, curso) values 
(1, 'Inglés'),
(2, 'Catalán'),
(3, 'Francés'),
(4, 'Catalán'),
(5, 'Inglés'),
(6, 'Inglés'),
(7, 'Francés'),
(8, 'Francés'),
(9, 'Inglés'),
(10, 'Catalán'),
(11, 'Francés'),
(12, 'Inglés'),
(13, 'Catalán'),
(14, 'Francés'),
(15, 'Francés'),
(16, 'Catalán'),
(17, 'Inglés'),
(18, 'Inglés'),
(19, 'Francés'),
(20, 'Catalán'),
(21, 'Inglés'),
(22, 'Inglés'),
(23, 'Catalán'),
(24, 'Francés'),
(25, 'Catalán');

-- insert tabla productos

insert into productos (id_producto, nombre_curso, fecha, precio , id_descuento) values 
(1, 'Inglés', '2020-09-20', 340,1),
(2, 'Francés', '2021-04-14', 340,2),
(3, 'Catalán', '2020-01-09', 340,3),
(4, 'Francés', '2020-09-27', 340,4),
(5, 'Catalán', '2020-01-12', 340,5),
(6, 'Francés', '2021-03-04', 340,6),
(7, 'Catalán', '2021-03-05', 340,7),
(8, 'Francés', '2021-02-19', 340,8),
(9, 'Catalán', '2021-06-15', 340,9),
(10, 'Catalán', '2020-10-11',340,10),
(11, 'Francés', '2021-06-10', 340,11),
(12, 'Catalán', '2021-04-17', 340,12),
(13, 'Francés', '2021-05-24', 340,13),
(14, 'Catalán', '2020-12-30', 340,14),
(15, 'Inglés', '2021-03-28', 340,15),
(16, 'Catalán', '2021-02-23', 340,16),
(17, 'Inglés', '2021-02-25', 340,17),
(18, 'Catalán', '2021-02-04', 340,18),
(19, 'Catalán', '2020-10-14', 340,19),
(20, 'Inglés', '2021-05-21', 340,20),
(21, 'Inglés', '2020-09-09', 340,21),
(22, 'Catalán', '2020-12-31', 340,22),
(23, 'Inglés', '2020-08-12', 340,23),
(24, 'Inglés', '2021-01-09', 340,24),
(25, 'Inglés', '2020-09-23', 340,25);


-- insert tabla carrito


insert into carrito (id_carrito,  id_datos_usuario, productos, cantidad,  id_producto) values 
(1, 1, 1, 2, 1),
(3, 3, 1, 1, 3),
(4, 4, 1, 1, 4),
(5, 5, 1, 1, 5),
(6, 6, 1, 2, 6),
(7, 7, 1, 1, 7),
(8, 8, 1, 1, 8),
(9, 9, 1, 1, 9),
(10, 10, 1, 1, 10),
(11, 11, 1, 2, 11),
(12, 12, 1, 1, 12),
(13, 13, 1, 1, 13),
(14, 14, 1, 1, 14),
(15, 15, 1, 2, 15),
(16, 16, 1, 2, 16),
(17, 17, 1, 1, 17),
(18, 18, 1, 1, 18),
(19, 19, 1, 1, 19),
(20, 20, 1, 2, 20),
(21, 21, 1, 2, 21),
(22, 22, 1, 2, 22),
(23, 23, 1, 2, 23),
(24, 24, 1, 2, 24),
(25, 25, 1, 1, 25),
(26, 25, 1, 1, 25);

-- insert tabla ciclos

insert into ciclos (cod_ciclo, ciclo) values 
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 1);

-- insert tabla usuarios


insert into usuarios (id_usuario, nombre_usuario, contraseña_usuario, código_usuario, correo_usuario, nombre_curso_usuario) values 
(1, 'Camila', 'Ceballos', 1, 'CamilaCeballos@tuidioma.com', 'CamilaIdioma'),
(2, 'Alejandro', 'Cortes', 2, 'AlejandroCortes07@tuidioma.com', 'AlejandroIdioma'),
(3, 'Jordan', 'Cruz', 3, 'JordanCruz892@tuidioma.com', 'JordanIdioma'),
(4, 'Byron', 'Suaréz', 4, 'Byron2Suarez@tuidioma.com', 'ByronIdioma'),
(5, 'Camilo', 'Due', 5, 'Camilodue4@tuidioma.com', 'CamiloIdioma'),
(6, 'Dayanna', 'Varón', 6, 'Dayannavaron567@tuidioma.com', 'DayannaIdioma'),
(7, 'Esteban', 'Oris', 7, 'EstebanOris096@tuidioma.com', 'EstebanIdioma'),
(8, 'Felipe', 'Tapia', 8, 'FelipeTapia09@tuidioma.com', 'FelipeIdioma'),
(9, 'Gabriela', 'Sierra', 9, 'vdemeter8@tuidioma.com', 'gabrielaIdioma'),
(10, 'Hernan', 'Torres', 10, 'spepye9@tuidioma.com', 'HernanIdioma'),
(11, 'Iris', 'Martinez', 11, 'akenwarda@tuidioma.com', 'IrisIdioma'),
(12, 'Juno', 'Ortiz', 12, 'junoortiz09@tuidioma.com', 'JunoIdioma'),
(13, 'Katherine', 'Villa', 13, 'katherine0907@gtuidioma.com', 'katherienIdioma'),
(14, 'Laura', 'Montaner', 14, 'LauraMonstaner04@tuidioma.com', 'LauraIdioma'),
(15, 'Pablo', 'Dybala', 15, 'Profesor_Pablo_Dybala@tuidioma.com', 'Profesor_Dybala'),
(16, 'Alicia', 'Chancey', 16, 'Profesora_Alicia_Chancey@tuidioma.com', 'Profesora_Alicia'),
(17, 'Camila', 'Diaz', 17, 'Profesora_Camila_Diaz@tuidioma.com', 'Profesora_Camila'),
(18, 'Gabriela', 'Osorio', 18, 'gabrielaosorio0@tuidioma.com', 'gabrielaIdioma'),
(19, 'Pamela', 'Burgos', 19, 'pamelaburgos00@tuidioma.com', 'PamelaIdioma'),
(20, 'Rosa', 'Manrique', 20, 'rosa_manrique@tuidioma.com', 'RosaIdioma'),
(21, 'Tatiana', 'Salinas', 21, 'Tatianaasalinas@tuidioma.com', 'TatianaIdioma'),
(22, 'Andrea', 'Montes', 22, 'AndreaaaMontes@tuidioma.com', 'Andreaidioma'),
(23, 'Cristina', 'Cruz', 23, 'Cristinacruz09@tuidioma.com', 'CristinaIdioma'),
(24, 'Dylan', 'Torres', 24, 'DylanTorres@tuidioma.com', 'DylanIdioma'),
(25, 'Angie', 'Castro', 25, 'Angie07castroo@tuidioma.com', 'AngieIdioma');


-- insert tabla horarios

insert into horarios (id_horario, día, hora, cod_ciclo) values 
(1, '2021-04-16', '3:00 pm - 9:00 pm', 1),
(2, '2021-06-06', '9:00 am - 3:00 pm', 2),
(3, '2020-11-15', '3:00 pm - 9:00 pm', 3),
(4, '2020-09-27', '9:00 am - 3:00 pm', 4),
(5, '2021-04-04', '3:00 pm - 9:00 pm', 5),
(6, '2020-12-17', '9:00 am - 3:00 pm', 6),
(7, '2020-08-12', '9:00 am - 3:00 pm', 7),
(8, '2020-11-20', '3:00 pm - 9:00 pm', 8),
(9, '2020-12-31', '9:00 am - 3:00 pm', 9),
(10, '2021-01-06', '3:00 pm - 9:00 pm', 10),
(11, '2021-02-16', '9:00 am - 3:00 pm', 11),
(12, '2020-12-16', '3:00 pm - 9:00 pm', 12),
(13, '2021-2-17', '9:00 am - 3:00 pm', 13),
(14, '2021-05-10', '3:00 pm - 9:00 pm', 14),
(15, '2021-06-12', '3:00 pm - 9:00 pm', 15),
(16, '2021-05-08', '9:00 am - 3:00 pm', 16),
(17, '2020-10-27', '3:00 pm - 9:00 pm', 17),
(18, '2021-06-19', '9:00 am - 3:00 pm', 18),
(19, '2021-02-25', '3:00 pm - 9:00 pm', 19),
(20, '2020-09-28', '9:00 am - 3:00 pm', 20),
(21, '2021-05-09', '3:00 pm - 9:00 pm', 21),
(22, '2020-11-11', '3:00 pm - 9:00 pm', 22),
(23, '2021-03-06', '3:00 pm - 9:00 pm', 23),
(24, '2021-01-14', '9:00 am - 3:00 pm', 24),
(25, '2021-04-09', '9:00 am - 3:00 pm', 25);


-- insert tabla nivel_idiomas

insert into nivel_idiomas (cod_nivel, nivel, fecha) values 
(1, 1, '2020-11-11'),
(2, 1, '2021-05-09'),
(3, 1, '2020-09-28'),
(4, 1, '2020-10-23'),
(5, 2, '2021-02-25'),
(6, 2, '2021-06-19'),
(7, 1, '2020-10-27'),
(8, 1, '2021-05-08'),
(9, 1, '2020-10-27'),
(10, 1, '2021-05-08'),
(11, 1, '2021-06-12'),
(12, 2, '2021-05-10'),
(13, 2, '2021-2-17'),
(14, 2, '2020-12-16'),
(15, 2, '2021-02-16'),
(16, 2, '2021-01-06'),
(17, 2, '2020-12-31'),
(18, 1, '2020-11-20'),
(19, 1, '2020-08-12'),
(20, 2, '2020-12-17'),
(21, 2, '2021-04-04'),
(22, 1, '2020-09-27'),
(23, 2, '2021-01-14'),
(24, 2, '2021-03-06'),
(25, 2, '2021-04-09');

-- insert idiomas

insert into idiomas (cod_idioma, idioma, nivel, cod_nivel) values 
(1, 'Inglés', 'Avanzado', 1),
(2, 'Francés', 'Medio', 2),
(3, 'Catalán', 'Principiante', 3),
(4, 'Francés', 'Medio', 4),
(5, 'Catalán', 'Principiante', 5),
(6, 'Catalán', 'Principiante', 6),
(7, 'Francés', 'Medio', 7),
(8, 'Francés', 'Medio', 8),
(9, 'Francés', 'Principiante', 9),
(10, 'Catalán', 'Principiante', 10),
(11, 'Catalán', 'Medio', 11),
(12, 'Inglés', 'Medio', 12),
(13, 'Nataniel', 'Medio', 13),
(14, 'Inglés', 'Avanzado', 14),
(15, 'Francés', 'Avanzado', 15),
(16, 'Catalán', 'Avanzado', 16),
(17, 'Catalán', 'Avanzado', 17),
(18, 'Inglés', 'Avanzado', 18),
(19, 'Catalán', 'Principiante', 19),
(20, 'Inglés', 'Principiante', 20),
(21, 'Catalán', 'Avanzado', 21),
(22, 'Catalán', 'Medio', 22),
(23, 'Inglés', 'Principiante', 23),
(24, 'Catalán', 'Medio', 24),
(25, 'Inglés', 'Avanzado', 25);

-- insert tabla lista_negra_usuarios


insert into lista_negra_usuarios (id_usuario_lista_negra, bloqueado, eliminado, Reintegro, id_usuario) values
(26, false, false, true, 1),
(2, true, true, false, 2),
(3, false, false, true, 3),
(4, false, true, false, 4),
(5, true, true, true, 5),
(6, false, true, true, 6),
(7, true, false, true, 7),
(8, true, true, true, 8),
(9, true, false, false, 9),
(10, false, true, true, 10),
(11, true, true, false, 11),
(12, false, true, true, 12),
(13, false, true, false, 13),
(14, true, true, true, 14),
(15, false, false, true, 15),
(16, false, false, true, 16),
(17, false, true, false, 17),
(18, true, false, true, 18),
(19, true, false, false, 19),
(20, true, false, false, 20),
(21, false, true, false, 21),
(22, true, true, true, 22),
(23, true, false, true, 23),
(24, false, true, false, 24),
(25, true, false, true, 25);



-- insert tabla notas

insert into notas (id_notas, nota1, nota2, nota3, parcial, nota_final, estado, id_alumno, cod_nivel, cod_idioma) values 
(1, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 1, 1,1),
(2, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 2,  2,2),
(3, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 3,  3, 3),
(4, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 4,  4, 4),
(5, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 5,  5, 5),
(6, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 6,  6, 6),
(7,7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 7,  7, 7),
(8, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 8,  8, 8),
(9, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 9,  9, 9),
(10, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 10,  10, 10),
(11,2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 11,  11, 11),
(12, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 12,  12, 12),
(13, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 13,  13, 13),
(14, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 14,  14, 14),
(15, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 15,  15, 15),
(16, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 16,  16, 16),
(17, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 17,  17, 17),
(18, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 18,  18, 18),
(19, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 19,  19, 19),
(20,7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 20,  20, 20),
(21, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 21,  21, 21),
(22, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 22,  22, 22),
(23, 2.9, 8.8, 6.5, 8.8, 6.8, 'Aprobado', 23,  23, 23),
(25, 7.0, 3.4, 1.6, 2.0, 4.0, 'Reprobado', 25,  25, 25);

-- insert tabla pagos

insert into pagos (id_pago, id_alumno, cvv) values 
(1, 1, 908),
(2, 2, 678),
(3, 3, 305),
(4, 4, 567),
(5, 5, 243),
(6, 6, 546),
(7, 7, 456),
(8, 8, 234),
(9, 9, 576),
(10, 10, 100),
(11, 11, 778),
(12, 12, 908),
(13, 13, 231),
(14, 14, 144),
(15, 15, 345),
(16, 16, 233),
(17, 17, 122),
(18, 18, 345),
(19, 19, 109),
(20, 20, 446),
(21, 21, 243),
(22, 22, 567),
(23, 23, 554),
(24, 24, 345),
(25, 25, 889);

-- insert tabla profesores

insert into profesores (cod_profesor, nombre_profesor, correo_profesor, teléfono_profesor, dirección_profesor, cod_idioma) values 
(1, 'Dybala', 'DybalaPaulo@gmail.com', '+34 603456783','calle san agustin 9',1),
(2, 'Camila', 'CamilaCab@gmail.com', '+34 690567','calle osorio 34', 2),
(3, 'Alicia', 'aliciasanchez@hotmail.com', '+34 64519306','calle torres 23', 3);

-- insert tabla cursos

insert into cursos (id_curso, cod_idioma, nro_sala_online, cod_profesor,  id_horario,   cod_ciclo,   nombre,   dirección) values 
(1, 1, 1,  1, 1, 1, 'Inglés', 'Calle Camarillo sede principal'),
(2, 2, 2,  1, 2, 2, 'Francés', 'Calle Camarillo sede principal'),
(3, 3, 3,  1, 3, 3, 'Catalán', 'Calle de goya sede barcelona'),
(4, 4, 4,  2, 4, 4, 'Inglés', 'Calle Camarillo sede principal'),
(5, 5, 5,  2, 5, 5, 'Catalán', 'Calle de goya sede barcelona'),
(6, 6, 6,  2, 6, 6, 'Inglés', 'Calle Camarillo sede principal'),
(7, 7, 7,  3, 7, 7, 'Catalán', 'Calle de goya sede barcelona'),
(8, 8, 8,  1, 8, 8, 'Inglés', 'Calle Camarillo sede principal'),
(9, 9, 9,  3, 9, 9, 'Catalán', 'Calle de goya sede barcelona'),
(10, 10, 10,  1, 10, 10, 'Inglés', 'Calle Camarillo sede principal'),
(11, 11,  11, 1, 11, 11, 'Inglés', 'Calle Camarillo sede principal'),
(12, 12,  12, 2, 12, 12, 'Inglés', 'Calle Camarillo sede principal'),
(13, 13, 13,  3, 13, 13, 'Inglés', 'Calle Camarillo sede principal'),
(14, 14, 14,  1, 14, 14, 'Catalán', 'Calle de goya sede barcelona'),
(15, 15, 15,  1, 15, 15, 'Inglés', 'Calle Camarillo sede principal'),
(16, 16, 16,  1, 16, 16, 'Francés', 'Calle Camarillo sede principal'),
(17, 17, 17,  2, 17, 17, 'Catalán', 'Calle de goya sede barcelona'),
(18, 18, 18, 2, 18, 18, 'Francés', 'Calle Camarillo sede principal'),
(19, 19, 19,  2, 19, 19, 'Catalán', 'Calle de goya sede barcelona'),
(20, 20, 20,  3, 20, 20, 'Francés', 'Calle Camarillo sede principal'),
(21, 21, 21,  3, 21, 21, 'Francés', 'Calle Camarillo sede principal'),
(22, 22, 22,  2, 22, 22, 'Catalán', 'Calle de goya sede barcelona'),
(23, 23, 23,  2, 23, 23, 'Catalán', 'Calle de goya sede barcelona'),
(24, 24, 24,  1, 24, 24, 'Francés', 'Calle Camarillo sede principal'),
(25, 25, 25,  1, 25, 25, 'Francés', 'Calle Camarillo sede principal');

-- insert tabla residencias

insert into residencias (id_residencia, residencia, id_alumno) values 
(1, 'Extranjero', 1),
(2, 'Español', 2),
(3, 'Español', 3),
(4, 'Español', 4),
(5, 'Español', 5),
(6, 'Extranjero', 6),
(7, 'Extranjero', 7),
(8, 'Extranjero', 8),
(9, 'Extranjero', 9),
(10, 'Español', 10),
(11, 'Español', 11),
(12, 'Español', 12),
(13, 'Español', 13),
(14, 'Español', 14),
(15, 'Español', 15),
(16, 'Español', 16),
(17, 'Español', 17),
(18, 'Extranjero', 18),
(19, 'Extranjero', 19),
(20, 'Extranjero', 20),
(21, 'Extranjero', 21),
(22, 'Español', 22),
(23, 'Español', 23),
(24, 'Español', 24),
(25, 'Español', 25);

-- insert tabla Temarios

insert into temarios (id_Temario, nombre, texto, idioma, id_usuario, id_curso) values 
(1, 'introduction to language', 'Primer tomo', 'Inglés', 1, 1),
(2, 'introduction à la langue', 'Primer tomo', 'Francés', 2, 2),
(3, 'introducció a l llenguatge', 'Primer tomo', 'Catalán', 3, 3),
(4, 'literary essay expose', 'segundo tomo', 'Inglés', 4, 4),
(5, 'essai littéraire exposer', 'segundo tomo', 'Francés', 5, 5),
(6, 'assaig literari exposar', 'segundo tomo', 'Catalán', 6, 6),
(7, 'final certified project', 'tercer tomo', 'Inglés', 7, 7),
(8, 'projet final certifié', 'tercer tomo', 'Francés', 8, 8),
(10, 'projecte final certificat', 'tercer tomo', 'Catalán', 10, 10);

-- insert tabla ordenes

insert into ordenes (id_orden, id_alumno, id_carrito,  id_pago,   id_metodo_pago,   total) values 
(1, 1, 1, 1, 1, 340),
(2, 2, 26, 2, 2, 340),
(3, 3, 3, 3, 3, 340),
(4, 4, 4, 4, 4, 340),
(5, 5, 5, 5, 5, 340),
(6, 6, 6, 6, 6, 340),
(7, 7, 7, 7, 7, 340),
(8, 8, 8, 8, 8, 340),
(9, 9, 9, 9, 9, 340),
(10, 10, 10, 10, 10, 340),
(11, 11, 11, 11, 11, 340),
(12, 12, 12, 12, 12, 340),
(13, 13, 13, 13, 13, 340),
(14, 14, 14, 14, 14, 340),
(15, 15, 15, 15, 15, 340),
(16, 16, 16, 16, 16, 340),
(17, 17, 17, 17, 17, 340),
(18, 18, 18, 18, 18, 340),
(19, 19, 19, 19, 19, 340),
(20, 20, 20, 20, 20, 340),
(21, 21, 21, 21, 21, 340),
(22, 22, 22, 22, 22, 340),
(23, 23, 23, 23, 23, 340),
(24, 24, 24, 24, 24, 340),
(25, 25, 25, 25, 25, 340);

show tables;
select*from Salas;
select*from alumnos;
select*from descuentos;
select*from productos;
select*from carrito;
select*from ciclos;
select*from usuarios;
select*from horarios;
select*from nivel_idiomas;
select*from idiomas;
select*from lista_negra_usuarios;
select*from metodo_pagos;
select*from notas;
select*from pagos;
select*from profesores;
select*from cursos;
select*from residencias;
select*from temarios;
select*from ordenes;

