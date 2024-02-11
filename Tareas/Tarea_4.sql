drop database if exists Tarea_4;

create database Tarea_4;

use Tarea_4;

create table Usuarios (
	id_Usuario INT auto_increment primary key,
	Nombre VARCHAR(50) not null,
	Tarjeta VARCHAR(16) not null,
	Dinero_Cuenta FLOAT not null,
	Apuestas_Ganadas INT,
	Apuestas_Perdidas INT
);

create table Transaccion (
	id_Transaccion INT auto_increment primary key,
	id_Usuario INT,
		foreign key (id_Usuario) references Usuarios (id_Usuario),
	Monto INT not null,
	Tipo_Transaccion VARCHAR(8) not null,
		check (Tipo_Transaccion = 'Deposito' or Tipo_Transaccion = 'Retiro')
);

create table Liga (
	id_Liga INT auto_increment primary key,
	Nombre_Liga VARCHAR(50) not null,
	unique(Nombre_Liga)
);

create table Equipo (
	id_Equipo INT auto_increment primary key,
	Nombre_Equipo VARCHAR(50) not null,
	id_Liga INT,
		foreign key (id_Liga) references Liga (id_Liga),
	Puntos INT not null,
	Partidos_Ganados INT not null,
	Partidos_Perdidos INT not null,
	Ganados_Ultimos_5_Juegos INT not null,
	Empatados_Ultimos_5_Juegos INT not null,
	Perdidos_Ultimos_5_Juegos INT not null,
	Total_Goles_Anotados INT not null,
	Total_Goles_Concedidos INT not null,
	Total_Tarjetas_Rojas INT not null,
	Total_Tarjetas_Amarillas INT not null,
	unique (Nombre_Equipo)
);

create table Jugador (
	id_Jugador INT auto_increment primary key,
	Nombre_Jugador VARCHAR(50) not null,
	id_Equipo INT,
		foreign key (id_Equipo) references Equipo (id_Equipo),
	Juegos_Jugados INT not null,
	Minutos_Jugados INT not null,
	Goles_Anotados INT not null,
	Goles_Concedidos INT not null,
	Tarjetas_Rojas INT not null,
	Tarjetas_Amarillas INT not null
	);
	
create table Partido (
	id_Partido INT auto_increment primary key,
	id_Liga INT,
		foreign key (id_Liga) references Liga (id_Liga),
	id_Equipo_Local INT,
		foreign key (id_Equipo_Local) references Equipo (id_Equipo),
	id_Equipo_Visita INT,
		foreign key (id_Equipo_Visita) references Equipo (id_Equipo),
	Multiplicador_Local FLOAT not null,
	Multiplicador_Empate FLOAT not null,
	Multiplicador_Visita FLOAT not null,
	Resultado_Juego VARCHAR(6) not null,
		check (Resultado_Juego = 'Local' or Resultado_Juego = 'Empate' or Resultado_Juego = 'Visita'),
	unique(id_Equipo_Local, id_Equipo_Visita)
	);
	
create table Quiniela (
	id_Quiniela INT auto_increment primary key,
	id_Usuario INT,
		foreign key (id_Usuario) references Usuarios (id_Usuario),
	Prediccion_Usuario_Quiniela VARCHAR(6) not null,
		check (Prediccion_Usuario_Quiniela = 'Local' or Prediccion_Usuario_Quiniela = 'Empate' or Prediccion_Usuario_Quiniela = 'Visita'),
	id_Partido INT,
		foreign key (id_Partido) references Partido (id_Partido)
	);
	
create table Apuesta (
	id_Apuesta INT auto_increment primary key,
	id_Usuario INT,
		foreign key (id_Usuario) references Usuarios (id_Usuario),
	id_Partido INT,
		foreign key (id_Partido) references Partido (id_Partido),
	Prediccion_Usuario_Apuesta VARCHAR(6) not null,
		check (Prediccion_Usuario_Apuesta = 'Local' or Prediccion_Usuario_Apuesta = 'Empate' or Prediccion_Usuario_Apuesta = 'Visita'),
	Monto_Apuesta FLOAT not null
	);
	
insert into Usuarios (Nombre, Tarjeta, Dinero_Cuenta, Apuestas_Ganadas, Apuestas_Perdidas) values
	('Juan', '4637744572840766', 500, 5, 15),
	('Fernanda', '4758309196123193', 73.5, 0, 5),
	('Esteban', '8571929144661157', 272.5, 1, 0),
	('Maria', '2452137836587133', 1355.5, 20, 34);

insert into Transaccion (id_Usuario, Monto, Tipo_Transaccion) values
	(3, 100, 'Deposito'),
	(4, 500, 'Deposito'),
	(4, 800, 'Retiro'),
	(1, 1000, 'Retiro');
	
insert into Liga (Nombre_Liga) values
	('Liga Mexicana'),
	('Liga Americana');

insert into Equipo (Nombre_Equipo, id_Liga, Puntos, Partidos_Ganados, Partidos_Perdidos, Ganados_Ultimos_5_Juegos, Empatados_Ultimos_5_Juegos, 
Perdidos_Ultimos_5_Juegos, Total_Goles_Anotados, Total_Goles_Concedidos, Total_Tarjetas_Rojas, Total_Tarjetas_Amarillas) values
	('Dragones FC', 1, 15, 5, 0, 5, 0, 0, 10, 3, 0, 14),
	('Mantarrayas FC', 1, 8, 2, 1, 2, 2, 1, 5, 5, 1, 18),
	('McAllen FC', 2, 10, 3, 1, 3, 1, 1, 12, 8, 2, 6),
	('El Paso FC', 2, 2, 0, 3, 0, 2, 3, 1, 7, 1, 22);

insert into Jugador (Nombre_Jugador, id_Equipo, Juegos_Jugados, Minutos_Jugados, Goles_Anotados, Goles_Concedidos, Tarjetas_Rojas, Tarjetas_Amarillas) values
	('Enrique', 1, 5, 450, 3, 0, 0, 2),
	('Ricardo', 1, 5, 150, 0, 0, 0, 1),
	('Luis', 2, 5, 450, 0, 5, 0, 0),
	('Marcelo', 2, 3, 270, 1, 0, 0, 3);

insert into Partido (id_Liga, id_Equipo_Local, id_Equipo_Visita, Multiplicador_Local, Multiplicador_Empate, Multiplicador_Visita, Resultado_Juego) values
	(1, 2, 1, 2.5, 1.3, 1.4, 'Visita'),
	(2, 3, 4, 1.8, 1.1, 1.3, 'Empate');

insert into Quiniela (id_Usuario, Prediccion_Usuario_Quiniela, id_Partido) values
	(3, 'Visita', 1);

insert into Apuesta (id_Usuario, id_Partido, Prediccion_Usuario_Apuesta, Monto_Apuesta) values
	(3, 2, 'Empate', 500),
	(4, 1, 'Local', 100),
	(2, 1, 'Local', 50),
	(1, 2, 'Visita', 250);
	

show tables;
describe Usuarios;
describe Transaccion;
describe Liga;
describe Equipo;
describe Jugador;
describe Partido;
describe Quiniela;
describe Apuesta;

select * from Usuarios;
select * from Liga;
select * from Transaccion;
select * from Equipo;
select * from Jugador;
select * from Partido;
select * from Quiniela;
select * from Apuesta;
	
		