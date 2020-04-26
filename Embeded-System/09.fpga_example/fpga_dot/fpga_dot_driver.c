/* FPGA Dot Matrix Ioremap Control
FILE : fpga_dot_driver.c*/

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

#include "./fpga_dot_font.h"

#define IOM_FPGA_DOT_MAJOR 262		// ioboard led device major number
#define IOM_FPGA_DOT_NAME "fpga_dot"		// ioboard led device name

#define IOM_FPGA_DOT_ADDRESS 0x210 // pysical address
extern unsigned char iom_fpga_itf_read(unsigned int addr);
extern ssize_t iom_fpga_itf_write(unsigned int addr, unsigned char value);

//Global variable
static int fpga_dot_port_usage = 0;

// define functions...
ssize_t iom_fpga_dot_write(struct file *inode, const char *gdata, size_t length, loff_t *off_what);
int iom_fpga_dot_open(struct inode *minode, struct file *mfile);
int iom_fpga_dot_release(struct inode *minode, struct file *mfile);

// define file_operations structure 
struct file_operations iom_fpga_dot_fops =
{
	owner:		THIS_MODULE,
	open:		iom_fpga_dot_open,
	write:		iom_fpga_dot_write,	
	release:	iom_fpga_dot_release,
};

// when fpga_dot device open ,call this function
int iom_fpga_dot_open(struct inode *minode, struct file *mfile) 
{	
	if(fpga_dot_port_usage != 0) return -EBUSY;

	fpga_dot_port_usage = 1;


	return 0;
}

// when fpga_dot device close ,call this function
int iom_fpga_dot_release(struct inode *minode, struct file *mfile) 
{
	fpga_dot_port_usage = 0;

	return 0;
}

// when write to fpga_dot device  ,call this function
ssize_t iom_fpga_dot_write(struct file *inode, const char *gdata, size_t length, loff_t *off_what) 
{
	int i;

	unsigned char value[10];
	const char *tmp = gdata;

	if (copy_from_user(&value, tmp, length))
		return -EFAULT;

	for(i=0;i<length;i++)
	{
	    iom_fpga_itf_write((unsigned int)IOM_FPGA_DOT_ADDRESS+i, value[i]&0x7F);
	}
	
	return length;
}


int __init iom_fpga_dot_init(void)
{
	int result;

	result = register_chrdev(IOM_FPGA_DOT_MAJOR, IOM_FPGA_DOT_NAME, &iom_fpga_dot_fops);
	if(result < 0) {
		printk(KERN_WARNING"Can't get any major\n");
		return result;
	}

	printk("init module, %s major number : %d\n", IOM_FPGA_DOT_NAME, IOM_FPGA_DOT_MAJOR);

	return 0;
}

void __exit iom_fpga_dot_exit(void) 
{
	unregister_chrdev(IOM_FPGA_DOT_MAJOR, IOM_FPGA_DOT_NAME);
}

module_init(iom_fpga_dot_init);
module_exit(iom_fpga_dot_exit);
MODULE_LICENSE("GPL");
