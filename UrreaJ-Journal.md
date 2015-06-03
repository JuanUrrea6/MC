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
###29 de Mayo de 2015
##Taller en Clase de Comandos Básicos
Se trabajó en el taller dado, donde lo primero que se hizo fue crear un documento en MarkDwon con los comandos explicados en la entrada anterior de esta bitácora. Sin embargo, también se trabajó código en BASH basado en las lecturas enviadas.

* Variables en BASH: `$variable = valor`

####Creación de loops en Bash
```
#Creación de un loop genérico
for i in {Lim1..Lim2}
 do
 #Aquí se ponen los comandos para hacer. 
 $variable = i
 printf $variable
 done
```
También se trabajó indexación. Se muestra una receta para crear números e indexarlos a un archivo.
####Indexación Genérica
```
#Método para crear n enteros e indexarlos a un archivo csv
#!/bin/bash
for i in {1..n}
 do
 printf "%d,%d\n" $i >> archivo.csv
 done
```
Continuando con el taller, se copió y descomprimió el directorio dado. Se encontró que la fecha del segundo commit realizado fue el sábado 5 de enero de 2013 a las 19:28:57. También, se sabe que el tema de la semana 15 de ese curso fue el **Método de Inferencia Bayesiana**

###Martes 2 de Junio de 2015
##Expresiones Regulares
En esta clase se explicaron caracteres que se pueden utilizar para distintos comandos de expresiones regulares.

* Comienzo de línes `^`
* Fin de línea `$`
* Intervalos `(a|b)`
* Uso de caracteres especiales como entrada. `\@`
* Buscar varios caracteres `[hfahf\@]`
* Dígitos `\d`
* NO dígitos `\D`

Se utilizó TextWrangler para copiar el archivo de los "Jovian Satellites Orbital Parameters". Con eso en ese archivo, se utilizan expresiones regulares para empezar a modificar el archivo.
Ejemplo para reemplazar espacios al comienzo de la línea por un vacío. 
`^ ` por ``
**Nota:** Para no solo seleccionar un caracter, sino todos los que se encuentren seguidos iguales, se utiliza `@+`, donde @ es el caracter deseado.
Para continuar, se aprendió el uso de GNUPLOT, iniciándolo con:
```
#Iniciando gnuplot
gnplot

#Graficar la función seno
plot sin(x)

#Gráficas paramétricas y quitarla
set parametric
unset parametric

#Gráfica paramétrica
plot sin(t),cos(t)
```

También es posible graficar utilizando datos de otros archivos.
**Ejemplo:**
`plot "archivo.csv" using columna1:columna2`

##Taller 2: GNUPlot
**Punto 1:**

Expresión regular con cuatro caracteres al comienzo de una línea y un espacio
`^... `
Aquí se utiliza `^` para indicar que se encuentran al comienzo de la línea. Luego, haciendo uso de `.` asigno cualesquiera cuatro caracteres seguidos. Por último, con el espacio se denota la presencia de un espacio ahí. Este ejemplo genérico sirve para aprender a manejar los distintos comandos para expresioens regulares, que luego podría utilizarse para búsquedas y reemplazos para modificar archivos grandes sin necesidad de modificar entrada por entrada cada una.

**Punto 3:**
Para ralizar este punto, se copia manualmente lo encontrado en la página web a un archivo de texto en TextWagler. Una vez ahí, se utiliza Ctrl-F y se introduce el siguiente código:
```
#Buscar: Con este comando, se busca una agrupación de 20 caracteres seguidos
(....................)

#Reemplazar: Con este comando se indica que la agrupación encontrada anteriormente se debe reemplazar por si mismo, pero con un enter para iniciar una nueva línea.
\1\n
```
Este método resulta importante ya que proporciona un primer acercamiento básico al manejo de datos masivos y su organización, pues al hacer la dicisión de líneas que se requería en este punto, se vuelve más entendible el contenido.
**Graficación**
Para realizar las gráficas usando GNUPlot, se utilizó el siguiente código:
```
#Con este comando, se grafican las columnas 2 y 3 del archivo seleccionado, marcando los puntos de los datos conocidos y mostrando la recta de intrpolación.
set datafile separator "," ; plot "joviansatellites.csv" using 2:3 with linesp
```
Este comando, junto con las distintas modificaciones que se le pueden aplicar, resulta bastante útil para la visualización gráfica de conjuntos de datos a analizar, al igual que para visualizar una función definida sobre un dominio y rango. Por ejemplo, es posible realizar gráficas paramétricas para análisis donde varios grupos de datos se unen por medio de una palabra.
```
#Este comando grafica un círculo parametrizado.
set parametric
plot sin(x),cos(x)
```
###3 de Junio de 2015
##Más Usos de GNUPlot
En clase se vieron más aplicaciones y usos de GNUPlot, como los que se muestran a continuación:

* Nomenclatura de Ejes
```
#En GNUPlot
set title "Títulode la Gráfica"
set xlabel "Eje X"
set ylabel "Eje Y"
```
* Estética de Gráfica
```
#En GNUPlot
plot f(x) with line
plot f(x) with linesp
```
* Regresiones

Esta aplicación es notablemente importante, pues muchos análisis de datos se basan en regresiones y comportamientos de una serie de datos.
```
#Declarar el ajuste modelo
f(x) = f(x, a, b, c)
fit f(x) "Archivo" using columna1:columna2 via a, b, c
```
Una buena guía para este procedimiento está en (http://gnuplot.sourceforge.net/docs_4.2/node82.html)
