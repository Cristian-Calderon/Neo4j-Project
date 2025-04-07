// Crear restricciones de unicidad
CREATE CONSTRAINT unique_user_nick IF NOT EXISTS
FOR (u:User)
REQUIRE u.nick IS UNIQUE;

CREATE CONSTRAINT unique_user_email IF NOT EXISTS
FOR (u:User)
REQUIRE u.email IS UNIQUE;

// Crear el nodo Usuario
CREATE (:User {nick: "pepe", email: "pepe@email.com", password: "secreto"});


// Crear otros para el ejemplo

 
// Crear un usuario (Si no existe ya)
MERGE (u:User {nick: "pepe"})
SET u.email = "pepe@email.com", u.password = "secreto";


// Verificar si existe seria hacer un Login