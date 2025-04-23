create database proyecto;
use proyecto;

create table adoptantes(
id_adoptante int auto_increment primary key,
nombre varchar(45) not null,
apellido varchar(45) not null,
correo varchar(80) not null unique,
telefono double not null unique
);

create table refugio(
id_refugio int auto_increment primary key,
nombre_refugio varchar(45) not null,
direccion varchar(120) not null,
correo varchar(80) not null,
telefono double not null
);

create table vacunas(
id_vacuna int auto_increment primary key,
tipo_vacuna varchar(50) not null
);

create table animales(
id_animal int auto_increment primary key,
animal varchar(30) not null,
raza varchar (30) not null,
id_refugio int not null,
id_vacunas int not null,
foreign key (id_refugio) references refugio(id_refugio),
foreign key (id_vacunas) references vacunas(id_vacuna) on delete cascade,
estado enum("Adoptado", "Sin adoptar") default "Sin adoptar"
);

create table donaciones(
id_donacion int auto_increment primary key,
valor float(10,2),
medio_de_pago varchar(40),
fecha_transaccion timestamp default current_timestamp,
id_adoptantes int not null,
id_refugio int not null,
foreign key (id_adoptantes) references adoptantes(id_adoptante) on delete cascade,
foreign key (id_refugio) references refugio(id_refugio) on delete cascade
);



create table adopcion(
id_adopcion int auto_increment primary key,
id_adoptante int not null,
id_animal int not null,
foreign key (id_adoptante) references adoptantes(id_adoptante),
foreign key (id_animal) references animales(id_animal),
estado enum ("Aceptado", "Denegado", "En proceso") default "En proceso",
fecha timestamp default current_timestamp
);

insert into adoptantes(nombre, apellido, correo, telefono) values
("carlos", "escobar", "carlose@gmail.com", "31328229412"),
("felipe", "gaitan", "felipeg@gmail.com", "3022841292"),
("ana", "correa", "anac@gmail.com", "32227629192"),
("paula", "galindo", "monicac@gmail.com", "32038271232"),
("cristian", "torres", "cristianc@gmail.com", "3043241142"),
("lucia", "mendez", "lucim@gmail.com", "3123224948"),
("marta", "duarte", "martad@gmail.com", "3207891412"),
("fernanda", "torres", "fernandat@gmail.com", "3112067521"),
("juan", "velez", "juanv@gmail.com", "3045812851"),
("pablo", "moreno", "pablom@gmail.com", "31624124251"),
("Jose", "Martines", "Josem@gmail.com", "32328929412"),
("Martin", "Alvarado", "MartinAlv@gmail.com", "3124284122"),
("Maria", "Guerrero", "MariaGu@gmail.com", "3144629120"),
("Carlos", "Flores", "Carlosflor@gmail.com", "3118092232"),
("Felipe", "Gaitan", "PipeG@gmail.com", "3142298142"),
("Samuel", "Carreon", "SamuCar@gmail.com", "3098235148"),
("Cristan", "Torres", "CrisTorres@gmail.com", "3251123412"),
("Santiago", "Cruz", "SantiC@gmail.com", "3002245120"),
("Melissa", "Velez", "MeliV@gmail.com", "3321412451"),
("Juan", "Juarez", "JuanJ@gmail.com", "3024123571");


insert into vacunas(tipo_vacuna) values
("rabia"),
("triple_felina"),
("moquillo"),
("hepatitis_canina");

insert into refugio(nombre_refugio, direccion, correo, telefono) values
("refugio salvaya", "calle 130, #95 60", "salvaya@gmail.com", 3112412512),
("refugio peluditos", "calle 130, #95 60", "peluditos@gmail.com", 3112412512),
("refugio amigo peludo", "calle 130, #95 60", "amigopeludo@gmail.com", 3112412512),
("refugio milagrinos", "calle 130, #95 60", "milagrinos@gmail.com", 3112412512),
("refugio animales felices", "calle 130, #95 60", "animalesfelices@gmail.com", 3112412512);

insert into animales(animal, raza, id_refugio, id_vacunas) values
("gato", "atigrado", 1, 2),
("perro", "pastor_aleman", 4, 4),
("conejo", "comun", 3, 3),
("gato", "siames", 3, 1),
("perro", "bulldog", 2, 4),
("ave", "perico", 5, 3),
("ave", "loro", 5, 3),
("perro", "chihuahua", 2, 1),
("conejo", "común", 1, 1),
("perro", "bulldozer", 2, 4),
("ave", "guacamayo", 1, 1),
("gato", "egipcio", 5, 2),
("conejo", "comun", 3, 3),
("gato", "siames", 3, 1),
("perro", "bulldog", 2, 4),
("ave", "perico", 1, 3),
("ave", "loro", 1, 3),
("perro", "chihuahua", 4, 1),
("gato", "persa", 3, 4),
("gato", "atigrado", 3, 4);

insert into adopcion (id_adoptante, id_animal)
values 
(1, 20),
(7, 18),
(11, 16),
(2, 9),
(3, 2),
(4, 4),
(5, 3),
(6, 14),
(5, 15),
(9, 19),
(10, 1),
(15, 5),
(11, 6),
(14, 7),
(20, 11),
(6, 13),
(16, 10);







insert into donaciones (valor, medio_de_pago, id_adoptantes, id_refugio) 
values (25000, "Daviplata", 5, 2),
(50000, "Daviplata", 5, 3),
(75000, "Nequi", 16, 2),
(100000, "Nequi", 11, 2),
(25000, "Bancolombia", 15, 3),
(25000, "Nequi", 20, 5),
(50000, "Nequi", 12, 5),
(75000, "Daviplata", 4, 4),
(50000, "Bancolombia", 3, 5),
(25000, "Daviplata", 1, 4),
(100000, "Nequi", 5, 3),
(25000, "Daviplata", 1, 5),
(50000, "Bancolombia", 3, 5),
(50000, "Daviplata", 2, 3),
(125000, "Nequi", 4, 3);

-- seleccionar todos los adoptantes
select * from adoptantes;

-- actualizar correo adoptantes
update adoptantes
set correo = "felipe@gmail.com" where id_adoptante = 2;

-- actualizar teléfono adoptantes
update adoptantes
set telefono = 3205620987 where id_adoptante = 2;


-- Donaciones hechas por adoptantes
select ad.nombre, r.nombre_refugio, d.valor, d.fecha_transaccion
from donaciones as d
join adoptantes as ad on d.id_adoptantes = ad.id_adoptante
join refugio as r on d.id_refugio = r.id_refugio;

-- total donaciones hechas por adoptantes
select ad.nombre, count(d.id_adoptantes) as total_donaciones
from donaciones as d
join adoptantes as ad on d.id_adoptantes = ad.id_adoptante
group by ad.nombre;

-- seleccionar animales con vacuna contra la hepatitis

select a.id_animal, a.animal, a.raza, v.tipo_vacuna
from animales as a
join vacunas as v on a.id_vacunas = v.id_vacuna
where tipo_vacuna like "%Hepatitis%";

-- total donaciones recibidas por un refugio

select r.nombre_refugio, count(d.id_refugio) as donaciones_recibidas
from donaciones as d
join refugio as r on d.id_refugio = r.id_refugio
group by r.nombre_refugio;

-- seleccionar los animales vistos en un refugio específico

select a.id_animal, a.animal, a.raza, r.nombre_refugio
from animales as a
join refugio as r on a.id_refugio = r.id_refugio
where r.id_refugio = 3;

-- seleccionar los gatos con vacuna triple felina de todos los refugios
select a.id_animal, a.animal, a.raza, v.tipo_vacuna, r.nombre_refugio
from animales as a
join refugio as r on a.id_refugio = r.id_refugio
join vacunas as v on a.id_vacunas = v.id_vacuna
where a.animal = "gato" and v.id_vacuna = 2;

-- seleccionar los animales con una raza específica en un refugio específico

select a.animal, a.raza, r.nombre_refugio
from animales as a
join refugio as r on a.id_refugio = r.id_refugio
where a.raza = "egipcio" and r.id_refugio = 5;

-- seleccionar las adopciones de un adoptante específico

select ad.nombre, a.id_animal, a.animal, a.raza, an.fecha
from adopcion as an
join adoptantes as ad on an.id_adoptante = ad.id_adoptante
join animales as a on an.id_animal = a.id_animal
where ad.id_adoptante = 5;

select * from adopcion;

-- seleccionar las donaciones con un monto mayor a 100000 pesos

select * from donaciones
where valor > 100000;

-- Contar el total de animales que han sido adoptados por refugio

select r.nombre_refugio, count(a.id_animal) as Total_adopciones
from adopcion as a
join animales as an on a.id_animal = an.id_animal
join refugio as r on an.id_refugio = r.id_refugio
group by r.nombre_refugio;

-- Contar el total de donaciones recibidas a cada refugio

select r.nombre_refugio, count(d.id_refugio) as Total_donaciones_recibidas
from donaciones as d
join refugio as r on d.id_refugio = r.id_refugio
group by r.nombre_refugio;

-- Contar el total de donaciones realizadas por cada adoptante

select ad.nombre, count(d.id_adoptantes) as Total_donaciones_realizadas
from donaciones as d
join adoptantes as ad on d.id_adoptantes = ad.id_adoptante
group by ad.nombre;

-- 	Contar el total de adopciones realizadas por cada adoptante

select ad.nombre, count(a.id_adoptante) as total_adopciones
from adopcion as a
join adoptantes as ad on a.id_adoptante = ad.id_adoptante
group by ad.nombre;

-- seleccionar a los adoptantes que no han realizado ninguna adopción (subconsulta)

select * from adoptantes where id_adoptante not in (select id_adoptante from adopcion);

-- seleccionar a los adoptantes que no han realizado ninguna donación (subconsulta)

select * from adoptantes where id_adoptante not in (select id_adoptantes from donaciones);

-- seleccionar a los refugios que no han recibido ninguna donación (subconsulta)

select * from refugio where id_refugio not in (select id_refugio from donaciones);

-- seleccionar a los adoptantes que han realizado una adopción (subconsulta)

select * from adoptantes where id_adoptante in (select id_adoptante from adopcion);

-- seleccionar a los adoptantes que han realizado una adopción y su nombre empiece con una "C" (subconsulta)
select * from adoptantes where nombre like "C%" and id_adoptante in (select id_adoptante from adopcion);

-- seleccionar a los adoptantes que han realizado una adopción y su nombre empiece con una "J" y el correo contenga "gmail" (subconsulta)
select * from adoptantes  where nombre like "J%" and correo like "%gmail%" and id_adoptante in (select id_adoptante from adopcion);

-- seleccionar los refugios que tengan una donación mayor o igual al promedio de donaciones en total (subconsulta)
select r.nombre_refugio, d.valor as donacion_recibida
from donaciones as d
join refugio as r on d.id_refugio = r.id_refugio
where valor >=(select avg(valor) from donaciones);



-- procedimiento para insertar un adoptante

delimiter $$

create procedure insertar_adoptante(
in p_nombre varchar(100),
in p_apellido varchar(100),
in p_correo varchar(100),
in p_telefono double
)
begin
insert into adoptantes (nombre, apellido, correo, telefono) 
values (p_nombre, p_apellido, p_correo, p_telefono);
end $$

delimiter ;

call insertar_adoptante ("Pepe", "Suarez", "PepeSua@yahoo.com", 3142936666);



-- Procedimiento de insertar un animal
delimiter $$

create procedure insertar_animal(
in p_animal varchar(50),
in p_raza varchar(70),
in p_id_refugio int,
in p_id_vacunas int
)
begin
insert into animales (animal, raza, id_refugio, id_vacunas)
values (p_animal, p_raza, p_id_refugio, p_id_vacunas);
end $$

delimiter ;

call insertar_animal ("Conejo", "Común", 5, 2);


-- Procedimiento de insertar un refugio
delimiter $$
create procedure insertar_refugio(
in p_nombre_refugio varchar(100),
in p_direccion varchar(150),
in p_correo varchar(150),
in p_telefono double
)
begin
insert into refugio (nombre_refugio, direccion, correo, telefono)
values (p_nombre_refugio, p_direccion, p_correo, p_telefono);
end $$

delimiter ;

call insertar_refugio ("Refugio Patitas", "Calle 40, #100 23", "Rpatitas@gmail.com", 3221429403);

-- Procedimiento para insertar una adopción
delimiter $$

create procedure insertar_adopcion(
in p_id_adoptante varchar(50),
in p_id_animal varchar(70)
)
begin
insert into adopcion (id_adoptante, id_animal)
values (p_id_adoptante, p_id_animal);
end $$

delimiter ;

call insertar_adopcion(3, 12);

-- Procedimiento para actualizar información de un adoptante

delimiter $$

create procedure actualizar_informacion_adoptante(
in p_correo varchar(80),
in p_telefono double,
in p_id_adoptante int
)
begin
update adoptantes
set correo = p_correo and telefono = p_telefono
where id_adoptante = p_id_adoptante;
end $$

delimiter ;

call actualizar_informacion_adoptante("carlos@gmail.com", 312322494, 5);


-- Procedimiento para actualizar información de un refugio
delimiter $$
create procedure actualizar_informacion_refugio(
in p_id_refugio int,
in p_direccion varchar(100),
in p_correo varchar(100),
in p_telefono double
)
begin
update refugio
set direccion = p_direccion
where id_refugio = p_id_refugio;
update refugio
set correo = p_correo
where id_refugio = p_id_refugio;
update refugio
set telefono = p_telefono 
where id_refugio = p_id_refugio;
end $$

delimiter ;

call actualizar_informacion_refugio (3, "Calle 80, #7A 23", "amigopeludo@gmail.com", 32912412412);


-- Procedimiento para insertar una donación
delimiter $$

create procedure insertar_donacion(
in p_valor int,
in p_medio_de_pago varchar(100),
in p_id_adoptantes int,
in p_id_refugio int
)
begin
insert into donaciones (valor, medio_de_pago, id_adoptantes, id_refugio)
values (p_valor, p_medio_de_pago, p_id_adoptantes, p_id_refugio);
end $$

delimiter ;

call insertar_donacion (500000, "Nequi", 20, 2);

-- Procedimiento para eliminar un refugio

delimiter $$
create procedure eliminar_refugio(
in p_id_refugio int
)
begin
delete from refugio where id_refugio = p_id_refugio;
end $$
delimiter ;

call eliminar_registro(6);

-- Procedimiento para eliminar un adoptante

delimiter $$
create procedure eliminar_adoptante(
in p_id_adopatnte int
)
begin
delete from adoptantes where id_adoptante = p_id_adoptante;
end $$

delimiter ;

-- Trigger  para evitar registrar un adoptante repetido
delimiter $$

create trigger registro_adoptante_repetido
before insert on adoptantes
for each row
begin
if exists (
select 1 from adoptantes
where nombre = new.nombre and
apellido = new.apellido and
correo = new.correo and
telefono = new.telefono)
then
signal sqlstate "45000"
set message_text = "El usuario ya está registrado, confirmar si los datos son correctos.";
end if;
end $$
delimiter ;


-- Trigger para evitar tener más de 6 refugios vinculados
delimiter $$
create trigger maximo_refugios
before insert on refugio
for each row
begin
if 
new.id_refugio <= 6
then
signal sqlstate "45000"
set message_text = "Se ha alcanzado un máximo de refugios, no se podrán ingresar más refugios.";
end if;
end $$

delimiter ;

-- Trigger para actualizar el estado de un animal si ya está adoptado
delimiter $$

create trigger actualizar_estado_animal
after insert on adopcion
for each row
begin
if exists(
select 1 from adopcion
where id_animal = new.id_animal) then
update animales
set estado = "Adoptado" where id_animal = new.id_animal;
end if;
end $$

delimiter ;


-- Evitar que un animal adoptado pueda ser adoptado nuevamente
delimiter $$

create trigger evitar_adopcion_doble
before insert on adopcion
for each row
begin
if exists(
select 1 from adopcion
where id_animal = new.id_animal)then
signal sqlstate "45000"
set message_text = "El animal ya ha sido adoptado";
end if;
end $$

delimiter ;

-- 

delimiter $$

create trigger before_eliminar_donacion
before delete on donaciones
for each row
begin
signal sqlstate "45000"
set message_text = "No se puede eliminar una donación";
end $$

delimiter ;

drop trigger actualizar_fecha_adopcion;

update adopcion
set estado = "Aceptado" where id_adopcion = 1;

