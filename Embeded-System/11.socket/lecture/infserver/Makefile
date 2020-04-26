CC = gcc
CFLAGS = -c
TARGET = server2.out

default: server2.o
	$(CC) $^ -o $(TARGET)
	
server2.o: server2.c
	$(CC) $(CFLAGS) $^ -o $@ -lsocket

clean:
	rm -rf *.out
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf *.o
	rm -rf Module.symvers
	rm -rf modules.order
	rm -rf .interface*
	rm -rf .tmp*
