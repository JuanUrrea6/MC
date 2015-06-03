#!/bin/bash
#Método para contar planetas totales
#Se borra el archivo anterior
rm kepler.csv

#Primero, se importa el archivo cvs
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/kepler.csv

#Se imprime el número de líneas en el archivo, corrigiendo el resultado para que sea entero.
var=$(wc -l kepler.csv | sed 's/kepler.csv//g')

#Se presenta el número de planetas.
figlet Planetas Extrasolares
echo =========================================
echo El número de planetas es:  
echo $(($var - 1))


#Método para contar planetas, con nombre, con masas menores a una centésima de la masa de Júpiter

#Se crea un archivo donde se ponen los planetas que cumplan la condición
#Se borra primero versiones anteriores
rm kepler2.txt

#Se cambia el delimitado para poder usar AWK
sed 's/,/	/g' kepler.csv | sed 's/ /-/g' >> kepler2.txt
 

#Se crea un archivo que contenga la lista de estrellas
rm prueba.txt
awk '{if ($2 < 0.01) print $1}' kepler2.txt >> prueba.txt

#Se crea la variable contadora a partir de dicho archivo creado
var2=$(wc -l prueba.txt | sed 's/prueba.txt//g')

#Se imprime el mensaje del número de planetas que cumplen la condición.
echo ============================================
echo Los planetas que tienen menos de una centésima de la masa de Jupiter son$var2 :
awk '{if (($2 < 0.01) && ($2 > 0)) print $1}' kepler2.txt

#Se eliminan archivos temporales.
rm prueba2.txt
rm prueba3.txt
rm prueba4.txt
rm prueba5.csv
rm resultado.txt

#Se selecciona la columna de periodos.
cut -d , -f 6 kepler.csv >> prueba2.txt

#Se ordena de menor a mayor.
sort -n prueba2.txt >> prueba3.txt

#Se imprime la siguiente parte del mensaje.
echo ============================================
echo El menor periodo de todos los planetas estudiados es:

#Se toma la segunda línea del archivo ordenado, ya que la primera es el header.
head -2 prueba3.txt | tail -1 >> prueba4.txt

#Se imprime el menor periodo
cat prueba4.txt

#Se busca que planeta tiene el periodo hallado.
grep $(cat prueba4.txt) kepler.csv >> prueba5.csv

#Se selecciona solo la columna de nombre del planeta.
cut -d , -f 1 prueba5.csv >> resultado.txt

#se imprime el nombre de la estrella.
echo Y el planeta que lo tiene se llama:
cat resultado.txt


 