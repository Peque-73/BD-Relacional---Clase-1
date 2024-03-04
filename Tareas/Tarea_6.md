# Tarea #6 Clase BDR MCD

Para mi primer consulta decidí obtener el promedio de dinero que se deposita por transaccion, lo hice usando las siguientes lineas de código:

    select avg(Monto) as "Promedio" From transacciones 
    where Tipo_Transacción = 'Deposito' 

El query anterior me regresó que el promedio de los depositos es de $1554.3698

Para mi segunda consulta quise saber el deposito mas pequeño y el deposito más grande que alguien haya hecho y que me muestre su usuario, esto lo hice con las siguientes lines de código:

    select id_Usuario, min(Monto) as Minimo from transacciones
    where Tipo_Transacción = 'Deposito'
    group by id_Usuario
    order by Minimo asc 
    limit 1

    select id_Usuario, max(Monto) as Maximo from transacciones
    where Tipo_Transacción = 'Deposito'
    group by id_Usuario
    order by Maximo desc  
    limit 1

Los querys anteriores me regresaron que el deposito mas pequeño es de $202 y lo hizo el usuario 48, y para el deposito más grande fue de $2999 y fue el usuario 53 quien lo hizo.

Para mi tercer query quiero saber la moda de mis usuarios para saber cual es el que hace mas transacciones ya sean retiros o depositos, lo hice con las siguientes lineas de codigo:

    select id_Usuario, count(*) as Transacciones_ from transacciones
    group by id_Usuario 
    order by Transacciones_ desc  
    limit 1

El query anterior me regresó como resultado que mi moda en los usuarios es el usuario 96 con un total de 20 transacciones.

Para mi cuarto query busqué obtener la informacion de aquellos equipos que son parte de alguna liga cuyo ID sea par y que han conseguido menos de la mitad de los puntos y de estos solo quedarme con aquellos que hayan recibido más del promedio de trajetas rojas para finalmente ordenarlo por porcentaje de puntos para ver si la cantidad de tarjetas rojas tiene alguna relación con los pocos puntos obtenidos por equipo, eso lo hice con las siguientes lineas de codigo:

    select avg(Tarjetas_Rojas) from equipos

    select Nombre_Equipo, id_Liga, Puntos/60 as Porcentaje_Efectividad, Tarjetas_Rojas  from equipos
    where mod(id_Liga, 2) = 0 and Tarjetas_Rojas > 6
    having Porcentaje_Efectividad < 0.5
    order by Porcentaje_Efectividad desc

La información obtenida por el query fue la siguiente:
    Nombre_ Equipo id_Liga Porcentaje_Efectividad Tarjetas_Rojas
    Jamia	2	0.4000	7
    Shufflester	2	0.3667	9
    Agivu	2	0.3667	7
    Dabtype	2	0.3167	9
    Tagopia	4	0.3000	10
    Edgewire	2	0.2667	10
    Thoughtstorm	4	0.2667	9
    Zoonoodle	4	0.1833	10
    idel	4	0.1333	11
    Skyvu	4	0.1167	8
    Livepath	2	0.1000	7
    Demizz	4	0.0833	7
    Photobean	2	0.0667	10

En lo Personal la actividad no presentó mucha dificultad, creo que lo que mas aprendí de esta actividad fue a poner atencion al orden en que ponemos los diferentes comandos y sobre todo saber bien con que tipo de columnas estamos trabajando ya que si hacemos una operacion que se muestre en una nueva columna y la queremos usar en un where no se nos permite ya que esa columna no existe como tal en la tabla, por lo que identificar bien nuestras columnas nos permitirá poder elegir la mejor manera de hacer el codigo sin necesidad de que MYSQL nos marque algun error.

Otra cosa que aprendí y que no sabia que se podia es que dentro de un where puedes usar funciones como yo lo hice en mi 4to query donde use la funcion de modulo para determinar si el ID de la liga era par o impar, de esta manera pude usar una funcion y usar el parametro que especifiqué dentro de un "and".
