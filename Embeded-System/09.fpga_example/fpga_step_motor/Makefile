obj-m   := fpga_step_motor_driver.o

KDIR :=/mnt/e/work/achro-em/kernel
PWD :=$(shell pwd)


all: driver app

driver:
#	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
app:
#	gcc -static -o fpga_test_step_motor fpga_test_step_motor.c
	arm-linux-gnueabihf-gcc -static -o fpga_test_step_motor.out fpga_test_step_motor.c

clean:
#	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf *.o
	rm -rf fpga_test_step_motor
	rm -rf Module.symvers
	rm -rf modules.order
	rm -rf .step_motor*
	rm -rf .tmp*
