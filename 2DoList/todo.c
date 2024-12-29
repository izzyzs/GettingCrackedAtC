#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define NAME_LIMIT 20
#define DESCRIPTION_LIMIT 200
struct Task {
    int task_num;
    char name[NAME_LIMIT];
    char description[DESCRIPTION_LIMIT];
    bool is_completed;
};

static int shared_task_count = 0;


char *get_line(FILE*);
char *get_user_input(char*, int);
// struct Task define_task(struct Task, char *, char *);
struct Task *create_task(int, char*, char*, bool);
void create_task_into_db(FILE*, struct Task*);
struct Task read_task_db(FILE*);
void update_task_db(struct Task);
void delete_task_db(struct Task);

int main() {
    bool addTask = false;
    FILE *fptr;
    fptr = fopen("database.txt", "a+");
    if (fptr == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    do {
        struct Task newTask;
        printf("Enter a name for your task >> ");
        get_user_input(newTask.name, NAME_LIMIT);
        printf("Enter a description of your task >> ");
        get_user_input(newTask.description, DESCRIPTION_LIMIT);
        newTask.is_completed = false;
        create_task_into_db(fptr, &newTask);
        printf("Task\n----\nname: %s\ndescription: %s\ncompleted: %s", newTask.name, newTask.description, (newTask.is_completed ? "X\n" : "\n"));
        
        
        char c;
        while ((c=fgetc(fptr))!=EOF) {
            if (c == '\n')
                printf("\\n");
            else
                printf("%c", c);
        }

        char yesOrNo;
        printf("Would you like to add a task? [y/n?]: ");
        fgets(&yesOrNo, 1, stdin);
        addTask = yesOrNo == 'y' || yesOrNo == 'Y';
    } while (addTask);
    
    return 0;
}

char* get_line(FILE* stream) {
    int i, longest=NAME_LIMIT+DESCRIPTION_LIMIT+3;
    char c;
    char *new_line = (char*)malloc(sizeof(char) * longest);
    for (i=0; i<longest&&(c=fgetc(stream) != '\n'); i++) {
        new_line[i] = c;
    }
    return new_line;
}


char* get_user_input(char *final_string, int lim) {
    char c;
    for (int i = 0; i < lim && (c = getchar() != '\n'); i++) {
        final_string[i] = c;
    }
    return final_string;
}

// struct Task define_task(struct Task task, char name[], char description[]) {
//     task = (struct Task) {name, description, false};
//     return task;
// }


// This 'create_task' function allocates memory for a task
struct Task* create_task(int num, char name[NAME_LIMIT], char description[DESCRIPTION_LIMIT], bool completed) {
    struct Task* temp_task = (struct Task*)malloc(sizeof(struct Task));
    if (temp_task == NULL) {
        perror("ERROR: Issue allocating memory for Task.\n");
    }
    
    num ? (temp_task->task_num = num) : (temp_task->task_num = ++shared_task_count);
    
    temp_task->task_num = shared_task_count;
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

// struct Task read_task_db(FILE* f) {
    
// }

struct Task *parse_task(char *line) {
    // cut up the line based on the token '|'
    int temp_task_num, token_counter;
    char temp_name[NAME_LIMIT], temp_desc[DESCRIPTION_LIMIT], temp_complete_c;  // initialize temp vars

    // define the part number section, i.e., "(1)", "(2)", "(3)"
    // copy 

    char *token = strtok(line, "|");
    for (int i = 0; i < 3; i++) {
        switch (i)
        {
        case 1:
            break;
        case 2:
            copy_without_number(&temp_desc, &token, DESCRIPTION_LIMIT);
        case 3:
            temp_complete_c = token[3];
        default:
            perror("DATABASE ERROR: Error retrieving data from database");
            break;
        }
 
    }

    do {
        char *part_num[4] = get_part_num(&token);
        part_num[3] = "\0";
       token = strtok(NULL, "|");
    } while (token);


    
    char completeChar;
    // fscanf(f, "%s|%s|%s", t.name, t.description, completeChar);
    // (completeChar == "y") ? (t.is_completed = true) : (t.is_completed = false);
    // return t;
    // return 
}

// void update_task_db(struct Task t) {

// }

// void delete_task_db(struct Task t) {

// }
