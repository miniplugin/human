#Makefile for a basic kernel module
#export PATH=$PATH:~/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin

obj-m   := fpga_interface_driver.o

KDIR :=/mnt/e/work/achro-em/kernel/
PWD :=$(shell pwd)

all: driver

driver:
	make -C $(KDIR) SUBDIRS=$(PWD) modules
clean:
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf *.o
	rm -rf Module.symvers
	rm -rf modules.order
	rm -rf .interface*
	rm -rf .tmp*
