#CC = arm-linux-gnueabihf-gcc
CC = gcc
CFLAGS = -c
LDFLAGS = -lpthread -lrt
TARGET = stopwatch.out

default: stopwatch_timer.o gstub.o
	$(CC) -o $(TARGET) $^ $(LDFLAGS)

stopwatch_timer.o: stopwatch_timer.c
	$(CC) $(CFLAGS) $^

gstub.o: gstub.c
	$(CC) $(CFLAGS) $^
