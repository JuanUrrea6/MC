#!/bin/bash

#Método para intercambiar dos letras en archivo.
rm nuevo1.txt
rm nuevo2.txt
rm nuevo3.txt
rm nuevo4.txt

#Primero, se recibe como entrada las dos letras y el archivo a modificar.
#Para acer esto, se utiliza SED modificando las letras, añadiendo un punto y luego intercambiándolas para que no se pierda la letra secundaria.
#OJO: este método NO sirve si el archivo contiene puntos.
sed -e "s/$1/.$1/g" $3 >> nuevo1.txt
sed -e "s/$2/.$2/g" nuevo1.txt > nuevo2.txt
sed -e "s/\.$1/$2/g" nuevo2.txt >> nuevo3.txt
sed -e "s/\.$2/$1/g" nuevo3.txt >> nuevo4.txt

