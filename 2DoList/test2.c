#include <stdio.h>
#include <stdlib.h>

int main() {
	
	FILE* f = fopen("database.txt", "r");
	char c;
	int i = 0;

	while((c=fgetc(f)) != EOF) {
		i++;
	}
	printf("database in %d characters long\n", i);

	return 0;
}
