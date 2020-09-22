#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<signal.h>

int main(int argc, char* argv[]) {
	
	int n1 = fork(); //child1
	int n2 = fork();

	if( n1 > 0 && n2 > 0) {
		printf("\nParent: %d ",getppid());
		printf("\n%d  %d", n1, n2);
		printf("\nProcess id: %d\n ",getpid());
	}
	else if ( n1 == 0 && n2 >0 ) {
		printf("\nChild1: %d ", n2);
		printf("\nProcess id: %d", getpid());
		printf("\nParent of :%d\n", getppid());
	}
	else if ( n1 > 0 && n2 == 0 ) {
		printf("\nChild2: %d",n1);
		printf("\nProcess id: %d", getpid());
		printf("\nParent of :%d\n", getppid());
	}
	else {
		printf("\nProcess id: %d",getpid());
		printf("\nParent of :%d\n", getppid());
	}
	return 0;
}
