```mermaid
erDiagram
    Usuario ||--|{ Transaccion : Hace
    Usuario }|--|{ Quiniela : "Crea o se une"
    Usuario ||--|{ Apuesta : Hace;

    Transaccion ||--|| Usuario : "Deposita/Retira Dinero"

    Apuesta ||--|| Usuario : "Deposita/Retira Dinero"
    
    Partido ||--|{ Apuesta : Pertenece
```
