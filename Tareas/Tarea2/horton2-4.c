#include <stdio.h>

int main(void)
{
    /*
     * Se declaran las variables que serán solicitadas.
     */
    float pagoSemanal;
    float horas;
    
    /*
     * Se piden los valores al usuario.
     */
    printf("Introduzca su pago semanal en dólares: \n");
    scanf("%f", &pagoSemanal);
    printf("Introduzca sus horas trabajadas: \n");
    scanf("%f", &horas);
    
    /*
     * Se expresan las equivalencias constantes.
     */
    float semanasEnHora = 0.00595238;
    
    /*
     * Se calcula el pago promedio por hora.
     */
    float pagoPorHora = pagoSemanal * semanasEnHora;
    
    /*
     * Se calcula la paga por las horas dadas
     */
    float totalPagado = pagoPorHora * horas;
    
    /*
     * Se presenta el resultado, primero declarando las variables para parte entera y decimal.
     */
    float decimal;
    double entero;
    
    decimal = modf(totalPagado, &entero);
    printf("El pago por hora que usted recibe es de %10.0f dólares y %10.2f centavos", entero, decimal);
    
}