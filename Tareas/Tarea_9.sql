drop database if exists Tarea_9;

create database Tarea_9;

use Tarea_9;

create table Pesos (
	Peso int,
	Altura int
);

insert into Pesos (Peso, Altura) values
	(140, 60),
	(155, 62),
	(159, 67),
	(179, 70),
	(192, 71),
	(200, 72),
	(212, 75);

delimiter //
create procedure RL (
	out B0 float,
	out B1 float
)

begin
	select (sum(Altura)*sum(pow(Peso, 2)) - (sum(Peso)*sum(Peso*Altura)))/((count(*)*sum(pow(Peso,2)))-pow(sum(Peso),2))
	into B0
	from Pesos;

	select ((count(*)*sum(Peso*Altura))-(sum(Peso)*sum(Altura)))/((count(*)*sum(pow(Peso,2)))-pow(sum(Peso),2))
	into B1
	from Pesos;
end //
delimiter ;

call RL (@B0, @B1);

select @B0, @B1;
