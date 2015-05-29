###27 de Mayo de 2015
##Comandos Básicos de la Terminal
Hola, mundo. Aquí comienza el curso Métodos Computacionales del periodo vacacional 2015-19.
Herramientas del curso:

 + Git 
 + GitHub 
 + Bash 
 + C 
 + Python 

Los métodos a "estudiar" son los siguientes:

 + Interpolación
 + Análisis de Fourier
 + Diferenciación e Integración Numéricas
 + Ecuaciones Diferenciales Ordinarias
 + Ecuaciones Diferenciales Parciales

***

Se habló de distintas herramientas que se pueden utilizar en la terminal, como son los comandos en AWK:
````
#Elegir la n-sima fila e imprimirla de un archivo
awk '{print $n}' archivo

#cambiar el delimitador en un archivo. Se cambia a algo nuevo.
awk -F"ALGO"

#Operaciones entre columnas de un archivo. Se muestra la suma, pero puede ser cualquier otra operación.
awk '{print $n + $m}' archivo

#Operaciones lógicas. La acción puede ser reemplazada por la que se requiera.
awk 'if(condicion) print ALGO'
````

También se habló del uso del comando SED y CURL:
```
#Se toma ALGO1 y se reemplaza po ALGO2
sed 's/ALGO1/ALGO2/g'

#Importar código de una URL
curl URL

#Conexión remota con SSH a una máquina llamada machine
ssh usuario@MACHINE
````

Otros comando bastante útiles son aquellos para el desplazamiento y manipulación de archivos en la terminal
```
#Crear un archivo de texto.
nombreEditor nombreArchivo

#Moverse a un directorio
cd nombreDiectorio

#Ver los contenidos del directorio
ls

#Enviar archivo a un destino
archivo1 > archivo2
````
***
También se habló de como manipular archivos de GitHub desde la terminal:
```
#Crear archivo en editor de texto y editarlo.
emacs NombreArchivo

#Añadir el commit correspondiente.
git commit

#Añadiendo a GitHub
git add

#Actualizando Github
git push origin master

#También se puede extraer el repository de GitHub
git pull origin master
```
 En resumen:
 
| Paso | Procedimiento|
|------|--------------|
|   1  | Crear archivo de texto y editar su contenido|
|   2  | Añadir un commit|
|   3  | Añadir a GitHub |
|   4  | Actualizar GitHub |

Para recordar también un ejemplo realizado en clase, se muestran algunos método importantes para lo visto.
####Imprimir en Pantalla Mensajes Simples
````
echo "mensaje"
````
####Imprimir en Pantalla Mensaje Complejos de String
```
printf "%s\n" Mensaje
````
Cabe notar que ambas formas se pueden utilizar en la consola de Mac, aunque con el comando `printf` se pueden hacer cosas más interesantes, como organizar espaciado o la precisión de decimales.

####Creación de un ejecutable genérico
En un editor de texto, insertar los comandos correspondientes:
````
echo "Mensaje"
````
Este archivo de texto, sin formato, se guarda con la terminación **.sh**. Una vez ya se ha guardado, se debe usar la terminal para modificar los permisos del ejecutable. Luego, se procede a ejecutarlo.
````
#Manejo de permisos
sudo chmod 700 archivo.sh

#Ejecución del archivo
./archivo.sh
````

####Creación de un Nuevo Repositorio
Para crear un nuevo repositorio, se crea su nombre en GitHub y luego se utiliza la terminal como se indica:

```
#Crear el archivo readme
touch README.md

#Inicializar Git
git init

#Añadir el archivo readme
git add README.md

#AÑadir el primer commit
git commit -m "comentario"

#Añadir un origen para subir todo
git remote add origin https://github.com/LuchoCastillo/Repositorio.git

#Indexar el archivo al origen creado
git push -u origin master
```
