#Taller 7 - Caos
*Métodos Computacionales - Laboratorio*

01-Jul-2015 & 03-Jul-2015

## El Atractor de Rössler X 10 ✵

El [sistema de Rössler](https://en.wikipedia.org/wiki/R%C3%B6ssler_attractor) es un sistema de ecuaciones diferenciales lineales que presenta comportamiento caótico. Las ecuaciones que definen al sistema son:

![](https://upload.wikimedia.org/math/7/b/8/7b8101ee4d46234d6ce0db24c1974a7a.png? raw=true =350x).

Siendo a, b y c parámetros.

1. ✵✵ Resuelva las ecuaciones diferenciales para

  ```
  a = b = 0.1,
  c = 14,
  ```
  y t en el intervalo [0,600.].

  Haga una gráfica de la trayectoria en 3D usando  `mpl_toolkits.mplot3d` y otra que sea una proyección sobre el plano `xy`.

  ![](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/3dRossler.png? raw=true =350x)

  ![](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/2dRossler.png? raw=true =350x)

2. ✵✵ A continuación reproduzca el siguiete panel de gráficas (a su vez reproducido del artículo en Wikipedia sobre el sistema). En ello resuelva las ecuaciones diferenciales dejando `a=b=0.1` y resolviendo para el array de tiempos `np.linspace(0,600,10000)` eliminando los 2000 primeros puntos (el transiente).

  ![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/panel.png? raw=true =350x)

3. ✵✵✵ Ahora construya el diagrama de bifurcación para una [sección de Poincaré](https://en.wikipedia.org/wiki/Poincar%C3%A9_map) aproximada por las condiciones: abs(x)<=1 and y >= 0. Tome `a=b=0.1` y modifique `c` entre 1 y 45. Al igual que en el anterior ejercicio elimine 2000 puntos para descartar el transiente.

  ![](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/Rosslerbifurcation.png? raw=true =350x)

4. ✵✵✵ Finalmente haga una animación que de cuenta de la estructura tridimiensional del atractor. **No** utilice `mpl_toolkits.mplot3d`, haga proyecciones sobre los siguientes planos:

  P(θ):={[x,y,z], n=[cos(45º) cos(θ), cos(45º) sin(θ), sin(45º) ] | [x,y,z].n = 0}

  Estos planos están generados por el siguiente par de vectores ortonormales:

  n1(θ) = [-sin(θ), cos(θ), 0]

  n2(θ) = [-cos(45º)cos(θ), -cos(45º)sin(θ), sin(45º)].

  El resultado debe ser similar a [este](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/raw/master/2015-V/actividades/talleres/Taller6/RosslerAnimation.mp4). Para ello tome los mismos parámetros que en el primer ejercicio duplicando el número de puntos y dejando solo los últimos 40000.

##Solución
Para solucionar este taller, se implementó el código que está en este notebook:
https://github.com/JuanUrrea6/MC/blob/master/Talleres/Material/Taller7.ipynb

###Punto 1:

```
%pylab inline
from scipy.integrate import *
from mpl_toolkits.mplot3d import Axes3D

#Se declaran las constantes correspondientes a este atractor.
a=0.1
b=0.1
c=14
def func(Y,t): #Se define la ecuación diferencial a resolver.
    return np.array([(-Y[1]-Y[2]),Y[0]+a*Y[1],b + Y[2]*(Y[0] - c)]) 
    
tiempos = linspace(0, 600, 10000) #Se declara el arreglo de tiempos sobre el cual resolver.
#se utiliza ODEint para resolver las ecuaciones.
funsol,others=odeint(func,[1.,0.,1.],tiempos,full_output=True,printmessg=True)
#Se grafican las soluciones sobre el arreglo de tiempo dado.
fig = figure(figsize=(10,10))
ax = fig.gca(projection='3d')
ax.plot(funsol[:,0],funsol[:,1],funsol[:,2])
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_zlabel("z")
ax.set_title("Atractor de Rossell")
show()
```
![](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/3D.png)
```
#Se grafica la proyección vista desde Z.
figure(figsize=(10,10))
plot(funsol[:,0], funsol[:,1])
title("Atractor de Rossell\nProyección en 2D")
```
![](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/2D.png)
```
#Distintos valores de C
figure(figsize=(10,10))
tiempos2 = linspace(0, 600, 10000)
arregloC = [4, 6, 8.5, 8.7, 9, 12, 12.6, 13, 18]
for i in range(len(arregloC)):
    global a
    global b
    global c
    global tiempos
    def func(Y,t): #Sobre el ciclo se solucionan las ecuaciones.
        return np.array([(-Y[1]-Y[2]),Y[0]+a*Y[1],b + Y[2]*(Y[0] - arregloC[i])])
    funsol,others=odeint(func,[1.,0.,1.],tiempos,full_output=True,printmessg=True)
    #Se grafican en los paneles.
    subplot(3,3, i + 1)
    plot(funsol[:, 0][-8000:], funsol[:,1][-8000:])
    title("C={0}".format(arregloC[i]))
```
![](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Paneles.png)
```
buenas = [] #Se crean los arreglos que se graficarán.
constantes = []
tiempos2 = linspace(0, 600, 10000)
arregloC1 = linspace(1, 45, 200)
for i in range(len(arregloC1)): #Se itera sobre los distintos valores de C.
    global a #Traer las variables globales para la ecuación diferencial.
    global b
    global tiempos2
    def func(Y,t):
        return np.array([(-Y[1]-Y[2]),Y[0]+a*Y[1],b + Y[2]*(Y[0] - arregloC1[i])])
    funsol,others=odeint(func,[1.,0.,1.],tiempos2,full_output=True,printmessg=True)
    funsol2 = funsol[-8000:] #Eliminar estado transiente.
    FunX = funsol2[:,0] #Tomar las dos columnas.
    FunY = funsol2[:,1]
    for j in range(len(FunY)):
        if(abs(FunX[j]) <= 1): #Verificar condiciones del área transversal.
            if(FunY[j] >= 0):
                constantes.append(arregloC1[i]) #Actualizar arreglos.
                buenas.append(FunY[j])
  figure(figsize=(10,5)) #Graficar la bifurcación.
plot(constantes, buenas, "o", ms = 1)
title("Rossler System: Bifurcation Diagram\n a=b=0.1")
xlabel("C")
savefig("Bifurcation.png")
```
![](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Bifurcation.png)
```
#Realizar animación
tiempos = linspace(0, 600, 20000)
funsol,others=odeint(func,[1.,0.,1.],tiempos,full_output=True,printmessg=True)
arregloX = funsol[:,0][-4000:] #Crear los arreglos de soluciones.
arregloY = funsol[:,1][-4000:]
arregloZ = funsol[:,2][-4000:]
#Se definen los vectores unitarios para cada ángulo deseado. Se hace de 0 a 2 pi cada pi/4
unitario10 = np.array([-sin(0), cos(0), 0])
unitario20 = np.array([-cos(pi/4)*cos(0), -cos(pi/4)*sin(0), sin(pi/4)])
unitario190 = np.array([-sin(pi/2), cos(pi/2), 0])
unitario290 = array([-cos(pi/4)*cos(pi/2), -cos(pi/4)*sin(pi/2), sin(pi/4)])
unitario145 = array([-sin(pi/4), cos(pi/4), 0])
unitario245 = array([-cos(pi/4)*cos(pi/4), -cos(pi/4)*sin(pi/4), sin(pi/4)])
unitario1135 = array([-sin(3*pi/4), cos(3*pi/4), 0])
unitario2135 = array([-cos(pi/4)*cos(3*pi/4), -cos(pi/4)*sin(3*pi/4), sin(pi/4)])
unitario1180 = array([-sin(pi), cos(pi), 0])
unitario2180 = array([-cos(pi/4)*cos(pi), -cos(pi/4)*sin(pi), sin(pi/4)])
unitario1225 = array([-sin(5*pi/4), cos(5*pi/4), 0])
unitario2225 = array([-cos(pi/4)*cos(5*pi/4), -cos(pi/4)*sin(5*pi/4), sin(pi/4)])
unitario1270 = array([-sin(3*pi/2), cos(3*pi/2), 0])
unitario2270 = array([-cos(pi/4)*cos(3*pi/2), -cos(pi/4)*sin(3*pi/2), sin(pi/4)])
unitario1315 = array([-sin(7*pi/4), cos(7*pi/4), 0])
unitario2315 = array([-cos(pi/4)*cos(7*pi/4), -cos(pi/4)*sin(7*pi/4), sin(pi/4)])
#Se definen los arreglos para luego ser graficados.
nuevoX0 = []
nuevoY0 = []
nuevoX90 = []
nuevoY90 = []
nuevoX45 = []
nuevoY45 = []
nuevoX1135 = []
nuevoY1135 = []
nuevoX180 = []
nuevoY180 = []
nuevoX225 = []
nuevoY225 = []
nuevoX270 = []
nuevoY270 = []
nuevoX315 = []
nuevoY315 = []
for i in range(4000):
    #Se define el vector compuesto de cada elemento de cada solución.
    vector = array([arregloX[i], arregloY[i], arregloZ[i]])
    #Se definen las distintas proyecciones por productos punto.
    actualX0 = sum(vector*unitario10)
    actualY0 = sum(vector*unitario20)
    actualX90 = sum(vector*unitario190)
    actualY90 = sum(vector*unitario290)
    actualX45 = sum(vector*unitario145)
    actualY45 = sum(vector*unitario245)
    actualX135 = sum(vector*unitario1135)
    actualY135 = sum(vector*unitario2135)
    actualX180 = sum(vector*unitario1180)
    actualY180 = sum(vector*unitario2180)
    actualX225 = sum(vector*unitario1225)
    actualY225 = sum(vector*unitario2225)
    actualX270 = sum(vector*unitario1270)
    actualY270 = sum(vector*unitario2270)
    actualX315 = sum(vector*unitario1315)
    actualY315 = sum(vector*unitario2315)
    #Se actualizan los arreglos sobre el ciclo.
    nuevoX0.append(actualX0)
    nuevoY0.append(actualY0)
    nuevoX90.append(actualX90)
    nuevoY90.append(actualY90)
    nuevoX45.append(actualX45)
    nuevoY45.append(actualY45)
    nuevoX1135.append(actualX135)
    nuevoY1135.append(actualY135)
    nuevoX180.append(actualX180)
    nuevoY180.append(actualY180)
    nuevoX225.append(actualX225)
    nuevoY225.append(actualY225)
    nuevoX270.append(actualX270)
    nuevoY270.append(actualY270)
    nuevoX315.append(actualX315)
    nuevoY315.append(actualY315)
#presentar las distintas rotaciones en un panel.
figure(figsize=(10,5))
ax1 = plt.subplot2grid((2,4), (0,0), colspan=1)
plot(nuevoX0, nuevoY0)
xlim(-70,80)
ylim(-50,200)
axis('off')
ax2 = plt.subplot2grid((2,4), (0,1), colspan=1)
plot(nuevoX45, nuevoY45)
xlim(-70,80)
ylim(-50,200)
axis('off')
ax3 = plt.subplot2grid((2,4), (0,2), colspan=1)
plot(nuevoX90, nuevoY90)
xlim(-70,80)
ylim(-50,200)
axis('off')
ax4 = plt.subplot2grid((2,4), (0,3), colspan=1)
plot(nuevoX1135, nuevoY1135)
xlim(-70,80)
ylim(-50,200)
axis('off')
ax4 = plt.subplot2grid((2,4), (1,0), colspan=1)
plot(nuevoX180, nuevoY180)
xlim(-70,80)
ylim(-50,200)
axis('off')
ax5 = plt.subplot2grid((2,4), (1,1), colspan=1)
plot(nuevoX225, nuevoY225)
xlim(-70,80)
ylim(-50,200)
axis('off')
ax6 = plt.subplot2grid((2,4), (1,2), colspan=1)
plot(nuevoX270, nuevoY270)
xlim(-70,80)
ylim(-50,200)
axis('off')
ax7 = plt.subplot2grid((2,4), (1,3), colspan=1)
plot(nuevoX315, nuevoY315)
xlim(-70,80)
ylim(-50,200)
axis('off')
#savefig("Rotaciones.png")
```
![](https://raw.githubusercontent.com/JuanUrrea6/MC/master/Talleres/Material/Rotaciones.png)
