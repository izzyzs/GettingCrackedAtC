#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NAME_LIMIT 20
#define DESCRIPTION_LIMIT 200
#define LONGEST 500


char *get_line_by_task_num(FILE*, int);
char *get_user_input(char*, int);
char *get_line(FILE*);
int main() {
    //char h[30];
    //get_user_input(h, 30);
    //printf("%s", h);

    FILE *fptr = fopen("test.txt", "r");
    if (fptr == NULL) {
      printf("Error opening file\n");
    }

    // char line[NAME_LIMIT+DESCRIPTION_LIMIT+7];
    // strcpy(line, get_line_by_task_num(fptr, 2));

    char *test = get_line_by_task_num(fptr, 2);
    // for (int i = 0; i<LONGEST&&((c=fgetc(fptr)) != EOF && c != '\n'); i++) {
    // while ((c=getchar()) != EOF && c != '\n') {
    //    test[i] = c;
    //    printf("%c", c);
    //}
    printf("%s", test);
    // strcpy(line, get_line(fptr));

    fclose(fptr);
    return 0;
}

char *get_user_input(char *final_string, int lim) {
    char c;
    for (int i = 0; i < lim && ((c = getchar()) != '\n'); i++) {
        final_string[i] = c;
    }
    return final_string;
}


char *get_line_by_task_num(FILE* fptr, int num) {
    int i, longest=NAME_LIMIT+DESCRIPTION_LIMIT+6;
    char c, first_char;

    char *new_line = (char*)malloc(longest * sizeof(char));
    if (new_line == NULL) {
        fprintf(stderr, "Memory allocation failed.\n");
        exit(1);
    }

    do {
        for (i = 0; i<longest&&((c=fgetc(fptr)) != EOF && c != '\n'); i++) {
          new_line[i] = c;
          printf("i: %d", i);
          printf("\t%c\n", c);
        }
        if (c == '\n') {
            new_line[i] = '\0';
            printf("\nnew_line: %s\n", new_line);
            printf("new_line[0] = %c\n", new_line[0]);
            printf("(int)new_line[0] = %d\n", new_line[0]-48);
            printf("num: %d\n", num);
        }
    } while ((new_line[0]-48) != num);
    return new_line;
}

char *get_line(FILE *fptr) {
    int i, longest=NAME_LIMIT+DESCRIPTION_LIMIT+6;
    char c;
    char *new_line = (char*)malloc((longest+1) * sizeof(char));


    for (i = 0; i<longest&&((c=fgetc(fptr)) != EOF && c != '\n'); i++) {
          new_line[i] = c;
          printf("i: %d", i);
          printf("\t%c\n", c);
    }
    if (c == '\n') {
        new_line[i] = '\0';
    }
    printf("%s", new_line);
    return new_line;
}