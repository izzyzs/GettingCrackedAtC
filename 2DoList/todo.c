#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define NAME_LIMIT 20
#define DESCRIPTION_LIMIT 200
#define INT_NULL 0
#define LONGEST 226

// NEXT TASKS
// 1> work on update and delete functionality
// BUG: get line number has to be able to handle
// multi-digit line numbers; once you get past 9;
// the first digit is 1 meaning that it will return
// 1 instead of ten and the same follows for 100 and
// other numbers

struct Task {
    int task_num;
    char name[NAME_LIMIT];
    char description[DESCRIPTION_LIMIT];
    bool is_completed;
};

static int shared_task_count;
static int add_count = 0;

void clear_stdin();
void prompt(FILE*);
int *get_last_task_num(FILE*, int*);
char *get_line_by_task_num(FILE*, int);
char *get_user_input(char*, int);
// struct Task define_task(struct Task, char *, char *);
struct Task *create_task(int, char*, char*, bool);
void create_task_into_db(FILE*, struct Task*);
void print_task(struct Task*);
struct Task *read_task_db(FILE*, int);
void update_task_db(struct Task);
void delete_task_db(struct Task);

int main() {
   FILE *file;
    prompt(file);
    return 0;
}

void prompt(FILE *fptr) {
    char c;
    int *last_task_num;
    printf("Enter a letter for what you want to do:\n");
    printf("\t1. C: Create a new task\n");
    printf("\t2. R: Read a task\n");
    printf("\t3. U: Update a task\n");
    printf("\t4. D: Delete a task\n");
    printf("\t4. Q: Quit Program\n");
    printf(">> ");
	c = fgetc(stdin);
    switch (c) {
        case 'C':
        case 'c':
            last_task_num = get_last_task_num(fptr, &add_count);
            shared_task_count = *last_task_num;
            printf("Last task number is %d\n", *last_task_num);
            printf("Okay, let's create a new task\n");
            int temp_num = ++shared_task_count;
            char temp_name[NAME_LIMIT], temp_desc[DESCRIPTION_LIMIT];
            bool temp_completed = false;
            clear_stdin();
            printf("Enter a name for your task >> ");
            get_user_input(temp_name, NAME_LIMIT);
            printf("Enter a description of your task >> ");
            get_user_input(temp_desc, DESCRIPTION_LIMIT);
            struct Task *nTask = create_task(temp_num, temp_name, temp_desc, temp_completed);
            printf("new task address = %p", nTask);
            printf("Task\n----\nname: %s\ndescription: %s\ncompleted: %s", nTask->name, nTask->description, (nTask->is_completed ? "YES\n" : "NO\n"));
            printf("Writing into db ...");
            create_task_into_db(fptr, nTask);
            free(last_task_num);
            last_task_num = NULL;
            clear_stdin();
            ++add_count;
            prompt(fptr);
            break;
        case 'R':
        case 'r':
			printf("Enter the task number you want to read\n>> ");
            int search_num;
            scanf("%d", &search_num);
            nTask = read_task_db(fptr, search_num);
            print_task(nTask);
            clear_stdin();
            prompt(fptr);
            break;
        case 'U':
        case 'u':
            break;
        case 'D':
        case 'd':
            break;
        case 'Q':
        case 'q':
        default:
            printf("Quiting program...");
            break;
    }
}

void clear_stdin() {
    int c;
    printf("press any key to finalize...\n");
    while ((c = getchar()) != '\n' && c != EOF) {}
}

int *get_last_task_num(FILE *fptr, int *runs) {
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
		if (pos <= 0) {
            *temp_num = INT_NULL;
            return temp_num;
        }

        while (pos > 0) {
          fseek(fptr, --pos, SEEK_SET);
          if ((c= fgetc(fptr)) == '\n') {
            break;
          }	else {
          	fseek(fptr, --pos, SEEK_SET);
          }
        }

        if (fgets(buff, sizeof(buff), fptr) != NULL) {
            num_c = buff[0];
        }
        *temp_num = (num_c-48) + *runs;
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
        }
        if (c == '\n') {
            new_line[i] = '\0';
        }
    } while ((new_line[0]-48) != num);
    return new_line;
}

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

    (num >= 0) ? (temp_task->task_num = num) : (temp_task->task_num = shared_task_count = 0);
    strcpy(temp_task->name, name);
    strcpy(temp_task->description, description);
    temp_task->is_completed = completed;
    return temp_task;
}



// 'create_task_into_db' function writes task data into the "database" (a file for now until I write out my relational database; project coming soon :) ) in a parsable fashion and free's the task from memory; It will be rewritten when retrieved from db
void create_task_into_db(FILE* f, struct Task* new_task_p) {
    f = fopen("database.txt", "a");
    fprintf(f, "%d|%s|%s|%s\n",new_task_p->task_num, new_task_p->name, new_task_p->description, (new_task_p->is_completed ? "y" : "n"));
    free(new_task_p);
    new_task_p = NULL;
    fclose(f);
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
            break;
        case 1:
            strncpy(temp_desc, token, DESCRIPTION_LIMIT);
            break;
        case 2:
            temp_complete_c = token[0];
            break;
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
    f = fopen("database.txt", "r");
    char *record = get_line_by_task_num(f, num);
    struct Task *temp_task = parse_task(record);
    free(record);
    fclose(f);
    return temp_task;
}

void print_task(struct Task *task_p) {
  if (task_p == NULL) {
    printf("ERROR: Task is NULL.\n");
    return;
  }
  printf("Task %d: %s\n", task_p->task_num, task_p->name);
  printf("\tDescription: %s\n", task_p->description);
  printf("\tTask completed?: %s\n", task_p->is_completed ? "YES\n" : "NO\n");
  free(task_p);
  task_p = NULL;
}
// void update_task_db(struct Task t) {

// }

// void delete_task_db(struct Task t) {

// }
