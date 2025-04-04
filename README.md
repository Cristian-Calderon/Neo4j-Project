# Instalacion de neo4j en Ubuntu

Requisitos previos:

- Ubuntu 20.04 o superior
- Java Development Kit (JDK) 11 o superior

## Neo4j como servicio del sistema

Para lograr la instalacion sigue con los siguientes pasos:

1. Actualizar los repositorios del sistema.

```bash
sudo apt update
sudo apt upgrade
```

2. Instalar Java (Si no esta instalado)
   Primero verifica si Java esta instalado:

```bash
java --version
```

Si no esta instalado, puedes instalarlo con el siguiente comando:

```bash
sudo apt install openjdk-11-jdk
```

3. Importar la clave GPG de Neo4j:
   La clave GPG (GNU Privacy Guard) es un componente de seguridad importante en la instalcion de Neo4j, es una firma digital que verifica la autenticacion del software.

```bash
wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
```

4. Agregar el repositorio de Neo4j

```bash
echo 'deb https://debian.neo4j.com stable latest' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
```

5. Actualizar repositorio e instalar Neo4j

```bash
sudo apt update
sudo apt install neo4j
```

6. Iniciar el servicio de Neo4j

```bash
   sudo systemctl start neo4j
```

7. Ver el estado del servicio

```bash
   sudo systemctl status neo4j
```

## Iniciar Neo4j

Un concepto tan repetido en el mundo tech es la base de datos por su concepto tan abstracto pero gracias a **Neo4j Browser**, podemos ver los nodos de manera mas grafica, para eso tenemos que ir a la siguiente URL: http://localhost:7474

El usuario por defecto en Neo4j es : `neo4j` y la contraseña `neo4j` que te pedira cambiarla la primera vez que inicies.

### Las funciones principales del proyecto

- [x] Registro y login usuarios
- [x] Agregar y eliminar amigos
- [x] Buscar y agregar peliculas favoritas
- [x] Ver las peliculas que le gustan a los amigos

### Creacion de Nodo Usuario

```json
CREATE (:User{
username: "pepe",
email:"pepe@email.com",
password: "secreto"
})
```

### Importar desde CSV usuarios

Tenemos que copiar el csv a una ruta donde neo4j pueda acceder esta ruta es :

```bash
/var/lib/neo4j/import
```

Una vez copiada tenemos que darle permisos de ejecucion al archivo
Este ejemplo aplica a cualquier archivo csv:

```bash
sudo  chown  neo4j:neo4j  /var/lib/neo4j/import/usuarios.csv
sudo  chmod  644  /var/lib/neo4j/import/usuarios.csv
```

Importar usuarios desde CSV:

```bash
LOAD  CSV  WITH  HEADERS  FROM 'file:///usuarios.csv'  AS  row
CREATE (:User {
username:  row.username,
email:  row.email,
password:  row.password
})
```

## Desistalar Neo4j

Si necesitas desistalar Neo4j

```bash
sudo apt remove neo4j
sudo apt autoremove
```
