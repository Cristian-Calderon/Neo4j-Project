// Para hacer la funcion login desde Neo4j
// Es simplemente buscar un nodo User con los mismos datos que ingreso el usuario(email y contrasena) y ver si existe
// Consulta cypher para hacer el "login"
MATCH (u:User {email: "pepe@email.com", password: "1234"})
RETURN u

// Hacer un login incorrecto
// Tendriamos que pasarle mal o la contrasena o el mail
MATCH (u:User {email: "pepe@email.com", password: "malacontraseña"})
RETURN u