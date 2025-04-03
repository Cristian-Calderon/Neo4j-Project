// Para poder realizar las funcionalidades
// Vamos a necesitar basicamente tres tipos de nodos
// (:User) -> usuarios
// (:Movie) -> peliculas
// Relaciones
// (:User)-[:FRIENDS_WITH]->(:User)
// (:User)-[:LIKES]-(:Movie)
// Registro y Login
// Creacion de usuario
CREATE (:User {username: "pepe", email: "pepe@email.com", password: "secreto"})

// Registro => Comprobar si ya existe ese email o username
MATCH (u:User)
WHERE u.email = "pepe@email.com" OR u.username = "pepe"
RETURN u

// Si no devuelve nada -> puede hacer el registro
CREATE (:User {username: "pepe", email: "pepe@email.com", password: "1234"})

// Si devuelve algo -> ese mail o username ya esta en uso

// Ver todos los nodos de usuario
MATCH (u:User)
RETURN u

// Crear una constraint:
CREATE CONSTRAINT user_email_unique IF NOT EXISTS
FOR (u:User)
REQUIRE u.email IS UNIQUE


// Borrar todos los nodos User
MATCH (u:User)
DELETE u


// Insertar varias personas en una sola consulta
CREATE (:Person {nombre: "Ana", edad: 25}),
       (:Person {nombre: "Juan", edad: 26}),
       (:Person {nombre: "Luis", edad: 28}),
       (:Person {nombre: "Sofia", edad: 30}),
       (:Person {nombre: "Pedro", edad: 22})