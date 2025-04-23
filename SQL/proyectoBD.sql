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
values (25000, "Daviplata", 5, 5),
(50000, "Daviplata", 5, 5),
(75000, "Nequi", 5, 5),
(100000, "Nequi", 5, 5),
(25000, "Bancolombia", 5, 5),
(25000, "Nequi", 5, 5),
(50000, "Nequi", 5, 5),
(75000, "Daviplata", 5, 5),
(50000, "Bancolombia", 5, 5),
(25000, "Daviplata", 5, 5),
(100000, "Nequi", 5, 5),
(25000, "Daviplata", 5, 5),
(50000, "Bancolombia", 5, 5),
(50000, "Daviplata", 5, 5),
(125000, "Nequi", 5, 5);
