#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

MODULE_LICENSE("GPL");//���̼��� ǥ��

static int set_module(void)
{
        int i;
        printk(KERN_EMERG "hello module\n");//KERN_ALERT�� ���� �α� ���� ����
        asm("mrs %0, cpsr" : "=r" (i));
        printk(KERN_EMERG "cpsr : 0x%x\n", i);
        return 0;
}

static void cleanup_init(void)
{
        printk(KERN_ALERT "bye module\n");
}
module_init(set_module);
module_exit(cleanup_init);
