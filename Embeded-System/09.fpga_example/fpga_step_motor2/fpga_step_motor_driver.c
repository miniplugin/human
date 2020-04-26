/* FPGA Step motor Ioremap Control
FILE : fpga_step_motor_driver.c*/

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


#define IOM_FPGA_STEP_MOTOR_MAJOR 267		// ioboard led device major number
#define IOM_FPGA_STEP_MOTOR_NAME "fpga_step_motor"		// ioboard led device name

#define IOM_FPGA_STEP_MOTOR_ON_ADDRESS 0x00C // pysical address
#define IOM_FPGA_STEP_MOTOR_DIR_ADDRESS 0x00E // pysical address
#define IOM_FPGA_STEP_MOTOR_SPEED_ADDRESS 0x010 // pysical address
extern unsigned char iom_fpga_itf_read(unsigned int addr);
extern ssize_t iom_fpga_itf_write(unsigned int addr, unsigned char value);

//Global variable
static int fpga_step_motor_port_usage = 0;

// define functions...
ssize_t iom_fpga_step_motor_write(struct file *inode, const char *gdata, size_t length, loff_t *off_what);
int iom_fpga_step_motor_open(struct inode *minode, struct file *mfile);
int iom_fpga_step_motor_release(struct inode *minode, struct file *mfile);

// define file_operations structure 
struct file_operations iom_fpga_step_motor_fops =
{
	owner:		THIS_MODULE,
	open:		iom_fpga_step_motor_open,
	write:		iom_fpga_step_motor_write,	
	release:	iom_fpga_step_motor_release,
};

// when fpga_step_motor device open ,call this function
int iom_fpga_step_motor_open(struct inode *minode, struct file *mfile) 
{	
	if(fpga_step_motor_port_usage != 0) return -EBUSY;

	fpga_step_motor_port_usage = 1;


	return 0;
}

// when fpga_step_motor device close ,call this function
int iom_fpga_step_motor_release(struct inode *minode, struct file *mfile) 
{
	fpga_step_motor_port_usage = 0;

	return 0;
}

// when write to fpga_step_motor device  ,call this function
ssize_t iom_fpga_step_motor_write(struct file *inode, const char *gdata, size_t length, loff_t *off_what) 
{
	int i;

	unsigned char value[3];
	const char *tmp = gdata;

	if (copy_from_user(&value, tmp, length))
		return -EFAULT;

	iom_fpga_itf_write((unsigned int)IOM_FPGA_STEP_MOTOR_ON_ADDRESS, value[0]&0xF);
	iom_fpga_itf_write((unsigned int)IOM_FPGA_STEP_MOTOR_DIR_ADDRESS, value[1]&0xF);
	iom_fpga_itf_write((unsigned int)IOM_FPGA_STEP_MOTOR_SPEED_ADDRESS, value[2]&0xFF);
	
	return length;
}


int __init iom_fpga_step_motor_init(void)
{
	int result;

	result = register_chrdev(IOM_FPGA_STEP_MOTOR_MAJOR, IOM_FPGA_STEP_MOTOR_NAME, &iom_fpga_step_motor_fops);
	if(result < 0) {
		printk(KERN_WARNING"Can't get any major\n");
		return result;
	}

	printk("init module, %s major number : %d\n", IOM_FPGA_STEP_MOTOR_NAME, IOM_FPGA_STEP_MOTOR_MAJOR);

	return 0;
}

void __exit iom_fpga_step_motor_exit(void) 
{
	unregister_chrdev(IOM_FPGA_STEP_MOTOR_MAJOR, IOM_FPGA_STEP_MOTOR_NAME);
}

module_init(iom_fpga_step_motor_init);
module_exit(iom_fpga_step_motor_exit);

MODULE_LICENSE("GPL");
