// Modelo de datos para peliculas
// Vamos a tener un tipo de Movie, por ejemplo
(:Movie {title: "Inception"})

// Y una relacion desde un User a la peliculas favorita
(:User {username:"pepe"}) - [:LIKES]-> (:Movie {title: "Inception"})



// Funcionalidad : Buscar peliculas
// Buscar por titulo exacto:
MATCH (m:Movie {title: "Inception"})
RETURN m


// Buscar por palabra parcial (ej. "inc"):
MATCH (m:Movie)
WHERE toLower(m.title) CONTAINS toLower("inc")
RETURN m

// Funcionalidad : Agregar pelicula favorita:
// Asegurarse de que la pelicula exista (o crearla)
MERGE (m:Movie {title: "Inception"})

// Relacionar al usuario con la pelicula
MATCH (u:User {username: "pepe"})
MERGE (m:Movie {title: "Inception"})
MERGE (u)-[:LIKES]->(m)


// Ver peliculas favoritas de un usuario
MATCH (u:User {username: "pepe"})-[:LIKES]->(m:Movie)
RETURN m.title


// Eliminar una pelicula favorita
MATCH (u:User {username: "pepe"})-[r:LIKES]->(m:Movie {title: "Inception"})
DELETE r


// Evitar peliculas duplicadas 
// Crearemos una constraint para que no se creen varias peliculas con el mismo titulo
CREATE CONSTRAINT unique_movie_title IF NOT EXISTS
FOR (m:Movie)
REQUIRE m.title IS UNIQUE


// ejemplo completo de prueba (probar)
// Crear usuario
MERGE (:User {username: "pepe", email: "pepe@email.com", password: "1234"})

// Crear película
MERGE (:Movie {title: "Inception"})

// Agregar a favoritos
MATCH (u:User {username: "pepe"})
MERGE (m:Movie {title: "Inception"})
MERGE (u)-[:LIKES]->(m)

// Ver favoritas de pepe
MATCH (u:User {username: "pepe"})-[:LIKES]->(m)
RETURN m.title