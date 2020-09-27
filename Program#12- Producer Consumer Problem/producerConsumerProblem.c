#include <pthread.h>
#include <semaphore.h>//semaphores
#include <sys/shm.h>// shared memroy
#include <stdlib.h>
#include <stdio.h>
#define MaxItems 10 // Maximum number of items a producer can produce or a consumer can consume is at most 15
#define BufferSize 10 // Buffer size is also 15
sem_t empty;
sem_t full;
int in = 0;
int out = 0;
int buffer[BufferSize];
pthread_mutex_t mutex;
void *producer(void *pno) //chef that produces portions
{
int item;
for(int i = 0; i < MaxItems; i++) {
item = rand(); // using rand function to produce a random item within the available range
sem_wait(&empty); //join critical region
pthread_mutex_lock(&mutex);
buffer[in] = item;
printf("Producer has insert an item %d at shelf number %d\n", buffer[in],in);
in = (in+1)%BufferSize;
pthread_mutex_unlock(&mutex);
sem_post(&full);
}
}
void *consumer(void *cno)//consumer that consumes portions
{
for(int i = 0; i < MaxItems; i++) {
sem_wait(&full); //join critical region
pthread_mutex_lock(&mutex);
int item = buffer[out];
printf("Consumer has removed item %d from shelf number %d \n",item, out);
out = (out+1)%BufferSize;
pthread_mutex_unlock(&mutex);
sem_post(&empty);
}
}
int main()
{
printf("Isaac Xavier Desouza \n 1947214\n");
pthread_t pro[10],con[10];
pthread_mutex_init(&mutex, NULL);
// Initializing the mutex and the shared memory
sem_init(&empty,0,BufferSize);
sem_init(&full,0,0);
int a[15] = {1,2,3,4,5,6,7,8,9,10}; //Numbering the producer and consumer
for(int i = 0; i < 10; i++) {
pthread_create(&pro[i], NULL, (void *)producer, (void *)&a[i]);
}
for(int i = 0; i < 10; i++) {
pthread_create(&con[i], NULL, (void *)consumer, (void *)&a[i]);
}
for(int i = 0; i < 10; i++) {
pthread_join(pro[i], NULL);
}
for(int i = 0; i < 10; i++) {
pthread_join(con[i], NULL);
}
pthread_mutex_destroy(&mutex);
sem_destroy(&empty);//destroy semaphores and shared memory
sem_destroy(&full);//destroy semaphores and shared memory
return 0;
}
