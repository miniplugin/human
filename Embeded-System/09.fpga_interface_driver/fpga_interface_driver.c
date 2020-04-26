/* FPGA LED Ioremap Control
FILE : fpga_fpga_itf_driver.c*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/gpio.h>
#include <asm-generic/bitsperlong.h>

#define CTRL_nWE	0
#define CTRL_nOE	1
#define CTRL_nCS	2

static struct gpio iom_fpga_address[] = {  // A1 ~ A11, A0=LOW
    /* { 10, GPIOF_OUT_INIT_LOW, "ADDRESS 00" }, */ { 11, GPIOF_OUT_INIT_LOW, "ADDRESS 01" },
    { 12, GPIOF_OUT_INIT_LOW, "ADDRESS 02" }, { 13, GPIOF_OUT_INIT_LOW, "ADDRESS 03" },
    { 14, GPIOF_OUT_INIT_LOW, "ADDRESS 04" }, { 15, GPIOF_OUT_INIT_LOW, "ADDRESS 05" },
    { 16, GPIOF_OUT_INIT_LOW, "ADDRESS 06" }, { 17, GPIOF_OUT_INIT_LOW, "ADDRESS 07" },
    { 18, GPIOF_OUT_INIT_LOW, "ADDRESS 08" }, { 19, GPIOF_OUT_INIT_LOW, "ADDRESS 09" },
    { 20, GPIOF_OUT_INIT_LOW, "ADDRESS 10" }, { 21, GPIOF_OUT_INIT_LOW, "ADDRESS 11" },
};

static struct gpio iom_fpga_data[] = {
    { 2, GPIOF_OUT_INIT_LOW, "DATA 0" }, { 3, GPIOF_OUT_INIT_LOW, "DATA 1" },
    { 4, GPIOF_OUT_INIT_LOW, "DATA 2" }, { 5, GPIOF_OUT_INIT_LOW, "DATA 3" },
    { 6, GPIOF_OUT_INIT_LOW, "DATA 4" }, { 7, GPIOF_OUT_INIT_LOW, "DATA 5" },
    { 8, GPIOF_OUT_INIT_LOW, "DATA 6" }, { 9, GPIOF_OUT_INIT_LOW, "DATA 7" },
};

static struct gpio iom_fpga_control[] = {
    { 22, GPIOF_OUT_INIT_LOW, "nWE" },
    { 23, GPIOF_OUT_INIT_LOW, "nOE" },
    { 25, GPIOF_OUT_INIT_LOW, "nCS" },
};

static void iom_fpga_itf_set_default(void) {
    int i = 0;

    gpio_set_value(10, 0); // A0: always set to LOW

    for (i = 0; i < ARRAY_SIZE(iom_fpga_address); i++) {
	    gpio_set_value(iom_fpga_address[i].gpio, 0);
    }

    for (i = 0; i < ARRAY_SIZE(iom_fpga_data); i++) {
	    gpio_set_value(iom_fpga_data[i].gpio, 0);
    }

    for (i = 0; i < ARRAY_SIZE(iom_fpga_control); i++) {
	    gpio_set_value(iom_fpga_control[i].gpio, 1);
    }
}

static int iom_fpga_itf_open(void) {
    int ret = 0;

    ret = gpio_request_array(iom_fpga_address, ARRAY_SIZE(iom_fpga_address));
    if (ret) {
        printk(KERN_ERR "Unable to request address GPIOs: %d\n", ret);
        return ret;
    }

    ret = gpio_request_array(iom_fpga_data, ARRAY_SIZE(iom_fpga_data));
    if (ret) {
        printk(KERN_ERR "Unable to request data GPIOs: %d\n", ret);
        return ret;
    }

    ret = gpio_request_array(iom_fpga_control, ARRAY_SIZE(iom_fpga_control));
    if (ret) {
        printk(KERN_ERR "Unable to request control GPIOs: %d\n", ret);
        return ret;
    }

    iom_fpga_itf_set_default();
    return ret;
}

static int iom_fpga_itf_release(void) {
    iom_fpga_itf_set_default();

    gpio_free_array(iom_fpga_address, ARRAY_SIZE(iom_fpga_address));
    gpio_free_array(iom_fpga_data, ARRAY_SIZE(iom_fpga_data));
    gpio_free_array(iom_fpga_control, ARRAY_SIZE(iom_fpga_control));

    return 0;
}

ssize_t iom_fpga_itf_write(unsigned int addr, unsigned char value) {
    size_t length = 1;
    int i = 0;

    printk("FPGA WRITE: address = 0x%x, data = 0x%x \n", addr, value);

    for (i = 0; i < ARRAY_SIZE(iom_fpga_address); i++) {
	    gpio_set_value(iom_fpga_address[i].gpio, (addr>>i) & 0x1);
    }

    for (i = 0; i < ARRAY_SIZE(iom_fpga_data); i++) {
	    gpio_set_value(iom_fpga_data[i].gpio, (value>>i) & 0x1);
    }

    gpio_set_value(iom_fpga_control[CTRL_nCS].gpio, 0); udelay(500);
    gpio_set_value(iom_fpga_control[CTRL_nWE].gpio, 0); udelay(500);
    //printk("CS:%d, ", gpio_get_value(iom_fpga_control[CTRL_nCS].gpio)); 
    //printk("WE:%d, ", gpio_get_value(iom_fpga_control[CTRL_nWE].gpio)); 
    //printk("\n");
    gpio_set_value(iom_fpga_control[CTRL_nWE].gpio, 1);
    gpio_set_value(iom_fpga_control[CTRL_nCS].gpio, 1);

    /*
    // Debugging...
    for (i=0; i<ARRAY_SIZE(iom_fpga_address); i++) {
	    printk("Address(%d):%d, ", i, gpio_get_value(iom_fpga_address[i].gpio));
    }

    printk("\n");
    for (i=0; i<ARRAY_SIZE(iom_fpga_data); i++) {
	    printk("Data(%d):%d, ", i, gpio_get_value(iom_fpga_data[i].gpio));
    }

    printk("\n");
    printk("CS:%d, ", gpio_get_value(iom_fpga_control[CTRL_nCS].gpio)); 
    printk("WE:%d, ", gpio_get_value(iom_fpga_control[CTRL_nWE].gpio)); 
    printk("\n");
    */

    return length;
}
EXPORT_SYMBOL(iom_fpga_itf_write);

unsigned char iom_fpga_itf_read(unsigned int addr) {
    unsigned char value = 0;
    int i = 0;

    for (i=0; i < ARRAY_SIZE(iom_fpga_address); i++) {
	    gpio_set_value(iom_fpga_address[i].gpio, (addr>>i) & 0x1);
    }

    gpio_set_value(iom_fpga_control[CTRL_nCS].gpio, 0); udelay(500);
    gpio_set_value(iom_fpga_control[CTRL_nOE].gpio, 0); udelay(500);

    for (i=0; i < ARRAY_SIZE(iom_fpga_data); i++) {
	    value += gpio_get_value(iom_fpga_data[i].gpio) << i;
    }

    gpio_set_value(iom_fpga_control[CTRL_nCS].gpio, 1);
    gpio_set_value(iom_fpga_control[CTRL_nOE].gpio, 1);

    printk("FPGA READ: address = 0x%x, data = 0x%x \n", addr, value);

    return value;
}
EXPORT_SYMBOL(iom_fpga_itf_read);

int __init iom_fpga_itf_init(void) {
    printk("init module: %s\n", __func__);
    iom_fpga_itf_open();
    return 0;
}

void __exit iom_fpga_itf_exit(void)  {
    printk("exit module: %s\n", __func__);
    iom_fpga_itf_release();
}

module_init(iom_fpga_itf_init);
module_exit(iom_fpga_itf_exit);

MODULE_LICENSE("GPL");
