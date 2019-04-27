#include <stdio.h>

extern int sum(int a, int b);

int main() {
	int a = 10, b = 2;
	int c = sum(a, b);
	printf("This is 'C'\n");
	printf("result =  %d\n", c); 
	return 0;	
}
