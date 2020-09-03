#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
int main()
{
	fork();
	printf("sup\n");
        // printf("[son] pid %d from [parent] pid %d\n", getpid(),getppid());
	sleep(50);
	return 0;
}

