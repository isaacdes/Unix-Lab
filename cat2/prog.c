#include <pthread.h>
#include <semaphore.h>
#include <stdlib.h>
#include <stdio.h>


#define MaxItems 10   // Maximum items a producer can produce or a consumer can consume
#define BufferSize 10 // Size of the buffer

sem_t empty;
sem_t full;
int in = 0;
int out = 0;
int buffer[BufferSize];
pthread_mutex_t mutex;

void *producer(void *pno)
{
	int item;
	item = rand(); // Produce an random item
	sem_wait(&empty);
	pthread_mutex_lock(&mutex);
	buffer[in] = item;
	printf("Producer: Insert Item %d at %d\n", buffer[in], in);
	in = (in + 1) % BufferSize;
	pthread_mutex_unlock(&mutex);
	sem_post(&full);
}

void *consumer(void *cno)
{
	sem_wait(&full);
	pthread_mutex_lock(&mutex);
	int item = buffer[out];
	printf("Consumer: Remove Item %d from %d\n", item, out);
	out = (out + 1) % BufferSize;
	pthread_mutex_unlock(&mutex);
	sem_post(&empty);
}

int main()
{
	pthread_t pro, con;
	pthread_mutex_init(&mutex, NULL);
	sem_init(&empty, 0, BufferSize);
	sem_init(&full, 0, 0);
	 int choice;		 
  	 while (1)	
	 {
		 printf("Produce or consume ?\n(1). Produce\n(2). Consume\n(3). Exit\nChoice: ");
		 scanf("%d", &choice);
		 if (choice == 1)
			 pthread_create(&pro, NULL, (void *)producer, (void *)&pro);
		 else if (choice == 2)
			 pthread_create(&con, NULL, (void *)consumer, (void *)&con);
		 else												      
		 {														                printf("Exiting !..\n");
			 exit(0);
		 }				
	 }

	 pthread_join(pro, NULL);
	 
	 pthread_join(con, NULL);
	 pthread_mutex_destroy(&mutex);
	 sem_destroy(&empty);
	 sem_destroy(&full);	
	 return 0;
}


