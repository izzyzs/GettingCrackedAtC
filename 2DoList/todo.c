#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct {
    char name[20];
    char description[500];
    bool isCompleted;
} task;

int main() {
    bool addTask = false;
    do {
        task newTask;
        printf("Enter the name of your task >> ");
        scanf("%s", newTask.name);

    


        char yesOrNo;
        printf("Would you like to add a task? [y/n?]");
        scanf("%d", yesOrNo);
        addTask = yesOrNo == 'y' || yesOrNo == 'y';
    } while (addTask)
    
    return 0;
}