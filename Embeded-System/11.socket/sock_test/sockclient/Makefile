CC = gcc
CFLAGS = -c
TARGET = client.out

default: sockclient.o
	$(CC) $^ -o $(TARGET)
	
sockclient.o: sockclient.cpp
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
