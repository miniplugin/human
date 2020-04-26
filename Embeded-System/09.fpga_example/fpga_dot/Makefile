obj-m   := fpga_dot_driver.o

KDIR :=/work/achro-em/kernel
PWD :=$(shell pwd)


all: driver app

driver:
#	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
app:
#	gcc -static -o fpga_test_dot fpga_test_dot.c
	arm-linux-gnueabihf-gcc -static -o fpga_test_dot.out fpga_test_dot.c

clean:
#	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf *.o
	rm -rf fpga_test_dot
	rm -rf Module.symvers
	rm -rf modules.order
	rm -rf .dot*
	rm -rf .tmp*
