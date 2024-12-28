#include <stdio.h>
#include <stdlib.h>


int main(void) {
    FILE *fptr;
    // opening a file to append end of file: "a":
    fptr = fopen("data.txt", "a");
    if (fptr == NULL) {
        printf("Error opening file!\n");
        return 1;
    }


    // printing to output with file print format:
    fprintf(fptr, "\nHello!");
    // Must closed file when finished:
    fclose(fptr);

    FILE *file = fopen("example.txt", "a+");
    if(file == NULL) {
        printf("Error opening file\n");
        return 1;
    }

    char line[100];
    while (fgets(line, sizeof(line), file)) {
        printf("%s", line);
    }
    fclose(file);
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
