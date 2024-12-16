#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>

int main() {
    srand(time(NULL));
    double randomPercentage = (double)rand()/RAND_MAX;
    int upper, lower, totalDistance, number, guess;


    printf("This is a number guessing game\n");
    printf("Pick the lower bound >> ");
    scanf("%d", &lower);
    printf("Pick the upper bound >> ");
    scanf("%d", &upper);
    totalDistance = upper - lower;
    number = (totalDistance * randomPercentage) + lower;
    printf("Okay, now I have the number picked! go ahead and make a guess >> ");
    scanf("%d", &guess);
    while (guess != number) {
        if (guess > number)
            printf("Your guess is too high.\t");
        else
            printf("Your guess is too low.\t");
         printf("Make another guess! >> ");
         scanf("%d", &guess);
    }
    printf("CONGRATULATIONS! You found the number! It is: %d\n", number);
    return 0;
}