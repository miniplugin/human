#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QTimer *timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()),this,SLOT(update()));
    timer->start(100);

    dev = open(FPGA_PUSH_SWITCH_DEVICE,O_RDWR);
    if(dev<0){
        printf("Device open error:%s\n",FPGA_PUSH_SWITCH_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & DEVICE node");
        msgBox.exec();
        exit(1);
    }
    buff_size=sizeof(push_sw_buff);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::update()
{
    read(dev, &push_sw_buff,buff_size);
    for(i=0;i<MAX_BUTTON;i++)
    {
        if(push_sw_buff[i]==1)
        {
            switch(i)
            {
            case 0:
                ui->Push_slider0->setValue(1);
                break;
            case 1:
                ui->Push_slider1->setValue(1);
                break;
            case 2:
                ui->Push_slider2->setValue(1);
                break;
            case 3:
                ui->Push_slider3->setValue(1);
                break;
            case 4:
                ui->Push_slider4->setValue(1);
                break;
            case 5:
                ui->Push_slider5->setValue(1);
                break;
            case 6:
                ui->Push_slider6->setValue(1);
                break;
            case 7:
                ui->Push_slider7->setValue(1);
                break;
            case 8:
                ui->Push_slider8->setValue(1);
                break;
            }
        }
        else
        {
            switch(i)
            {
            case 0:
                ui->Push_slider0->setValue(0);
                break;
            case 1:
                ui->Push_slider1->setValue(0);
                break;
            case 2:
                ui->Push_slider2->setValue(0);
                break;
            case 3:
                ui->Push_slider3->setValue(0);
                break;
            case 4:
                ui->Push_slider4->setValue(0);
                break;
            case 5:
                ui->Push_slider5->setValue(0);
                break;
            case 6:
                ui->Push_slider6->setValue(0);
                break;
            case 7:
                ui->Push_slider7->setValue(0);
                break;
            case 8:
                ui->Push_slider8->setValue(0);
                break;
            }
        }
    }
}

