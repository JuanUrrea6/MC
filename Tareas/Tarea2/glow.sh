#!/bin/bash
#Método para presentar círculos de radio variable.

#Se crea un radio distinto según la función dada.
gnuplot << EOF
    #Se define el tamaño de la gráfica.
    set size square 1,1
    #Se quita la leyenda.
    set key off
    #Se quitan las marcas de los ejes.
    unset xtics
    unset ytics
    #Se quitan los ejes.
    unset border
    #Se define la salida en la terminal.
    set term dumb
    #Se programa la gráfica como paramétrica.
    set parametric
    #Se define el rango de ambos ejes
    set xrange[-1:1]
    set yrange[-1:1]
    #Se situa el centro en 0,0
    set origin 0.0,0.0
    #Se declaran las variables de condición.
    i = 0
    t = 0
    #Se inicia el bucle.
    while (t == 0){
        #Se limpia la terminal
        clear
        #Se crea la función de radio.
        r = (cos(800*i))**2
        #Se presenta la gráfica y se cambian las variables.
        plot r*sin(t), r*cos(t)
        i = i + 0.001
        pause 1
    }
EOF
