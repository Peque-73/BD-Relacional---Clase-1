# Tarea #7 Clase BDR MCD: Subqueries

En mi primer consulta quise mostrar aquellas apuestas que se encuentren por atrriba del promedio de monto apostado y se hizo con el siguiente código:

    select id_apuesta, id_Partido, Monto_Apuesta  from apuestas a 
    where Monto_Apuesta < (select avg(Monto_Apuesta) from apuestas);

El codigo anterior me regresó el ID de la apuesta, el ID del partido donde se apostó y la cantidad que se apostó la cual está por encima del promedio, y con la informacion mostrada en DBeaver son 502 transacciones de 1000 las que superan la media.

En mi segunda consulta quiero saber aquellas apuestas en las que el monto es e 30% de lo que se obtendria multiplicando el promedio de monto de apuesta por el promedio de ganancia, eso se logró con el siguiente código:

    select id_Partido, Monto_Apuesta from apuestas a 
    where Monto_Apuesta  > (select ((avg(Multiplicador_Local) *  avg(Multiplicador_Empate) * avg(Multiplicador_Visita))/3)*(2927.639*0.3)  from partidos p);

El código anterior nos dice que hay 223 transacciones de 1000 que apuestan el 30% de la ganancia promedio.