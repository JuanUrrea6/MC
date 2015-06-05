#!/usr/bin/python
# -*- coding: <ascii> -*-
#Solucion de ejercicios propuestos
print("Create a program that reads two integers, a and b, from the user. Your program should compute and display:")
print("The sum of a and b")
print("The difference when b is subtracted from a")
print("The product of a and b")
#Se crean las entradas
entrada1=int(raw_input("Introduzca un entero "))
entrada2=int(raw_input("Introduzca un entero "))

#Se imprime el resultado
print ("El resultado de la suma es: ")
print (entrada1 + entrada2)
print ("El resultado de la resta es")
print (entrada2 - entrada1)
print ("El resultado del producto es")
print (entrada1 * entrada2)
