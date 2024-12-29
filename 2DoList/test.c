#include <stdio.h>
#include <stdlib.h>

#define NAME_LIMIT 20
#define DESCRIPTION_LIMIT 200


char* get_line_by_task_num(FILE*, int);
char* get_user_input(char*, int);

int main() {
    char h[30];
    get_user_input(h, 30);
    printf("%s", h);
    return 0;

    FILE *fptr = fopen("test.txt", "a+");
    if (fptr == NULL) {
      printf("Error opening file\n");
    }

    get_line_by_task_num(fptr, 2);

    fclose(fptr);
}

char* get_user_input(char *final_string, int lim) {
    char c;
    for (int i = 0; i < lim && ((c = getchar()) != '\n'); i++) {
        final_string[i] = c;
    }
    return final_string;
}


char* get_line_by_task_num(FILE* stream, int num) {
    int i, longest=NAME_LIMIT+DESCRIPTION_LIMIT+5;
    char c, first_char;
    char *new_line = (char*)malloc(sizeof(char) * longest);
    for (i=0; i<longest&&((c=fgetc(stream)) != '\n'); i++) {
        if (first_char) {
            new_line[i] = c;
        } else {
            first_char = c;
            if (first_char == (char)(num+48)) {
              new_line[i] = num;
            }
        }
    }
    return new_line;
}