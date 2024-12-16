#include <stdio.h>
#include <string.h>
#include <stdbool.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <word to check for palindrome>\n", argv[0]);
        return -1;
    }

    char* word = argv[1];
    int length = strlen(word);
    bool isPalindrome = true;
    printf("\n");
    for (int i = 0; i < length; i++) {
        if (word[i] != word[length-i-1]) {
            isPalindrome = false;
        }
        printf("\t%d letter is %c and %d letter is %c\n", i, word[i], length-i-1, word[length-i-1]);
    }
    
    printf("\n");
    printf("The length of the word you entered is: %d\n\n", length);
    
    if (isPalindrome) {
        printf("%s is a palindrome! :)\n", word);
    } else {
        printf("%s is not a palindrome. :(\n", word);
    }

    return 0;
}