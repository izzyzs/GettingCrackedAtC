
#include <stdio.h>

void add(double, double);
void subtract(double, double);
void multiply(double, double);
void divide(double, double);

int main() {
    char func;
    printf("This is a 4 function calculator\n");
    printf("Enter '+' to add, '-' to subtract,\n'*' to multiply, and '/' to divide\n");
    printf("Everything else will end the program :)\n\n");

    printf("ENTER YOUR CHOICE >> ");
    scanf("%c", &func);

    double firstDigit;
    double secondDigit;
    switch (func) {
        case '+':
            printf("You want to add!\n");
            printf("What is the first digit? >> ");
            scanf("%lf", &firstDigit);
            printf("What is the second digit? >> ");
            scanf("%lf", &secondDigit);
            add(firstDigit, secondDigit);
            break;
        case '-':
            printf("You want to subtract!\n");
            printf("What is the first digit? >> ");
            scanf("%lf", &firstDigit);
            printf("What is the second digit? >> ");
            scanf("%lf", &secondDigit);
            subtract(firstDigit, secondDigit);
            break;
        case '*':
            printf("You want to multiply!\n");
            printf("What is the first digit? >> ");
            scanf("%lf", &firstDigit);
            printf("What is the second digit? >> ");
            scanf("%lf", &secondDigit);
            multiply(firstDigit, secondDigit);
            break;
        case '/':
            printf("You want to divide!\n");
            printf("What is the first digit? >> ");
            scanf("%lf", &firstDigit);
            printf("What is the second digit? >> ");
            scanf("%lf", &secondDigit);
            divide(firstDigit, secondDigit);
            break;
        default:
            printf("You must not want to calculate anything :(\n");
    }

    return 0;
}

void add(double digit1, double digit2) {
    double total;
    total = digit1 + digit2;
    printf("%.2f plus %.2f equals %.2f", digit1, digit2, total);
}

void subtract(double digit1, double digit2) {
    double total;
    total = digit1 - digit2;
    printf("%.2f minus %.2f equals %.2f", digit1, digit2, total);
}

void multiply(double digit1, double digit2) {
    double total;
    total = digit1 * digit2;
    printf("%.2f times %.2f equals %.2f", digit1, digit2, total);
}

void divide(double digit1, double digit2) {
    double total;
    total = digit1 / digit2;
    printf("%.2f divided by %.2f equals %.2f", digit1, digit2, total);
}