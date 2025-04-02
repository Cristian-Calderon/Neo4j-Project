// Crear nodos
CREATE (cristian:Persona {nombre: "Cristian", edad: 30})
CREATE (maria:Persona {nombre: "María", edad: 28})
CREATE (empresa:Empresa {nombre: "TechCorp", fundacion: 2010})

// Crear relaciones
CREATE (juan)-[:TRABAJA_EN]->(empresa)
CREATE (maria)-[:TRABAJA_EN]->(empresa)
CREATE (juan)-[:CONOCE]->(maria)


## 1 Borrar Nodos
MATCH (n) 
DETACH DELETE n

## 2 Borrar Nodos por etiquetas:
 Borrar todos los nodos con la etiqueta Persona
MATCH (n:Persona) 
DETACH DELETE n

## 3 Borrar Nodos con condiciones
// Borrar personas mayores de 30 años
MATCH (n:Persona {edad: 30}) 
DETACH DELETE n

## 4 Borrar con Multiples condiciones
// Borrar personas mayores de 30 años
MATCH (n:Persona {edad: 30}) 
DETACH DELETE n


// Jugadores
```
CREATE (miracle:Jugador {nombre: "Miracle-", nacionalidad: "Jordania", edad: 26, nick: "Miracl-"})
CREATE (notail:Jugador {nombre: "Johan Sundstein", nacionalidad: "Dinamarca", edad: 29, nick: "N0tail"})
```
// Héroes
CREATE (invoker:Heroe {nombre: "Invoker", tipo: "Inteligencia", dificultad: "Alto"})
CREATE (pudge:Heroe {nombre: "Pudge", tipo: "Fuerza", dificultad: "Medio"})

// Equipos
CREATE (og:Equipo {nombre: "OG", fundacion: 2015, region: "Europa"})

// Jugadores en equipos
CREATE (miracle)-[:JUEGA_EN]->(og)
CREATE (notail)-[:JUEGA_EN]->(og)

// Héroes jugados
CREATE (miracle)-[:JUEGA_HEROE]->(invoker)
CREATE (notail)-[:JUEGA_HEROE]->(pudge)