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
`^ ` por ` `.
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
#Se grafica con una línea
plot f(x) with line

#Se grafica con línea y puntos.
plot f(x) with linesp

#Nombrar gráfica, eje X y eje Y
set title "Título"
set xlabel "Eje X"
set ylabel "Eje Y"
```
* Regresiones

Esta aplicación es notablemente importante, pues muchos análisis de datos se basan en regresiones y comportamientos de una serie de datos.
```
#Declarar el ajuste modelo y luego realizar el fit.
f(x) = f(x, a, b, c)
fit f(x) "Archivo" using columna1:columna2 via a, b, c
```
Una buena guía para este procedimiento está en (http://gnuplot.sourceforge.net/docs_4.2/node82.html)

###Viernes 5 de Junio
##Manejo de C y Python
Se vieron más funciones básicas en el lenguaje C, como lo son la declaración de variables y métodos en C. La estructura básica de estos se muestra a continuación.
```
#include <stdio.h>
/*
* Así se comenta en C. Se crea un método básico.
*/
int main(void)
{
 /*
 * Es posible recibir variables como entrada. Primero se declaran con su tipo.
 */
 int numero1;
 
 /*
 * Luego, se pide introducirlas y se leen, enviándo el contenido a la variable declarada antes.
 */
 printf("Introduzca un número. \n")
 scanf("%d", &numero1)
 
 /*
 * Es posible luego imprimir el contenido de la variable.
 */
 printf("Usted introdujo el número:\n")
 printf(numero1)
}
```
Luego de ver más aplicaciones de C, se suponía que se investigaría sobre el comando **make** y eso se incluiría en la bitácora. Sin embargo, se cpnsideró que no había tiempo, por lo que se procedió a trabajar en el Hands-On que sería introductorio para python. Para este, se utilizó el comando que permite leer contenido dado por el usuario.

* `entrada=raw_input("Introduzca algo")` Este comando recibe una entrada del usuario y la guarda en una variable. Específicamente para la instrucción dada, fue necesario obligar a que la entrada se tomara como un entero, de la forma `numero = int(raw_input("Introduzca un número"))`

###Martes 9 de Junio
##Bases de Make
Muchas veces surge la necesidad de repetir procesos que no siempre resultan muy sencillos "a mano". Por este motivo resulta conveniente un programa que automatice este proceso con el uso de comandos específicos de cada proceso necesario para que sea independiente del usuario.

Este proceso de automatización sigue instrucciones muy específicas, como lo son objetivos, pre-requisitos y acciones. Si se traduce a lenguaje cotidiano, se podría afirmar que el archivo **make** sigue la lógica siguiente:

* Se debe hacer algo con el objetivo
* Solo se hace una vez se cumplen los pre-requisitos
* Cuando se cumplen, se deben realizar las acciones.

Es posible visualizar este razonamiento en forma de código para el archivo **.mk**.
```
#Se realiza un comentario, como siempre.
archivoObjetivo : archivoPrerequisito
 acciones a realizar
```
Una vez se ha construido el archivo, es posible ejecutarlo. Esto se hace con el comando `gmake -f archivo.mk`. Cabe notar que el ejemplo es el más sencillo que existe. Generalmente se ponen más pre-requisitos y reglas, a la vez que más acciones a realizar cuando se ejecuta el **.mk**. Para manejo de varias instrucciones que involucran muchos archivos, se crean distintas condiciones que permitan mantener un orden claro. 

###Miércoles 10 de Junio de 2015
##Manejo de MatPlotLib
Se trabajó en las diferentes funcionalidades de MatPlotLib. Para entender mejor esto, se realizaron los ejercicios sugeridos en el hands-on correspondiente a la clase. A continuación se muestra el código que permite la creación de una figura de 5x5 paneles con 25 gráficas, cada una mostrando una figura de lissajous distinta. Esta temática, al igual que el uso de la graficación estándar en Python, se exploró también en el laboratorio, donde no solo se aprendió a realizar histogramas, sino que también se realizaron ajustes de curva al histograma en si.
```
%pylab inline
from random import randint

#Se pone el estilo por defecto.
rcdefaults() 
#Se establece el tamaño de la figura.
figure(figsize=(10,10))
#Se crea el parámetro T para senos y cosenos.
t = linspace(0,6.28, 100)
#Se inicia el for para generar 25 paneles.
for i in range(25):
    #Se definen las funciones para X y Y.
    def X(h, d):
        return sin((randint(1,5))*h + d)
    def Y(h):
        return cos(randint(1,5)*h)
    #Se crea un panel
    subplot(5,5,i+1)
    #Se quita su cuadrícula.
    grid(False)
    #Se quitan los ejes.
    axis('off')
    #Se genera un desfase aleatorio.
    desfase = randint(1,3)
    #Se grafica la figura en cada panel.
    plot(X(t, desfase),Y(t))
```
Con este código en iPython Notebook se generan distintas figuras de Lissajous según indica la instrucción. Esta fue tan solo una pequeña aplicación de todas las funcionalidades de esta biblioteca de Python. El correcto manejo de esta librería permite la realización de gráficas de todo tipo, donde no solo se trabaje con puntos o líneas, sino superficies y volúmenes, lo que facilita el análisis gráfico y la visualización de resultados obtenidos después de varios cálculos.
La imagen de las 25 figuras de Lissajous que resulta de la ejecución del código anterior se muestra a continuación.

![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Lissajous.png)

###Sábado 13 de Junio de 2015
##Apuntes sobre Error e Imprecisión
Leyendo el libro de Landau acerca del manejo de Python, se obtuvieron nociones básicas de los tipos de errores que pueden aparecer a lo largo de la implementación de cálculos y algoritmos computacionales. Lo primero que se vio fueron los distintos tipos de errores, los cuales se enuncia a continuación:
* **Teóricos:** Dependen del trasfondo teórico en el cual se basa todo el procedimiento. Si estos ocurren, el procedimiento está condenado al fracaso.
*  **Aleatorios:** Debidos a eventos fuera de nuestro control, como accidentes o fenómenos aleatorios durante el experimento.
*  **Aproximación 1:** Debido a aproximaciones de procdimiento que teóricamente deberían ser infinitos, como series o integrales impropias.
*  **Aproximación 2:** Debido a las aproximaciones y redondeos decimales que realiza el computador. Al realizar varios procesos con decimales, este error se propaga notablemente.

También, además de la explicación y realización de diversos ejemplos para demostrar la presencia de errores en cálculos hechos por computador, se habló de maneras de abordarlos para poder corregirlos, o evitarlos en la medida de lo posible. Por ejemplo, se habló de como operaciones que involucran número muy grandes y numeros muy pequeños con decimales causan una gran presencia de error, pues por el orden de magnitud mayor, se desprecian los valores de orden de magnitud mucho menor. Algo similar ocurre cuando se trabajo con series, pues a mayor número de términos que se usan para dar exactitud al resultado, se pierde precisión en la suma de números de bajo orden de magnitud.

###Martes 16 de Junio de 2015
##Interpolación y Ajustes
Durante clase se aprendió el manejo básico de las funciones de ajuste como lo son **polyfit** de numpy y **curve_fit** de scipy. Para aplicar lo visto, se realizó el hands on, de donde se puede resaltar el siguiente punto.
```
%pylab inline
from scipy.optimize import curve_fit

#Creación de Arreglos
x=[2.3, 2.8, 3.2, 3.7, 4.3]
y=[34745, 19689, 12594, 7982, 5822]

u = linspace(2,5,100) #Linspace sobre el cual graficar.
def ajuste(t, m): #Definir la función modelo.
    return (((0.2)*m)/((t)**3))
fitpars, covmat=curve_fit(ajuste, x, y) #Realizar ajuste.

scatter(x, y, label = "Datos") #Plotear datos y ajuste.
plot(u, ajuste(u, *fitpars), color = "Red", label = "Ajuste Teórico", ls = "--")
xlim(2.2, 4.5)
legend()

#Intrapolación usando el valor obtenido para m (2118294.96442)
r = linspace(2.3, 4.3, 100) #Distancias a intrapolar
r2 = [] #Nuevo arreglo
for i in range(len(r)):
    actual = (423658.8)/(r[i])**3 #Obtenicón de datos
    r2.append(actual)

scatter(r,r2, color = "Green", label = "Datos Intrapolados") #Graficar os datos intrapolados
plot(u, ajuste(u, *fitpars), color = "Red", label = "Ajuste Teórico", ls = "--")
xlim(2.2, 4.5)
legend()
```
Los gráficos obtenidos al implementar este código se muestran a continuación:
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Python/Ajuste.png)
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Python/Intrapolacion.png)


###Viernes 19 de Junio de 2015
##Transformada de Fourier y Solución de Ecuaciones
En el laboratorio y magistral, se aprendió el manejo básico y las distintas formas de realizar un ajuste por series de Fourier, en específico a una función escalón de altura pi cuartos. Para lograr esto, se hicieron sumas recursivas de la función del **seno cardinal**.
Al hacer esto, se obtuvo lo siguiente:
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Material/Fourier.png)

Luego de practicar un poco más los conceptos y aplicaciones de la transformada de Fourirer, se procedió a trabajar con la solución de ecuaciones y aproximaciones. Esto se puede trabajar, en polinomios, con la función `root`. Esto se hace como se muestra a continuación:
```
from scipy.optimize import root #Se importa de la biblioteca de optimización de SciPy
def funcion(x):
     ... #Aquí se define la función o polinomio, que se busca solucionar.
raiz = root(función,0.3) #Se usa root para hallar las raíces.
print(raiz) #Se muestran los valores determinados.
```
Para poner esto en práctica, se solucionó tanto la ecuación teórica de los puntos de Lagrange de los satélites de Jupiter como su aproximación, viendo la diferencia entre las raices de ambas expresiones y determinar la validez de la aproximación.

Cabe notar también que la representación de Fourier realizada se hizo de manera manual. Sin embargo, existen ya funciones incorporadas en la Python que permiten realizar transformadas de Fourier de distintos tipos a arreglos. La segunda se implemeta en la tarea. Para representaciones específicas, como para ondas tiepo sierra o triangular, la transformada se puede realizar manualmente también, calculando los coeficientes de Fourier con `scipy.integrate`.
```
fft(array) #Transformada de fourier discreta a un arreglo de una dimensión.

fft2(array) #Transformada de fourier discreta a un arreglo de dos dimensiones.
```

###Martes 23 de Junio de 2015
## Filtros y Fourier
En la clase se trabajó con el análisis de Fourier para el análisis y filtrado de seÑales, para lo cual se realizó el Hands-On. Este se muestra a continuación.
```
%pylab inline
from scipy.fftpack import fft, ifft

datos = genfromtxt("SolarPeriod.txt", delimiter = ",") #Se importan los datos.
ano = datos[:,0] #Se separan las columnas en arreglos separados.
mes = datos[:,1]
diasUsados = datos[:,2]
media = datos[:,3]
desviacion = datos[:,4]

nuevoAno = [] #Se dividen los años por meses.
for i in range(len(ano)):
    actual = ano[i] + (mes[i] - 1)/12
    nuevoAno.append(actual)
    
plot(nuevoAno,media) #Se grafican las medias de manchas solares.
xlim(1900,1990)
ylim(0,200)
xlabel("t/año")
ylabel("manchas solares/mes")

anoCortado = nuevoAno[3480:(len(nuevoAno)-1)] #Se crea la nueva partición de los años para evitar negativos.
nuevaMedia = media[3480:(len(media) - 1)] #Nuevo arreglo recortado de medias.
N = len(nuevaMedia) #Se determinan los parámetros del análisis de Fourier.
dt = (anoCortado[-1] - anoCortado[0])/N #Salto de Tiempo "Infinitesimal"
transform = fft(nuevaMedia) #Transformada de las Medias
frecuencia = fftfreq(N,dt) #Se transforma el salto a frecuencias.
scatter(frecuencia, abs(transform)) #Se grafican para visualizar.
xlim(-6,6)
ylim(0,10000)

transform[np.abs(frecuencia) > 0.1] = 0 #Se construye el filtro.
buenas = ifft(transform) #Se devuelven las pasadas a tiempo.
plot(anoCortado, buenas) #Se grafica para visualizar/
plot(anoCortado, media[3480:(len(media) - 1)])
```
##Proyecto Final
###9 de Junio de 2015
Para el proyecto final me gustaría trabajar en un estudio de movimiento y trayectorias como el que fue mostrado en clase, haciendo uso de la creación de animaciones en Python. Considero que me sería bastante útil, ya que a la vez que amplía mi conocimiento en programación usando Python, resulta un complemento bastante bueno para mi carrera de física, en especial para el área de cosmología (que me atrae), e incluso para visualizar casos problema básicos de movimientos. Se me ocurre que sería posible simular los movimientos de cuerpos celestes o microscópicos en diferentes montajes.

###Martes 16 de Junio de 2015
Para el proyecto final sería posible, ahora que se sabe como realizar ajustes básicos a distintos tipos de curvas, la implementación de esto a distintos sets de datos, como podría ser para problemas de movimient, como se mencionó antes, o de cosmología, mi principal interés. Estas funciones podrían venir especialmente en la sección de contraste con teoría que se realice en el proyecto. Esto podría juntarse con una función que he venido investigando, **quiver()**, con la cual se pueden graficar distintos campos vectoriales, por lo que la realización de ajuste de curva podrá ayudar a visualizar el comportamiento de un movimiento bajo el efecto de dichos campos, creando un análisis gráfica bastante completo. El análisis y estudio de situaciones como la órbita de satélites sería bastante interesante cuando se toma el campo de fuerza gravitacional del cuerpo principal, los datos conocidos de posición y el ajuste para contrastar.
