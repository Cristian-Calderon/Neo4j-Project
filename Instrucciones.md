Instalación de Neo4j en Ubuntu
Requisitos Previos

Ubuntu 20.04 o superior
Java Development Kit (JDK) 11 o superior

## Neo4j como servicio del sistema

Pasos de Instalación

1. Actualizar los repositorios del sistema
   sudo apt update
   sudo apt upgrade

2. Instalar Java (si no está instalado)
   primero verifica si Java está instalado:
   java -version
   Si no está instalado, puedes instalarlo con el siguiente comando:
   sudo apt install openjdk-11-jdk

3. Importar la clave GPG de Neo4j
   wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -

4. Agregar el repositorio de Neo4j
   echo 'deb https://debian.neo4j.com stable latest' | sudo tee -a /etc/apt/sources.list.d/neo4j.list

5. Actualizar repositorios e instalar Neo4j
   sudo apt update
   sudo apt install neo4j

6. Iniciar el servicio de Neo4j
   sudo systemctl start neo4j

7. Ver el estado del servicio
   sudo systemctl status neo4j

8. Habilitar el inicio automático en el arranque
   sudo systemctl enable neo4j

9. Verificar el estado del servicio
   sudo systemctl status neo4j
   Acceso a la Consola Web

URL: http://localhost:7474

## Usuario predeterminado: neo4j

## Contraseña inicial: neo4j (se te pedirá cambiarla en el primer inicio) // cinechamp123

- La contrasena funciona

Configuración Adicional
La configuración principal se encuentra en:
/etc/neo4j/neo4j.conf
Desinstalación (si es necesario)
sudo apt remove neo4j
sudo apt autoremove

## Funciones de Neo4j

- Creacion de una nueva base de datos:

# Ventajas de Neo4j

Modelado intuitivo de datos conectados
Consultas rápidas en datos altamente relacionados
Ideal para redes sociales, recomendaciones, análisis de redes
Rendimiento superior en datos con múltiples conexiones

Introduccion neo4j
Que tipo de base de datos es
Ventajas
Explicacion de grafos
Explicacion de la sintaxis de neo4j
Ejemplos de consultas
Ejemplos de uso
Comparacion con otras bases de datos

Desventajas
Ensenar los graficos

# Funcionalidades principales

- Registro y login usuarios
- Agregar y eliminar amigos
- Buscar y agregar peliculas favoritas
- Ver las peliculas que le gustan a los amigos

# Importar desde CSV usuarios

Tenemos que copiar el csv a una ruta donde neo4j pueda acceder

```bash
/var/lib/neo4j/import
```

Una vez copia tenemos que darle permisos de ejecucion al archivo
Este ejemplo aplica a cualquier archivo csv

```bash
sudo chown neo4j:neo4j /var/lib/neo4j/import/usuarios.csv
sudo chmod 644 /var/lib/neo4j/import/usuarios.csv
```

Importar usuarios desde CSV

```bash
LOAD CSV WITH HEADERS FROM 'file:///usuarios.csv' AS row
CREATE (:User {
username: row.username,
email: row.email,
password: row.password
})
```

# Importar desde CSV amigos

Permisos de ejecucion al archivo

```bash
sudo chown neo4j:neo4j /var/lib/neo4j/import/amistades.csv
sudo chmod 644 /var/lib/neo4j/import/amistades.csv
```

Importar amigos desde CSV

```bash
LOAD CSV WITH HEADERS FROM 'file:///amistades.csv' AS row
MATCH (a:User {username: row.user1})
MATCH (b:User {username: row.user2})
MERGE (a)-[:FRIENDS_WITH]->(b)
MERGE (b)-[:FRIENDS_WITH]->(a)

```

# Importar desde CSV peliculas

Permisos de ejecucion al archivo

```bash
sudo mv /home/tuusuario/favoritos.csv /var/lib/neo4j/import/
sudo chown neo4j:neo4j /var/lib/neo4j/import/favoritos.csv
sudo chmod 644 /var/lib/neo4j/import/favoritos.csv
```

Importar peliculas desde CSV

```bash
LOAD CSV WITH HEADERS FROM 'file:///favoritos.csv' AS row
MATCH (u:User {username: row.username})
MERGE (m:Movie {title: row.title})
MERGE (u)-[:LIKES]->(m)
```
