#!/bin/bash
#Método para análisis histórico:
#Se eliminan archivos temporales.
rm hyg.csv
rm worldhistory.tsv

#Se importa el archivo CSV de internet
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/hyg.csv

#Se importa el archivo TSV de internet
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/worldhistory.tsv 

#Se crea un método que halle las coincidencias dado un año como parámetro.
#Se borran los archivos temporales.
rm eventos.txt
rm ano.txt
rm lineas.txt

sed 's/	/:/g' worldhistory.tsv > worldhistory.txt
echo $1 >> ano.txt
grep $(cat ano.txt) worldhistory.txt >> lineas.txt
cut -d : -f 2 lineas.txt >> eventos.txt

#Presentación de los resultados.
figlet STARDATE
echo ==============================
figlet $1
echo ==============================
echo Year: $1
cat eventos.txt

#Crear el método para dar info de las estrellas.
#Borrar archivos temporales.
rm distancia.txt

cut -d , -f 8-10 hyg.csv >> distancia.txt

#Declaración de límites.
dato1=$((2015 - $1))
dato2=$(($((2015 - $1))-1))

#Eliminación de variables temporales.
rm estrellasOK1.txt
rm estrellasOK2.txt
rm distancia2.txt

#Hallar las coincidencias y con esto los datos de declinación y ascensión recta.
sed 's/,/	/g' distancia.txt > distancia2.txt
awk -v dato1=$((2015 - $1)) '{if ($3 > dato1) print $1, $2, $3}' distancia2.txt >> estrellasOK1.txt
awk -v dato2=$(($((2015 - $1)) + 1)) '{if ($3 < dato2) print $1, $2}' estrellasOK1.txt >> estrellasOK2.txt

#Presentación de resultados.
echo Look at the following stars:
echo RA 		DEC 
head -1 estrellasOK2.txt | tail -1
head -2 estrellasOK2.txt | tail -1
head -3 estrellasOK2.txt | tail -1
head -4 estrellasOK2.txt | tail -1
head -5 estrellasOK2.txt | tail -1

