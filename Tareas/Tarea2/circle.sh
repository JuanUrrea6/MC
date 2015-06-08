#!/bin/bash
#Método para creación del círculo

#Se inicia el uso de GNUPlot
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
    #Se muestra la gráfica.
    plot $1*sin(t),$1*cos(t)
EOF