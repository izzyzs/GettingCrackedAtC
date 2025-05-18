#include <stdio.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
	int i;
	printf("sizeof var: %d bytes\n", (int) len);
	for (i = 0; i < len; i++)
		printf(" %.2x", start[i]);
	printf("\n");
}

void show_int(int x) {
	show_bytes((byte_pointer) &x, sizeof(int));
}

void show_float(float x) {
	show_bytes((byte_pointer) &x, sizeof(float));
}

void show_pointer(void *x) {
	show_bytes((byte_pointer) &x, sizeof(void *));
}

void test_show_bytes(int val) {
	int ival = val;
	float fval = (float) ival;
	int *pval = &ival;

	printf("The int value %d is represented by:\n", ival);
	show_int(ival);
	printf("The float value %f is represented by:\n", fval);
	show_float(fval);
	printf("The pointer value %p is represented by:\n", pval);
	show_pointer(pval);
}

int main() {
	// test_show_bytes(12345);
	int val = 0x87654321;
	byte_pointer valp = (byte_pointer) &val;
	show_bytes(valp, 1);
	show_bytes(valp, 2);
	show_bytes(valp, 3);
	return 0;	
}
00000000001101011001000101000001
  01001010010101100100010100000100