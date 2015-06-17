#Taller 4
*Métodos Computacionales - Laboratorio*

17-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller4/. No olvide al final hacer un *commit* y un *push*.

# interpolación

1. Del segundo capítulo del [libro de Scherer](http://link.springer.com.ezproxy.uniandes.edu.co:8080/book/10.1007\%2F978-3-642-13990-1) resuelva los literales c y d del problema 2.1.

2. Leer del libro [Numerical Methods and Optimization](http://ezproxy.uniandes.edu.co:8080/login?url=http://dx.doi.org/10.1007/978-3-319-07671-3) de *Eric Walter* los ejemplos de la sección 5.2: *Computer experiments*, *Prototyping* y *Mining surveys*.  

3. La implementación de cierto algoritmo necesita puntos uniformemente muestreados pero los datos que se tienen son los mostrados en la tabla de abajo. Produzca una nueva tabla con el mismo número de líneas pero con muestreo uniforme usando un *cubic spline* .

	| x        | y           |
| ------------- | ------------- |
|0.138490669327|2.30060161547|
|0.153824397539|2.31193402603|
|0.229578204444|2.30212660197|
|0.266435179672|2.25835963399|
|0.276929414769|2.24136088402|
|0.334159056347|2.11468161418|
|0.383612191183|1.96176872424|
|0.446434890218|1.71619353619|
|0.541989923364|1.25473903911|
|1.33433323552|-1.434111205|
|1.44538290595|-1.20791779482|
|1.51883847305|-0.991229025177|
|1.6057389642|-0.687154743681|
|1.74396177688|-0.152610073833|
|1.87038245824|0.324964643125|
|2.30863773381|1.31618219677|
|2.38628525713|1.37058691008|
|2.46587111271|1.4006163649|
|2.65137821271|1.41356286272|
|2.75152244191|1.41133466756|
|2.82756611885|1.41289890942|
|4.19566321688|0.0396966472625|
|4.3105185461|-0.0681282942773|
|4.45641816306|-0.0704087548339|

##Solución
```
%pylab inline
from scipy.optimize import curve_fit
from scipy.interpolate import interp1d
from scipy.interpolate import lagrange

###Punto 1

x = linspace(0,2*pi, 100) #Se crea el linspace sobre el cual se grafica.
p = [0, pi/2, pi, 3*pi/2, 2*pi] #Los valores a intrapolar
seno = [sin(0), sin(pi/2), sin(pi), sin(3*pi/2), sin(2*pi)] #Los senos de los valores

scatter(p, seno, label = "Datos") #Se grafica para visualizar
title("Datos a Intrapolar en Seno")
xlabel("Valor en X")
ylabel("Seno(x)")
legend()
```
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Imagen1.png)
```
Intrapolación Cúbica

#Intrapolación Cúbica usando interp1d.
funcionSeno = interp1d(p, seno, kind='cubic')
scatter(p, seno) #Se grafican los datos y la intrapolación.
plot(x, funcionSeno(x), color = "Red")
```
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Imagen2.png)
```
Se puede observar que el ajuste cúbico realizado se ajusta de manera apropiada. Ahora, se obtienen los valores intrapolados para los números dados.
print("Valores Intrapolados", funcionSeno(0), funcionSeno(pi/2), funcionSeno(pi), funcionSeno(3*pi/2), funcionSeno(2*pi))
print("Valores Teóricos",sin(0), sin(pi/2), sin(pi), sin(3*pi/2), sin(2*pi))
Se puede observar en el arreglo obtenido la similitud entre los valores teóricos y los valores obtenidos por la intrapolación.

Intrapolación Polinómica
#Ajuste Polinomial de Lagrange
x3 = [0, pi/2, pi, 3*pi/2, 2*pi]
senos = [sin(0), sin(pi/2), sin(pi), sin(3*pi/2), sin(2*pi)]
print("Polinomio de mejor Ajuste")
print(lagrange(x3,senos))
El polinomio mostrado, de grado 4, es, según el método de interpolación de lagrange, el que mejor se ajusta a los datos dados del seno de x.
def funcion(x): #Se construye el polinomio dado por lagrange.
    return ((-1.676*10**-18)*x**4 + 0.086*x**3 - 0.8106*x**2 +1.698*x)
t = linspace(0,7,100)
scatter(x3,senos, label = "Datos de Seno") #Se grafican los datos para visualizar la intrapolación.
plot(t, funcion(t), color = "Red", ls = "--", label = "Ajuste Polinómico")
title("Intrapolación Polinómica")
xlabel("Valor en X")
ylabel("Seno(x)")
legend(bbox_to_anchor=(0.5,1))
```
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Imagen3.png)
```
print("Datos Intrapolados",funcion(0), funcion(pi/2), funcion(pi), funcion(3*pi/2), funcion(2*pi))
print("Datos Teóricos",sin(0), sin(pi/2), sin(pi), sin(3*pi/2), sin(2*pi))
En los arreglos anteriores es posible ver la similitud entre los valores interpolados y los valores teóricos del seno de los puntos.

Ajuste Lineal
#Ajuste Lineal
o = linspace(0,2*pi,100)
linea=interp1d(x3,senos)
scatter(x3,senos)
plot(o, linea(o), color = "Red", ls = "--", label = "Ajuste Lineal")
title("Intrapolación Lineal")
xlabel("Valor en X")
ylabel("Sen (x)")
```
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Imagen4.png)
```
print("Valores Intrapolados",linea(0), linea(pi/2), linea(pi), linea(3*pi/2), linea(2*pi))
print("Valores teóricos", sin(0), sin(pi/2), sin(pi), sin(3*pi/2), sin(2*pi))
En los arreglos anteriores es posible ver la similitud entre los valores intrapolados y los teóricos del seno de los valores analizados.

Estudio de los Escalones
r = [-3, -2, -1, 0, 1, 2, 3]
pulso = [0,0,0,1,0,0,0]
escalon=[0,0,0,1,1,1,1]

#Se busca realizar ajuste.
print(lagrange(r, escalon))
def ajusteEscalon(x): #Se construye el ajuste sugerido.
    return -0.01389*x**6 + 0.008333*x**5 + 0.1944*x**4 - 0.125*x**3 - 0.6806*x**2 + 0.6167*x + 1
z = linspace(-4, 4, 100) #Se grafica para ver las oscilaciones
scatter(r, escalon)
plot(z, ajusteEscalon(z))
```
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Imagen6.png)
###Punto 2
```
datos = genfromtxt("intrapolar.txt", delimiter=",") #Se obtienen los valores de la tabla
x = datos[:,0] #Se separan en 2 listas
y = datos[:,1]
f = linspace(0.138490669327, 4.45641816306, 100) #Linspace sobre el cual iterar.
ajusteDatos = interp1d(x, y, kind='cubic') #Se realiza la intrapolación.
scatter(x, y) #Se grafica para visualizar
plot(f, ajusteDatos(f))
```
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Imagen7.png)
```
h = linspace(0.14,4.44,24) #Valores a analizar.
y = ajusteDatos(h) #Valores intrapolados espaciados igualmente.
scatter(h, y, label = "Datos Intrapolados") #Se grafican para visualizar.
title("Intrapolación Cúbica")
xlabel("Valor en X")
ylabel("Valor en Y")
legend()
print("Datos Intrapolados")
print(y)
```
![alt text](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Imagen8.png)
