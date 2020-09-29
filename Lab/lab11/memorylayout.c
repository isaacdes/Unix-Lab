#include<stdio.h>
	#include<stdlib.h>
	

	const float pi=3.14;         //It will be stored in read only block of initialized data segment
	int armstrong_no=6;          //Initialized data segment    
	

	int order( int n ){
		int count = 0;
		while ( n > 0) {
			count++;
			n = n/10;
		}
		return count;
	}
	

	int power(int x, int y) {
		if( y == 0)
			return 1;
		if( y%2 == 0)
			return power(x, y/2) * power(x, y/2);
		return x * power(x, y/2) * power(x, y/2);
	}
	

	int armstrong(int n)              //Arguments passed to the function used to store in stack segment
	{
		int d;                        //local variable of function will be stored in stack segment
		int o = order(n);
		int sum = 0, num = n;
		while( n != 0 ) {
			d = n%10;
			sum += power(d, o);
			n = n/10;
		}
		if(num == sum)
			return 1;
		else
			return 0;
	}
	

	int main()
	{
		char *pStr = malloc(sizeof(char)*4);
		int n = 10;                    //local variable of function will be stored in stack segmennt
	       	int ans;                       //local variable of function will be stored in stack segment
		ans=armstrong(n);       	      
		printf("\nAddress of variables in Stack \n");      
		printf("\n n    : %p", &n);
	  	printf("\n ans    : %d", &ans);   
		printf("\nAddress of variables in heap \n");
		printf("\n pStr    : %p\n", &pStr);\
		return 0;
	}


