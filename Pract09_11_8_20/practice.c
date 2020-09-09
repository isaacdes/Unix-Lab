#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>

int main()
{
	printf("Parent id: %d", getpid());
	int parent=getppid();
	fork();
	printf("\nparent: %d  child: %d",getppid(), getpid());
	return 0;
}
