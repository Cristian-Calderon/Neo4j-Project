Instalación de Neo4j en Ubuntu
// dyslexic friendly font
Requisitos Previos

Ubuntu 20.04 o superior
Java Development Kit (JDK) 11 o superior

## Neo4j como servicio del sistema

Pasos de Instalación

1. Actualizar los repositorios del sistema
   sudo apt update
   sudo apt upgrade
2. Instalar Java (si no está instalado)
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
