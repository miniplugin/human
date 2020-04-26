CC = arm-linux-gnueabihf-gcc
#CC = gcc
TARGET = achro_em_mouse.out
CFLAGS = -lpthread

default: achro_em_mouse.o
	$(CC) $^ -o $(TARGET)
	
achro_em_mouse.o: achro_em_mouse.c
	$(CC) -c $^ $(CFLAGS)

clean:
	rm -rf *.out
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf *.o
	rm -rf Module.symvers
	rm -rf modules.order
	rm -rf .interface*
	rm -rf .tmp*
