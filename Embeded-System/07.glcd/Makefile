CC = arm-linux-gnueabihf-gcc
#CC = gcc
CFLAGS = -c
LDFLAGS = -lpthread -lrt
TARGET = stopwatch.out

default: main_stopwatch.o gstub.o
	$(CC) -o $(TARGET) $^ $(LDFLAGS)

main_stopwatch.o: main_stopwatch.c
	$(CC) $(CFLAGS) $^

gstub.o: gstub.c
	$(CC) $(CFLAGS) $^
