// Estructura de la amistad en Neo4j

(:User)-[:FRIENDS_WITH]->(:User)
// Como es una amistad bidireccional, vamos a crear la relacion en ambos sentidos

// Agregar amigos
// Consulta Cypher
MATCH (a:User {username: "pepe"}), (b:User {username: "maria"})
MERGE (a)-[:FRIENDS_WITH]->(b)
MERGE (b)-[:FRIENDS_WITH]->(a)


// Esto aseguro que : pepe es amigo de maria, maria es amigo de pepe
// Y NO SE CREAN DUPLICADOS SI YA SON AMIGOS


// Eliminar amigos
MATCH (a:User {username: "pepe"})-[r:FRIENDS_WITH]-(b:User {username: "maria"})
DELETE r


// Ver amigos de amigos

MATCH (u:User {username: "pepe"})-[:FRIENDS_WITH]->(friend)
RETURN friend.username



// Ejemplo practico
// Crea 2 usuarios si no los tienes
MERGE (:User {username: "pepe", email: "pepe@email.com", password: "1234"})
MERGE (:User {username: "maria", email: "maria@email.com", password: "abcd"})

// Agregar amistad 
MATCH (a:User {username: "pepe"}), (b:User {username: "maria"})
MERGE (a)-[:FRIENDS_WITH]->(b)
MERGE (b)-[:FRIENDS_WITH]->(a)


// Ver amigos de pepe
MATCH (u:User {username: "pepe"})-[:FRIENDS_WITH]->(friend)
RETURN friend.username

// Eliminar amistad:
MATCH (a:User {username: "pepe"})-[r:FRIENDS_WITH]-(b:User {username: "maria"})
DELETE r