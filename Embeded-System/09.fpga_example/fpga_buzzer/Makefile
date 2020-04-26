obj-m   := fpga_buzzer_driver.o

KDIR :=/work/achro-em/kernel
PWD :=$(shell pwd)


all: driver app

driver:
#	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
app:
#	gcc -static -o fpga_test_buzzer fpga_test_buzzer.c
	arm-linux-gnueabihf-gcc -static -o fpga_test_buzzer.out fpga_test_buzzer.c

clean:
#	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf *.o
	rm -rf fpga_test_buzzer
	rm -rf Module.symvers
	rm -rf modules.order
	rm -rf .buzzer*
	rm -rf .tmp*
