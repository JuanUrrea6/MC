#include <stdio.h>

int main(void)
{
    /*
     * Se declaran las variables que serán recibidas.
     */
    float largoPies;
    float anchoPulgadas;
    
    /*
     * Se pide al usuario el largo y ancho del área
     */
    printf("Introduzca el largo en pies:\n");
    scanf("%f", &largoPies);
    printf("Introduzca el ancho en pulgadas:\n");
    scanf("%f", &anchoPulgadas);
    
    /*
     * Se establecen las equivalencias a las unidades de Yardas
     */
    float conversionPiesYardas = 0.333;
    float conversionPulgadasYardas = 0.02777;
    
    /*
     * Se convierten los datos de entrada a Yardas.
     */
    float Yardas1 = largoPies * conversionPiesYardas;
    float Yardas2 = anchoPulgadas * conversionPulgadasYardas;
    
    /*
     * Se halla el área multiplicando.
     */
    float area = Yardas1 * Yardas2;
    
    /*
     * Se presenta el resultado.
     */
    printf("El área total en yardas es: %10.2f \n", area);
}
