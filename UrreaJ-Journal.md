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

***

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
***
También se habló de como manipular archivos de GitHub desde la terminal:
+ Creando un archivo en editor de texto: `emacs NombreArchivo`
+ Editando su contenido en el editor de texto deseado, en este caso emacs.
+ Añadiendo un commit con `git commit`
+ Añadiendolo a GitHub con `git add`
+ Actualizando GitHub con `git push origin master` 
 
| Paso | Procedimiento|
|------|--------------|
|   1  | Crear archivo de texto y editar su contenido|
|   2  | Añadir un commit|
|   3  | Añadir a GitHub |
|   4  | Actualizar GitHub |

## Sobre las Lecturas Realizadas
Se realizaron las lecturas sugeridas y, para soporte y guía, se muestra a continuación:
###Apuntes de Lectura: Pro Bash Programming
####Resumen Capítulo 1: Comandos y Conceptos Básicos
A continuación se pueden ver los **comandos** principales que se pueden utilizar en la terminal:

* **pwd:** Imprime el nombre del directorio en el que me encuentro.
* **cd:** Cambia del directorio actual al que se introduce como parámetro.

 `cd destino`
 
* **echo:** Imprime el argumento que se introduzca como parámetro.
 
 `echo "mensaje"`

* **mkdir:** Crea un nuevo directorio con nombre introducido como parámetro.

 `mkdir NombreDirectorio`
 
* **chmod:** Permite modificar los permisos que posee u archivo.

 `chmod Permisos`

* **printf:** Permite imprimir la cadena de caracteres que se de por parámetro.

 `printf "Mensaje"`

A continuación se enuncian los principales **conceptos** útiles en programación Bash:

* **Script:** Archivo que contiene comandos que son ejecutados por la terminal.
* **Comentarios:** Texto comenzado con numeral (#) el cual no es leído como código.

####Resumen Capítulo 2: Parámetros y Salidas
Existen varios tipos de parámetros que se clasifican como se muestra a continuación:

* **De Posición:** Denotan, numéricamente, la pisición de un argumento, de la forma `$1`, `$2`, etc...
* **Variables:** Parámetros que guardan un valor numérico, de carcateres, etc...

A continuación se muestran comandos que permiten modificar la presentación de los argumentos a imprimir:

| Comando | Efecto |
|---------|--------|
|`\a` | Alerta |
| `\b` | Backspace |
| `\e` | Escape Character|
| `\t` | TAB Horizontal|
| `\v` | TAB Vertical|
| `\\` | Backslash |
| `\nnn` | Caracter dado por código de 1 a 3 caracteres|
| `\xHH` | Caracter dado por código de 1 a 2 caracteres|

A continuación se muestran los comandos que se pueden utilizar para especificar el formato de los argumentos dados como entrada al comando `printf`:

| Comando | Efecto | Ejemplo |
|---------|--------|---------|
|   %s    | Imprime lo que diga el argumento | `printf "%s\n" Mensaje` |
| %d | Indica que son argumentos enteros | `printf "%d\n" 25 46 58`|
| %f | Indica que son fraccionarios | `printf "%f\n" 23.6 7.8`|
| %e | Notación Científica | `printf "%e\n"`|

A continuación se muestran los comandos que permiten administrar el espaciado en la línea de *output*:

| Comando | Efecto | Ejemplo |
|---------|--------|---------|
| `printf "%ns %-ms" Argumentos` | Organiza los alineamientos para correr cada argumento n y m espacios hacia la derecha si es positivo o izquierda si es negativo | `printf "%8s %-10:s" Mensaje` Nótese que el `:` será un caracter que estará fijo en esa posición.|
| `printf "%nd"` | Organiza la precisión de los decimales incluída. | `printf "%n.md" Argumento`|
