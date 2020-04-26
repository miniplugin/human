/*
FPGA LED Ioremap Control
FILE : fpga_led_driver.c

라즈베리파이의 여러 주변장치 가운데 GPIO를 다루기 위한 드라이버를 제작.
그리고 그 GPIO가 FPGA의 LED를 다루는 input에 연결되어있음.

device file 제작 예제
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


#define IOM_LED_MAJOR 260			// ioboard led device major number
#define IOM_LED_NAME "fpga_led"		// ioboard led device name

#define IOM_LED_ADDRESS 0x08000016  // pysical address - GPIO를 통해 전달되기 때문에, 이 주소는 의미가 없어짐
extern unsigned char iom_fpga_itf_read(unsigned int addr);
extern ssize_t iom_fpga_itf_write(unsigned int addr, unsigned char value);

//Global variable
static int ledport_usage = 0;

// define functions...
ssize_t iom_led_write(struct file *inode, const char *gdata, size_t length, loff_t *off_what);
ssize_t iom_led_read(struct file *inode, char *gdata, size_t length, loff_t *off_what);
int iom_led_open(struct inode *minode, struct file *mfile);
int iom_led_release(struct inode *minode, struct file *mfile);

// define file_operations structure
struct file_operations iom_led_fops = {
	.owner		=	THIS_MODULE,	// 
	.open		=	iom_led_open,	// open
	.write		=	iom_led_write,	// write
	.read		=	iom_led_read,	// raed
	.release	=	iom_led_release // release
};
// 추가로
// module_init - inmod할 때 수행되는 것.
// module_exit - rmmod할 때 수행되는 것.
// 을 지정해줘야한다.

// when led device open, call this function
int iom_led_open(struct inode *minode, struct file *mfile)  {	
	if(ledport_usage != 0) return -EBUSY;
	ledport_usage = 1; // 마스크 같은 역활?
	return 0;
}

// when led device close ,call this function
int iom_led_release(struct inode *minode, struct file *mfile) {
	ledport_usage = 0;
	return 0;
}

// when write to led device, call this function
ssize_t iom_led_write(struct file *inode, const char *gdata, size_t length, loff_t *off_what) {
	unsigned char value;
	const char *tmp = gdata;

	if (copy_from_user(&value, tmp, 1))
		return -EFAULT;
	
	// fpga_interface_driver에 설정된 함수.
	// raspberry pi의 GPIO를 건드린다.
	iom_fpga_itf_write((unsigned int)IOM_LED_ADDRESS, value);
	
	return length;
}

// when read to led device, call this function
ssize_t iom_led_read(struct file *inode, char *gdata, size_t length, loff_t *off_what) {
	unsigned char value = 0;
	char *tmp = gdata;

	// GPIO를 사용해서 데이터를 읽는다.
	value = iom_fpga_itf_read((unsigned int)IOM_LED_ADDRESS);	    

	// kernel -> user로 데이터를 보내줌
	if (copy_to_user(tmp, &value, 1))
		return -EFAULT;

	return length;
}

int __init iom_led_init(void) {
	int result;
	
	// kernel에 각 device의 module을 번호 별로 read/write 함수 등이 몇 번에 지정되어있는지 관리한다.
	// IOM_LED_MAJOR - MAJOR 번호
	// IOM_LED_NAME  - device file의 이름(/dev/~)
	// &iom_led_fops - open/read/write/release 가 지정된 구조체
	result = register_chrdev(IOM_LED_MAJOR, IOM_LED_NAME, &iom_led_fops);
	if(result < 0) {
		printk(KERN_WARNING"Can't get any major\n");
		return result;
	}

	printk("init module, %s major number %d, minor number %d\n", IOM_LED_NAME, IOM_LED_MAJOR, result);

	return 0;
}

void __exit iom_led_exit(void)  {
	unregister_chrdev(IOM_LED_MAJOR, IOM_LED_NAME);
}

module_init(iom_led_init);
module_exit(iom_led_exit);

MODULE_LICENSE("GPL");
