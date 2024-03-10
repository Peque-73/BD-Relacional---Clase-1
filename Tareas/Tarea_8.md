# Tarea #7 Clase BDR MCD: Vistas y triggers

La primer vista que se generaron nos permite ver cuales son los autores mas pedidos y así ver la demanda de estos:

    create view View_Autores_Pedidos as 
	    select a.nombre, al.id_autor, count(*) as Pedidos_Autor
	    from autores_libros al 
	    inner join libros_usuarios lu on lu.id_libro = al.id_libro
	    inner join autores a on al.id_autor = a.id
	    group by al.id_autor
	    order by Pedidos_Autor asc  

La segunda vista nos permite determinar el tiempo que ha pasado desde el prestamo en aquellos libros que no han sido regresados y poder determinar la cantidad de multa si ya pasó el tiempo limite de entrega:

    create view Multas as
	    select lu.id_usuario, u.nombre, l.titulo , ceil((datediff('2024-04-15', lu.fecha_prestamo) - 31)/7) * 100 as Multa 
	    from libros_usuarios lu 
	    inner join libros l on lu.id_libro = l.id 
	    inner join usuarios u on lu.id_usuario = u.id
	    where lu.fecha_retorno is null
	    having Multa > 0
	    order by Multa desc 

El trigger que se creó sirve para evitar que al momento d ingresar un nuevo prestamo se registre como se regresó en ese mismo instante:

    create trigger datecheck before insert on libros_usuarios
    for each row if new.fecha_retorno = curdate() 
    then set new.fecha_retorno = null; end if;

    INSERT INTO libros_usuarios (id_libro, id_usuario, fecha_prestamo, fecha_retorno) VALUES
	(10, 8, curdate(), curdate());