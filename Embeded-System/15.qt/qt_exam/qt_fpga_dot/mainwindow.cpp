#include "fpga_dot_font.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    dev = open(FPGA_DOT_DEVICE,O_RDWR);
    if (dev<0){
        printf("Device open error : %s\n",FPGA_DOT_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & Device node");
        msgBox.exec();
        exit(1);
    }
    ui->textEdit->setText("0");
    ui->textEdit->setAlignment(Qt::AlignCenter);
    i=0;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_Up_BT_clicked()
{
    i++;
    if(i>9)
        i=0;
    char dot_value[1];
    itoa(i,dot_value,10);
    ui->textEdit->setText(dot_value);
    ui->textEdit->setAlignment(Qt::AlignCenter);
}

void MainWindow::on_Down_BT_clicked()
{
    i--;
    if(i<0)
        i=9;
    char dot_value[1];
    itoa(i,dot_value,10);
    ui->textEdit->setText(dot_value);
    ui->textEdit->setAlignment(Qt::AlignCenter);
}

void MainWindow::on_Set_BT_clicked()
{
    set_num = i;

    if(set_num<0 || set_num>9)
    {
        printf("Invalid Number (0~9)! \n");
        msgBox.setText("Invalid Number (0~9)");
        msgBox.exec();
        goto fail;
    }

    str_size = sizeof(fpga_number[set_num]);
    write(dev,fpga_number[set_num],str_size);

    fail:
        printf("retry");
}

void MainWindow::strreverse(char* begin, char* end)
{
    char aux;
    while(end>begin)
        aux=* end, *end --=* begin, *begin ++=aux;
}

void MainWindow::itoa(int value,char* str, int base)
{
    static char num[] = "0123456789abcdefghijklmnopqrstuvwxyz";
    char* wstr = str;
    int sign;

    if(base<2 || base>35)
    {
        *wstr = '\0';
        return;
    }

    if((sign=value) < 0)
        value = -value;
    do
        *wstr++ = num[value%base];

    while(value /= base);

    if(sign < 0)
        *wstr ++='_';
    *wstr = '\0';

    strreverse(str,wstr-1);
}

void MainWindow::on_Close_BT_clicked()
{
    this->close();
}

