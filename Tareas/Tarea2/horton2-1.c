#include <stdio.h>

int main(void)
{
    /*
     * Se declara la variable que se recibirá.
     */
    float distancia;
    
    /*
     * Se pide al usuario que introduzca un valor en pulgadas.
     */
    printf("Introduzca una distancia en pies: \n");
    scanf("%f", &distancia);
    
    /*
     * Se establece la constante de conversión pulgada-pie, pulgada-yarda y pulgada-pulgada.
     */
    const float conversionPie = 0.0833;
    const float conversionYarda = 0.02777;
    const int conversionPulgada = 1;
    
    /*
     * Se crea el método para devolver los tres valores. Para hacer esto, se multiplica la distancia por la equivalencia dada.
     */
    float pies= distancia * conversionPie;
    float yardas = distancia * conversionYarda;
    float pulgadas = distancia * conversionPulgada;
    printf("La distancia en pies es: %f \n", pies);
    printf("La distancia en yardas es: %f \n", yardas);
    printf("La distancia en pulgadas es: %f \n", pulgadas);
    
    return 0;
}
