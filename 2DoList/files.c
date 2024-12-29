#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX 100
typedef struct {
    char string[MAX];
} line;

typedef struct {
    line lines[MAX];
} document;

int main(void) {
    

    FILE *fptr;
    // opening a file to append end of file: "a":
    fptr = fopen("data.txt", "a+");
    if (fptr == NULL) {
        printf("Error opening file!\n");
        return 1;
    }


    // printing to output with file print format:
    fprintf(fptr, "\nHello!");
    rewind(fptr);
    // fclose(fptr);

    // fptr = fopen("data.txt", "r");

    // if (fptr == NULL) {
    //     printf("Error opening file\n");
    //     return 1;
    // }

    document doc;
    for (int i = 0; i < MAX; i++) {
        if(fgets(doc.lines->string, 10, fptr)) {

            printf("%d. %s", i+1, doc.lines->string);
        }
    }
    // while ( != NULL) {
    //     printf("%s", line);
    // }
    fclose(fptr);

    int i = 4;
    int* p = &i;
    printf("%p\n", (void*)p);

    return 0;
}

/**
 * FILE MODES
 * 
 * **/

    // "w+" write and read but it truncates (empties) the file first
    // "r+" reads from and writes to a file, without pretrunctation, however it will overwrite present content
    // "r" only read and "w" only write
    // "a+" appends to the end of file
