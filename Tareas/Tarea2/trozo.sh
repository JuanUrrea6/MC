#!/bin/bash
#Método para recuperar un trozo dado posiciones de incio y final.
lim1=$1
lim2=$(($2 - $1 + 1))
archivo=$(cat $3)
echo ${archivo:lim1:lim2}