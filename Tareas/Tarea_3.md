# Tarea #3 Clase BDR MCD
## Instrucciones
1. Crea un esquema del modelo relacional de tu base de datos a partir del modelo relacional de tu base de datos a partir del e-r de la tarea anterior.
2. Representa con un diagrama relacional tu esquema del punto anterior.
3. Encuentra 4 operaciones que vayas a usar en tu base de datos y expresalas mediante operadores del algebra relacional. Explica con tus propias palabras cada una de estas operaciones.
4. Reporta tu tarea de una manera claramente identificable en el repositorio.

## Respuestas

1. A continuación de muestra el esquema de modelo relacional de mi base de datos:  

Usuario (<u>User_ID</u>, Nombre, Tarjeta, Dinero_Cuenta, Apuestas_Ganadas, Apuestas Perdidas)

Tansacción (<u>Transacción_ID</u>, Tipo_Transacción, User_ID)

Quiniela (<u>Quiniela_ID</u>, User_ID, Partido_ID, Predicción_Usuario,Total_Aciertos, Tabla_General_Participantes)

Apuesta (<u>Apuesta_ID</u>, User_ID, Partido_ID, Monto_Apuesta, Predicción_Usuario(Local-Visita-Empate), Resultado_Juego(Local-Visita-Empate))

Equipo (<u>Equipo_ID</u>, Jugador_ID, Partidos_Ganados, Partidos_Perdidos, Ganados_ultimos_5_juegos, Empatados_ultimos_5_juegos, Perdidos_ultimos_5_juegos)

Usuario (<u>User_ID</u>,)