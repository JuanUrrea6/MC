#!/bin/bash
#Método para presentar círculos de radio variable.

#Se crea la variable iterante.
x=0
y=0

#Se crea el loop infinito.
while (y==0)
do
#Se limpia la terminal.
clear
#Se usa bc para calcular el coseno cuadrado de la variable iterante.
r1=$(echo "(c($x))^2" | bc -l)
#Se utiliza circle.sh para generar el círculo.
./circle.sh $r1
#Se esperan 0.3 segundos entre cada iteración.
sleep 0.2
#Se avanza en la variable iterante.
x=$(echo "$x + 0.1" | bc -l)
done

