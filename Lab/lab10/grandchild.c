//author:Ambily Francis
//date:13/08/2020
/*Write a program that creates four processes.
 The original process creates two children processes 
 and then prints out “parent”. The children process 
 print “child1” and “child2” respectively.
 The second child process creates a child process 
 that prints out “grandchild”. Each process should
 print out its process id and the process id of its parent.*/
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<signal.h>
#include<unistd.h>
int main()
{
	pid_t value1;// return value of fork()
	pid_t value2;
	value1=fork();
	
 	int flag=0;
	
	if ( value1==0 )
	{
		printf("\nName    : Ambily Francis \nRegno    :1947204\n");
		printf("\nChild 1 ID : %d , Parent ID : %d \n",getpid(),getppid());
	}
	else if( value1 > 0 )
	{	
		wait(NULL);
		value2=fork();

		if(value2 == 0)
		{

			printf("\nChild 2 ID : %d , Parent ID : %d  \n",getpid(),getppid());
			
			if(fork()==0)
			{
				flag=1;
				printf("\nGrandchild ID : %d ,Parent ID : %d  \n",getpid(),getppid());
			}
	
		}
		else if(value2 > 0)
		{
			wait(NULL);
			printf("\nParent Id : %d  \n",getpid());
		}
	
	}

	if( value1 < 0 )
	{
		printf("\n Fork failed \n");
	}
	
	return 0;
}