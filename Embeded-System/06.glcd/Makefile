#CC = arm-linux-gnueabihf-gcc
CC = gcc
CFLAGS = -c
LDFLAGS = -lpthread
TARGET = lcd_clock.o

default : main_timer.o gstub.o
	$(CC) -o $(TARGET) $(LDFLAGS) $^ 

main.o : main_timer.c
	$(CC) $(CFLAGS) $^

gstub.o : gstub.c
	$(CC) $(CFLAGS) $^
