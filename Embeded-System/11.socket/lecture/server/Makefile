CC = gcc
CFLAGS = -c
TARGET = server.out

default: server.o
	$(CC) $^ -o $(TARGET)
	
server.o: server.c
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
