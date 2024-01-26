```mermaid
erDiagram Tarea_2
    Usuario ||--|{ Transaccion : Hace

    Usuario }|--|{ Quiniela : "Crea o se une"

    Usuario ||--|{ Apuesta : Hace;

    Transaccion ||--|| Usuario : "Deposita/Retira Dinero"

    Apuesta ||--|| Usuario : "Deposita/Retira Dinero"
    
    Partido ||--|{ Apuesta : Pertenece

    Liga||--|{ Equipo : Pertenece

    Liga||--|{ Partido : Pertenece
    
    Partido ||--|{ Equipo : Tiene

    Equipo ||--|{ Jugador : Tiene
```