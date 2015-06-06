#include <stdio.h>

int main(void)
{
    /*
     * Se declaran las variables que serán recibidas.
     */
    int tipo;
    int cantidad;
    
    /*
     * Se pide al usuario ingresar el tipo de producto y cantidad.
     */
    printf("Introduzca el tipo de producto (1 0 2):\n");
    scanf("%d", &tipo);
    printf("Introduzca la cantidad que desea:\n");
    scanf("%d", &cantidad);
    
    /*
     * Se declaran las constantes de precios.
     */
    float precio1 = 3.50;
    float precio2 = 5.50;
    
    /*
     * Se calcula el precio total de la compra dependiendo del tipo.
     */
    if (tipo == 1)
    {
        float precioTotal = cantidad * precio1;
        printf("El precio de la compra es: %10.2f \n", precioTotal);
    }
    
    if (tipo == 2)
    {
        float precioTotal = cantidad * precio2;
        printf("El precio de la compra es: %10.2f \n", precioTotal);
    }
    
    if ((tipo != 1) && (tipo != 2))
    {
        printf("No existe ese tipo de artículo.");
    }
}
