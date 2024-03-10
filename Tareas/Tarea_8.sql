DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE usuarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre TEXT
);

DROP TABLE IF EXISTS autores;
CREATE TABLE autores (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre TEXT
);

DROP TABLE IF EXISTS libros;
CREATE TABLE libros (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo TEXT
);

DROP TABLE IF EXISTS autores_libros;
CREATE TABLE autores_libros (
	id_autor INT,
		FOREIGN KEY (id_autor) REFERENCES autores(id),
	id_libro INT,
		FOREIGN KEY (id_libro) REFERENCES libros(id),
	PRIMARY KEY (id_autor, id_libro)
);

DROP TABLE IF EXISTS libros_usuarios;
CREATE TABLE libros_usuarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_libro INT,
		FOREIGN KEY (id_libro) REFERENCES libros(id),
	id_usuario INT,
		FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
	fecha_prestamo DATE,
	fecha_retorno DATE
);

-- Insertar autores
INSERT INTO autores (nombre) VALUES
	('William Shakespeare'),
	('Miguel de Cervantes'),
	('Jane Austen'),
	('Fyodor Dostoevsky'),
	('Gabriel García Márquez'),
	('Thomas H. Cormen'),
	('Charles E. Leiserson'),
	('Ronald L. Rivest'),
	('Charu C. Aggarwal'),
	('Yann LeCun'),
	('David L. Nelson'),
	('Michael M. Cox');

-- Insertar libros
INSERT INTO libros (titulo) VALUES
	('Romeo and Juliet'),
	('Don Quijote de la Mancha'),
	('Pride and Prejudice'),
	('Crime and Punishment'),
	('Cien años de soledad'),
	('Hamlet'),
	('La Galatea'),
	('Sense and Sensibility'),
	('War and Peace'),
	('Love in the Time of Cholera'),
	('Introduction to Algorithms'),
	('Neural Networks and Deep Learning'),
	('Principles of Biochemistry');

-- Asignar autores a libros
INSERT INTO autores_libros (id_autor, id_libro) VALUES
	(1, 1), -- William Shakespeare - Romeo and Juliet
	(2, 2), -- Miguel de Cervantes - Don Quijote de la Mancha
	(3, 3), -- Jane Austen - Pride and Prejudice
	(4, 4), -- Fyodor Dostoevsky - Crime and Punishment
	(5, 5), -- Gabriel García Márquez - Cien años de soledad
	(1, 6), -- William Shakespeare - Hamlet
	(2, 7), -- Miguel de Cervantes - La Galatea
	(3, 8), -- Jane Austen - Sense and Sensibility
	(4, 9), -- Fyodor Dostoevsky - War and Peace
	(5, 10), -- Gabriel García Márquez - Love in the Time of Cholera
	(6, 11), -- Thomas H. Cormen - Introduction to Algorithms
	(7, 11), -- Charles E. Leiserson - Introduction to Algorithms
	(8, 11), -- Ronald L. Rivest - Introduction to Algorithms
	(9, 12), -- Charu C. Aggarwal - Neural Networks and Deep Learning
	(10, 12), -- Yann LeCun - Neural Networks and Deep Learning
	(11, 13), -- David L. Nelson - Principles of Biochemistry
	(12, 13); -- Michael M. Cox - Principles of Biochemistry

-- Insertar usuarios mexicanos
INSERT INTO usuarios (nombre) VALUES
	('Juan García'),
	('María Rodríguez'),
	('José Martínez'),
	('Ana Hernández'),
	('Luis López'),
	('Laura Pérez'),
	('Carlos Gómez'),
	('Alejandra Díaz'),
	('Javier Sánchez'),
	('Sofía Ramírez');
	
-- Generar algunos préstamos de libros con fecha de préstamo
INSERT INTO libros_usuarios (id_libro, id_usuario, fecha_prestamo, fecha_retorno) VALUES
	(1, 1, '2024-02-15', '2024-03-03'),
	(2, 2, '2024-02-20', NULL),
	(3, 3, '2024-02-25', '2024-03-01'),
	(4, 4, '2024-03-01', NULL),
	(5, 5, '2024-03-05', NULL),
	(6, 6, '2024-03-07', '2024-03-15'),
	(7, 7, '2024-03-10', NULL),
	(8, 8, '2024-03-12', NULL),
	(9, 9, '2024-03-15', '2024-03-20'),
	(10, 10, '2024-03-20', '2024-03-25'),
	(11, 1, '2024-03-22', NULL),
	(12, 2, '2024-03-25', NULL),
	(13, 3, '2024-03-28', NULL),
	(1, 4, '2024-03-30', NULL),
	(3, 1, '2024-03-03', NULL),
	(6, 9, '2024-03-21', '2024-04-12'),
	(9, 4, '2024-03-20', NULL),
	(10, 8, '2024-03-30', NULL),
	(6, 1, '2024-04-15', NULL);

create view View_Autores_Pedidos as 
	select a.nombre, al.id_autor, count(*) as Pedidos_Autor
	from autores_libros al 
	inner join libros_usuarios lu on lu.id_libro = al.id_libro
	inner join autores a on al.id_autor = a.id
	group by al.id_autor
	order by Pedidos_Autor asc  
	

create view Multas as
	select lu.id_usuario, u.nombre, l.titulo , ceil((datediff('2024-04-15', lu.fecha_prestamo) - 31)/7) * 100 as Multa 
	from libros_usuarios lu 
	inner join libros l on lu.id_libro = l.id 
	inner join usuarios u on lu.id_usuario = u.id
	where lu.fecha_retorno is null
	having Multa > 0
	order by Multa desc 
	
select * from libros_usuarios lu 
	
create trigger datecheck before insert on libros_usuarios
for each row if new.fecha_retorno = curdate() 
then set new.fecha_retorno = null; end if;

INSERT INTO libros_usuarios (id_libro, id_usuario, fecha_prestamo, fecha_retorno) VALUES
	(10, 8, curdate(), curdate());
	
select * from libros_usuarios lu 