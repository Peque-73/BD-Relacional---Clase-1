# Tarea #2 Clase BDR MCD
## Instrucciones
1. Convierte tu base de datos no estructurada en un modelo entidad-relacion, representandolo con un diagrama entidad-relacion. Usa nodos con figuras correctas y aristas claramente señaladas con los numeros correspondientes para las relaciones.
2. Muestra el dominio de los atributos.
3. Subir esta descripcion en un archivo markdown.

### 31/01/2024 ACTUALIZACIÓN DE LA TAREA: SE REALIZÓ EL [DIAGRAMA ENTIDAD-RELACIÓN](https://www.figma.com/file/xMHG5oFJbuwDe1O2xPSb91/Diagrama-entidad-relaci%C3%B3n-Tarea_2?type=whiteboard&node-id=0%3A1&t=MjyxMJHcZJcybEsG-1)


```mermaid
erDiagram
    Usuario ||--|{ Transaccion : Hace
    Usuario }|--|{ Quiniela : "Crea o se une"
    Usuario ||--|{ Apuesta : Hace
    Transaccion ||--|| Usuario : "Deposita/Retira Dinero"
    Apuesta ||--|| Usuario : "Deposita/Retira Dinero"
    Partido ||--|{ Apuesta : Pertenece
    Liga||--|{ Equipo : Pertenece
    Liga||--|{ Partido : Pertenece
    Partido ||--|{ Equipo : Tiene
    Equipo ||--|{ Jugador : Tiene

    Usuario {
        int User_ID PK
        string Nombre
        int Tarjeta
        float Dinero_Cuenta
        string Apuestas_Ganadas
        string Apuestas_Perdidas
    }
Transaccion {
        int Transaccion_ID PK
        string Tipo_Transaccion
        int User_ID
    }

    Apuesta {
            int Apuesta_ID PK
            int User_ID
            int Partido_ID
            float Monto_Apuesta
            float Multiplicador_Apuesta
            string Prediccion_Usuario(local-visita-empate)
            string Resultado_Juego(local-visita-empate)
    }

    Equipo {
        int Equipo_ID PK
        int Jugador_ID
        int Partidos_Ganados
        int Partidos_Perdidos
        int Ganados_ultimos_5_juegos
        int Empatados_ultimos_5_juegos
        int Perdidos_ultimos_5_juegos
        int Total_Goles_Anotados
        int Total_Goles_Concedidos
        int Total_Tarjetas_Rojas
        int Total_Tarjetas_Amarillas
    }

    Liga {
        int Liga_ID PK
        string Tabla_General
        int Equipo_ID
        string Tabla_Goleo
        string Tabla_Menos_Goles_Recibidos
    }

    Jugador {
        int Jugador_ID PK
        int Equipo_ID
        int Juegos_Jugados
        int Minutos_Jugados
        int Goles_Anotados
        int Goles_Concedidos
        int Tarjetas_Rojas
        int Tarjetas_Amarillas
    }

    Partido {
        int Partido_ID PK
        int Liga_ID
        int Equipo_ID(Local)
        int Equipo_ID(Visita)
        float Multiplicador_Local
        float Multiplicador_Empate
        float Multiplicador_Visita
        string Resultado_Juego(local-visita-empate)
    }

    Quiniela {
        int Quiniela_ID PK
        int User_ID(Todos_Los_Participantes)
        int Partido_ID(Todos_Los_Partidos)
        string Prediccion_Usuario(local-visita-empate)(todos_los_usuarios_y_partidos)
        int Total_Aciertos(Por_usuario)
        string Tabla_General_Participantes
    }
```

### [Página principal](https://github.com/Peque-73/BD-Relacional---Clase-1)