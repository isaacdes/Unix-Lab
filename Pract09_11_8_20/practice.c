#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>

int main()
{
	printf("Parent id: %d", getpid());
	int parent=getpid();
	printf("\nparent: %d",parent);
	return 0;
}
