//Author:Ambily Francis
//Regno:1947204
//Date:14/10/2020
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h> 
#include <arpa/inet.h> 

void main(int argc, char **argv) 
{
	if(argc!=2)
	{
		printf("Usage: %s <port>\n", argv[0]);
		exit(0);
	}
	
	int port = atoi(argv[1]);
	int sockfd;
	struct sockaddr_in serverAddr;
	
	char buffer[1024];
	char try1[1024];
	printf("Ambily Francis -1947204\n");
	printf("Enter data\n");
	fgets(try1, 1024, stdin);
	printf("\nJust for assuring what data was entered\n");
	printf("%s",try1);
	socklen_t addr_size;
	
	sockfd = socket(PF_INET, SOCK_DGRAM, 0);
	memset(&serverAddr, '\0', sizeof(serverAddr));
	
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons(port);
	serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
	
	strcpy(buffer, try1);
	sendto(sockfd, buffer, 1024, 0, (struct sockaddr*)&serverAddr, sizeof(serverAddr));
	printf("[+] Data Send : %s\n", buffer);
	
	addr_size = sizeof(serverAddr);
	recvfrom(sockfd, buffer, 1024, 0, (struct sockaddr*)&serverAddr, &addr_size);
	printf("[+] Data received: %s\n", buffer);
	
	
}	
