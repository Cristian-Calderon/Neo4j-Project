// Crear restricciones para titulos unicos
CREATE CONSTRAINT unique_movie_title IF NOT EXISTS
FOR (m:Pelicula)
REQUIRE m.titulo IS UNIQUE;

CREATE CONSTRAINT unique_series_title IF NOT EXISTS
FOR (s:Serie)
REQUIRE s.titulo IS UNIQUE;




// Crear algunos titulos de peliculas y series
// Películas
CREATE (:Pelicula {titulo: "Inception"});
CREATE (:Pelicula {titulo: "The Matrix"});

// Series
CREATE (:Serie {titulo: "Breaking Bad"});
CREATE (:Serie {titulo: "Stranger Things"});



// Relacionar el usuario con peliculas y series
// Relacionar con una película
MATCH (u:User {nick: "pepe"}), (p:Pelicula {titulo: "Inception"})
MERGE (u)-[:WATCHED]->(p);

// Relacionar con una serie
MATCH (u:User {nick: "pepe"}), (s:Serie {titulo: "Breaking Bad"})
MERGE (u)-[:WATCHED]->(s);


// Buscar una pelicula y relacionarla con un usuario
MERGE (u:User {nick: "pepe"})
MERGE (p:Pelicula {titulo: "Inception"})
MERGE (u)-[:AGREGO]->(p)
RETURN u, p;

