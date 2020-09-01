#include<stdio.h>
#include<stdlib.h>

const float pi=3.14;         //It will be stored in read only block of initialized data segment
int factorial_no=6;          //Initialized data segment    

int factorial(int n)              //Arguments passed to the function used to store in stack segment
{
	 static int fact=1; 
	 int i;                        //local variable of function will be stored in stack segment
	      	 if (n < 0)  {
			 printf("Error! Factorial of a negative number doesn't exist.");  
		      }
		 else { 
			 for (i = 1; i <=n; i++) 
				 fact *= i; 
		 }
return fact;
}

int main()
{
	char *pStr = malloc(sizeof(char)*4);
	int n = 10;                    //local variable of function will be stored in stack segmennt
       	int ans;                       //local variable of function will be stored in stack segment
	ans=factorial(n);       	      
	printf("\nAddress of variables in Stack \n");      
	printf("\n n    : %p", &n);
  	printf("\n ans    : %p", &ans);   
	printf("\nAddress of variables in heap \n");
	printf("\n pStr    : %p", &pStr);\
	return 0;
}

