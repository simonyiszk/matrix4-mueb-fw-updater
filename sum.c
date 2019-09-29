#include <stdio.h>
#include <stdint.h>

int main(){
	uint32_t sum = 0;
	int res;
	while ( (res=getc(stdin)) != EOF)
		sum+=res;
	printf("%u", sum);
	return 0;
}
