CC = arm-linux-gnueabihf-gcc
#CC = gcc

obj-m := helloworld_module.o
KDIR := /work/achro-em/kernel
PWD := $(shell pwd)

all: driver

driver:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
	# $(MAKE) - KDIR 내의 Makefile로 컴파일을 진행한다.
	
clean:
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf *.o
	rm -rf .*.cmd
	rm -rf *.symvers
	rm -rf *.order
