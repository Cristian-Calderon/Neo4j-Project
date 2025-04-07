// Agregar una relacion de amistad entre usuarios
MATCH (u1:User {nick: "pepe"}), (u2:User {nick: "luis"})
MERGE (u1)-[:AMIGO]->(u2)
MERGE (u2)-[:AMIGO]->(u1);

// Eliminar amigos
MATCH (:User {nick: "pepe"})-[r:AMIGO]-(:User {nick: "luis"})
DELETE r;


// Buscar amigos de un usuario
MATCH (:User {nick: "pepe"})-[:AMIGO]-(friend)
RETURN friend.nick, friend.email;

// Peliculas que vieron tus amigos y vos no
MATCH (me:User {nick: "pepe"})-[:AMIGO]-(friend)-[:AGREGO]->(movie:Pelicula)
WHERE NOT (me)-[:AGREGO]->(movie)
RETURN movie.titulo AS recomendada, collect(friend.nick) AS recomendadaPor, count(*) AS veces
ORDER BY veces DESC
LIMIT 10;


// Relacionarlo manualmente (por ejemplo)
// cristianT y cristian son amigos
MATCH (a:User {nick: "cristianT"}), (b:User {nick: "cristian"})
MERGE (a)-[:AMIGO]->(b)
MERGE (b)-[:AMIGO]->(a);

// cristianT y cristianCalderon
MATCH (a:User {nick: "cristianT"}), (b:User {nick: "cristianCalderon"})
MERGE (a)-[:AMIGO]->(b)
MERGE (b)-[:AMIGO]->(a);

// pepe y cristian
MATCH (a:User {nick: "pepe"}), (b:User {nick: "cristian"})
MERGE (a)-[:AMIGO]->(b)
MERGE (b)-[:AMIGO]->(a);



