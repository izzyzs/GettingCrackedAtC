#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define NAME_LIMIT 20
#define DESCRIPTION_LIMIT 200
#define INT_NULL -1
#define LONGEST 226

struct Task {
    int task_num;
    char name[NAME_LIMIT];
    char description[DESCRIPTION_LIMIT];
    bool is_completed;
};

static int shared_task_count = 0;


void prompt(FILE*);
int *get_last_task_num(FILE*);
char *get_line_by_task_num(FILE*, int);
char *get_user_input(char*, int);
// struct Task define_task(struct Task, char *, char *);
struct Task *create_task(int, char*, char*, bool);
void create_task_into_db(FILE*, struct Task*);
struct Task *read_task_db(FILE*, int);
void update_task_db(struct Task);
void delete_task_db(struct Task);

int main() {
    // bool addTask = false;
    // FILE *fptr;
    // fptr = fopen("database.txt", "a+");
    // if (fptr == NULL) {
    //     printf("Error opening file!\n");
    //     return 1;
    // }

    // do {

    //
    //     // char c;
    //     // while ((c=fgetc(fptr))!=EOF) {
    //     //     if (c == '\n')
    //     //         printf("\\n");
    //     //     else
    //     //         printf("%c", c);
    //     // }

    //     char yesOrNo;
    //     printf("Would you like to add a task? [y/n?]: ");
    //     yesOrNo=getchar();
    //     addTask = yesOrNo == 'y' || yesOrNo == 'Y';
    // } while (addTask);
    FILE *file;
    prompt(file);
    return 0;
}

void prompt(FILE *fptr) {
    char c;
    char buff[5];
    int *last_task_num;
    printf("Enter a letter for what you want to do:\n");
    printf("\t1. C: Create a new task\n");
    printf("\t2. R: Read a task\n");
    printf("\t3. U: Update a task\n");
    printf("\t4. D: Delete a task\n");
    printf("\t4. Q: Quit Program\n");
    printf(">> ");
    fgets(buff, sizeof(buff), stdin);
    c = buff[0];
    switch (c) {
        case 'C':
        case 'c':
            last_task_num = get_last_task_num(fptr);
            fptr = fopen("database.txt", "a+");
            printf("Last task number is %d\n", *last_task_num);
            printf("Okay, let's create a new task\n");
            int temp_num = INT_NULL;
            char temp_name[NAME_LIMIT], temp_desc[DESCRIPTION_LIMIT];
            bool temp_completed = false;
            printf("Enter a name for your task >> ");
            get_user_input(temp_name, NAME_LIMIT);
            printf("Enter a description of your task >> ");
            get_user_input(temp_desc, DESCRIPTION_LIMIT);
            struct Task *nTask = create_task(temp_num, temp_name, temp_desc, temp_completed);
            printf("new task address = %p", nTask);
            printf("Task\n----\nname: %s\ndescription: %s\ncompleted: %s", nTask->name, nTask->description, (nTask->is_completed ? "YES\n" : "NO\n"));
            printf("Writing into db ...");
            create_task_into_db(fptr, nTask);
            prompt(fptr);
            break;
        case 'R':
        case 'r':
            break;
        case 'U':
        case 'u':
            break;
        case 'D':
        case 'd':
            break;
        case 'Q':
        case 'q':
            printf("Quiting program...");
            break;
    }
}

int *get_last_task_num(FILE *fptr) {
    char buff[LONGEST], num_c, c;
    int *temp_num = (int *)malloc(sizeof(int));

    fptr = fopen("database.txt", "r");
    if (fptr == NULL) {
        printf("File does not exist\n");
        *temp_num = INT_NULL;
    } else {
        fseek(fptr, 0, SEEK_END);
        long pos = ftell(fptr);
        --pos; // this skips over newline character present at the end of the database

        while (pos > 0) {
          fseek(fptr, --pos, SEEK_SET);
          if ((c= fgetc(fptr)) == '\n') {
            break;
          }
        }

        if (fgets(buff, sizeof(buff), fptr) != NULL) {
            printf("Last line is %s\n", buff);
            num_c = buff[0];
        }
        *temp_num = (num_c-48);
    }

    fclose(fptr);
    return temp_num;
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
//            printf("\nnew_line: %s\n", new_line);
//            printf("new_line[0] = %c\n", new_line[0]);
//            printf("(int)new_line[0] = %d\n", new_line[0]-48);
//            printf("num: %d\n", num);
        }
    } while ((new_line[0]-48) != num);
    return new_line;
}
// char* get_line_by_task_num(FILE* stream, int num) {
//     int i, longest=NAME_LIMIT+DESCRIPTION_LIMIT+5;
//     char c, first_char;
//     char *new_line = (char*)malloc(sizeof(char) * longest);
//     for (i=0; i<longest&&((c=fgetc(stream)) != '\n'); i++) {
//         if (first_char) {
//             new_line[i] = c;
//         } else {
//             first_char = c;
//             if (first_char == num) {
//               new_line[i] = num;
//             }
//         }
//     }
//     return new_line;
// }
//

char* get_user_input(char *final_string, int lim) {
    char c;
    for (int i = 0; i < lim && ((c = getchar()) != '\n'); i++) {
        final_string[i] = c;
    }
    return final_string;
}


// This 'create_task' function allocates memory for a task
struct Task* create_task(int num, char name[NAME_LIMIT], char description[DESCRIPTION_LIMIT], bool completed) {
    struct Task* temp_task = (struct Task*)malloc(sizeof(struct Task));
    if (temp_task == NULL) {
        perror("ERROR: Issue allocating memory for Task.\n");
    }

    (num >= 0) ? (temp_task->task_num = num) : (temp_task->task_num = ++shared_task_count);
    strcpy(temp_task->name, name);
    strcpy(temp_task->description, description);
    temp_task->is_completed = completed;
    return temp_task;
}



// 'create_task_into_db' function writes task data into the "database" (a file for now until I write out my relational database; project coming soon :) ) in a parsable fashion and free's the task from memory; It will be rewritten when retrieved from db
void create_task_into_db(FILE* f, struct Task* new_task_p) {
    fprintf(f, "%d|%s|%s|%s\n",new_task_p->task_num, new_task_p->name, new_task_p->description, (new_task_p->is_completed ? "y" : "n"));
    free(new_task_p);
}



struct Task *parse_task(char *line) {
    // cut up the line based on the token '|'
    int temp_task_num, token_counter;
    char temp_name[NAME_LIMIT], temp_desc[DESCRIPTION_LIMIT], temp_complete_c;  // initialize temp vars

    char *token = strtok(line, "|");
    temp_task_num = atoi(token);
    for (int i = 0; i < 3; i++) {
       token = strtok(NULL, "|");
        switch (i)
        {
        case 0:
            strncpy(temp_name, token, NAME_LIMIT);
        case 1:
            strncpy(temp_desc, token, DESCRIPTION_LIMIT);
        case 2:
            temp_complete_c = token[0];
        default:
            perror("DATABASE ERROR: Error retrieving data from database");
            break;
        }
    }
    
    bool temp_completed;
    switch (temp_complete_c)
    {
    case 'y':
        temp_completed = true;
        break;
    case 'n':
        temp_completed = false;
        break;
    
    default:
        break;
    } 
    struct Task *return_task = create_task(temp_task_num, temp_name, temp_desc, temp_completed);
    return return_task;
}
struct Task *read_task_db(FILE* f, int num) {
    char *record = get_line_by_task_num(f, num);
    struct Task *temp_task = parse_task(record);
    return temp_task;
}
// void update_task_db(struct Task t) {

// }

// void delete_task_db(struct Task t) {

// }
