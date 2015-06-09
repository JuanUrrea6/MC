#!/bin/bash
#Método para recuperar un trozo dado posiciones de incio y final.
#Se declara la primera posición tomando en cuenta la posicion 0.
lim1=$(($1 - 1))

#Se declara el número de caracteres a partir de la posición de inicio que se desean.
lim2=$(($2 - $1 + 1))

#Se obtiene el string que está contenido en el archivo.
archivo=$(cat $3)

#Se extrae el trozo del archivo deseado.
echo ${archivo:lim1:lim2}