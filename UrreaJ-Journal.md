###27 de Mayo de 2015
##Comandos Básicos de la Terminal
Hola, mundo. Aquí comienza el curso Métodos Computacionales del periodo vacacional 2015-19.
Herramientas del curso:

 + Git 
 + GitHub 
 + Bash 
 + C 
 + Python 

Los métodos a "estudiar" son los siguientes:

 + Interpolación
 + Análisis de Fourier
 + Diferenciación e Integración Numéricas
 + Ecuaciones Diferenciales Ordinarias
 + Ecuaciones Diferenciales Parciales

Se habló de distintas herramientas que se pueden utilizar en la terminal, como son:
 + Los comandos de AWK
  + Para elegir la enésima fila e imprimirla `awk '{print $n}' archivo`
    + n representa la fila que quiero elegir, en número.
  + Cambiar el delimitador a algo que yo quiera `awk -F"ALGO"`
    + ALGO representa el nuevo símbolo delimitador. Puede ser coma, punto, dos puntos, etc...
  + Aritmética entre columnas `awk '{print $n + $m}' archivo`
    + n y m son las filas, en número que deseo operar. Puede ser un +, -, *, etc...
  + Operaciones lógicas `awk 'if(condicion) print ALGO'`
    + La condición se representa con un boolean, y la acción, en este caso `print ALGO`, puede ser reemplazada por otra cosa.

 + El comando SED para reemplazar contenido `sed 's/ALGO1/ALGO2/g'`
  + Con este comando, se busca la presencia del caracter ALGO1 y se reemplaza por ALGO2.
 + El comando Curl para importar URL `curl URL`
  + Con este comando, se importa el código proveniente de la página web identificada con el URL dado como parámetro.

Se habló también de SSH, para el manejo remoto de máquinas. Este se muestra a continuación:
`ssh usuario@MACHINE` Con este comando, se puede realizar una conexión a la máquina denominada MACHINE.

También se habló de como manipular archivos de GitHub desde la terminal:
+ Creando un archivo en editor de texto: `emacs NombreArchivo`
+ Editando su contenido en el editor de texto deseado, en este caso emacs.
+ Añadiendo un commit con `git commit`
+ Añadiendolo a GitHub con `git add`
+ Actualizando GitHub con `git push origin master` 
