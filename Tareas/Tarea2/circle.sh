#!/bin/bash
#Método para creación del círculo

#Se inicia el uso de GNUPlot
gnuplot << EOF
    set size square 1,1
    set key off
    unset xtics
    unset ytics
    unset border
    set term dumb
    set parametric
    set xrange[-1:1]
    set yrange[-1:1]
    set origin 0.0,0.0
    plot $1*sin(t),$1*cos(t)
EOF