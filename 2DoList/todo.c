#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>



int main(void) {
    FILE *fptr;
    fptr = fopen("data.txt", "a");
    fprintf(fptr, "\nHello!");
    fclose(fptr);
    return 0;
}