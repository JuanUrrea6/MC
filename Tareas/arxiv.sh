#!/bin/bash
#Método para la búsqueda de artículos
#Se borran los archivos temporales para no gastar memoria.
rm fuente.txt
rm tema.txt
rm encontrado.txt
rm titulos.txt
rm final.txt

#Se obtiene el código fuente.
curl -s http://arxiv.org/list/gr-qc/new >> fuente.txt

#Se buscan todos los títulos
grep Title fuente.txt >> titulos.txt

#Tema buscado
echo $1 >> tema.txt

#Se buscan los títulos que contengan la palabra clave.
grep -i $(cat tema.txt) titulos.txt >> encontrado.txt

#Se quita todo el código para solo dejar los títulos útiles.
sed 's/<span\ class="descriptor">Title:<\/span>\ //g' encontrado.txt > final.txt

#Se crea una variable que contenga el número de titulos.
conteo=$(wc -l final.txt | sed 's/final.txt//g')

#Presentación de los resultados.
figlet arXiv
echo ======================================
echo Searching the arxiv for the new stuff
echo http://arxiv.org/list/gr-qc/new
echo ======================================
echo Keyword: $1 
echo ======================================
echo Articles found: $conteo
cat final.txt