# Tarea #9 Clase BDR MCD

Para la tarea 9 de realizó un stored procedure el cual nos va a calcular los coeficientes de una regresion lineal de nuestra tabla.

Se ultilizó las formulas correspondientes para sacar B0 y B1 y se pasaron a código de SQL donde se tuvo que tener mucho cuidado con los parentesis y el orden en que se posicionan los argumentos de las funciones utilizadas, la lista de funciones utilizadas (sin contar operaciones como resta, multiplicación y dicisión) es la siguiente:

-count()
-sum()
-pow()

Lo interesante de este ejercicio fue que antes solo habiamos usado las funciones por si solas, y ahora se tuvieron que usar funciones dentro de otras funciones lo que te da una idea más grande de lo que puedes llegar a hacer dentro de MySQL.

Un problema con el que me enfrenté fue que el stored procedure no se creaba al menos que ejecutara todo el script de golpe. A continuación dejo el codigo del stored procedure:

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