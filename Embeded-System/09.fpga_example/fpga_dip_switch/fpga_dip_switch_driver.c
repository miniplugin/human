/*
FPGA DIP SWITCH Ioremap Control
FILE : fpga_dip_switch_driver.c
*/

#include <linux/module.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/platform_device.h>
#include <linux/delay.h>

#include <asm/io.h>
#include <linux/uaccess.h>
#include <linux/kernel.h>
#include <linux/ioport.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/version.h>


#define IOM_FPGA_DIP_SWITCH_MAJOR 266				// ioboard led device major number
#define IOM_FPGA_DIP_SWITCH_NAME "fpga_dip_switch"	// ioboard led device name

#define IOM_FPGA_DIP_SWITCH_ADDRESS 0x08000000		// pysical address
extern unsigned char iom_fpga_itf_read(unsigned int addr);
extern ssize_t iom_fpga_itf_write(unsigned int addr, unsigned char value);

//Global variable
static int fpga_dip_switch_port_usage = 0;

// define functions...
ssize_t iom_fpga_dip_switch_read(struct file *inode, char *gdata, size_t length, loff_t *off_what); 
int iom_fpga_dip_switch_open(struct inode *minode, struct file *mfile);
int iom_fpga_dip_switch_release(struct inode *minode, struct file *mfile);

// define file_operations structure 
struct file_operations iom_fpga_dip_switch_fops = {
	owner:		THIS_MODULE,
	open:		iom_fpga_dip_switch_open,
	read:		iom_fpga_dip_switch_read,	
	release:	iom_fpga_dip_switch_release,
};

// when fpga_dip_switch device open ,call this function
int iom_fpga_dip_switch_open(struct inode *minode, struct file *mfile) {
	if(fpga_dip_switch_port_usage != 0) return -EBUSY;

	fpga_dip_switch_port_usage = 1;


	return 0;
}

// when fpga_dip_switch device close ,call this function
int iom_fpga_dip_switch_release(struct inode *minode, struct file *mfile) {
	fpga_dip_switch_port_usage = 0;

	return 0;
}



// when read from fpga_dip_switch device  ,call this function
ssize_t iom_fpga_dip_switch_read(struct file *inode, char *gdata, size_t length, loff_t *off_what) {
	unsigned char dip_sw_value;	

	dip_sw_value = iom_fpga_itf_read((unsigned int)IOM_FPGA_DIP_SWITCH_ADDRESS);

	if (copy_to_user(gdata, &dip_sw_value, 1))
		return -EFAULT;

	return length;	
}

int __init iom_fpga_dip_switch_init(void) {
	int result;

	result = register_chrdev(IOM_FPGA_DIP_SWITCH_MAJOR, IOM_FPGA_DIP_SWITCH_NAME, &iom_fpga_dip_switch_fops);
	if(result < 0) {
		printk(KERN_WARNING"Can't get any major\n");
		return result;
	}

	printk("init module, %s major number : %d\n", IOM_FPGA_DIP_SWITCH_NAME, IOM_FPGA_DIP_SWITCH_MAJOR);

	return 0;
}

void __exit iom_fpga_dip_switch_exit(void) {
	unregister_chrdev(IOM_FPGA_DIP_SWITCH_MAJOR, IOM_FPGA_DIP_SWITCH_NAME);
}

module_init(iom_fpga_dip_switch_init);
module_exit(iom_fpga_dip_switch_exit);

MODULE_LICENSE("GPL");
