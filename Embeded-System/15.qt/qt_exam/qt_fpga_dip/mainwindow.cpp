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

    dev = open(FPGA_DIP_SWITCH_DEVICE,O_RDWR);
    if(dev<0){
        printf("Device Open Error : %s\n",FPGA_DIP_SWITCH_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & Device node");
        msgBox.exec();
        exit(1);
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::update()
{
    int dip[8];
    int i;
    read(dev,&dip_sw_buff,1);

    for(i=0;i<8;i++){
        dip[i] = dip_sw_buff%2;
        dip_sw_buff = dip_sw_buff/2;
    }

    if(dip[0]==1)
        ui->Dip_1->setValue(0);
    else
        ui->Dip_1->setValue(1);
    if(dip[1]==1)
        ui->Dip_2->setValue(0);
    else
        ui->Dip_2->setValue(1);
    if(dip[2]==1)
        ui->Dip_3->setValue(0);
    else
        ui->Dip_3->setValue(1);
    if(dip[3]==1)
        ui->Dip_4->setValue(0);
    else
        ui->Dip_4->setValue(1);
    if(dip[4]==1)
        ui->Dip_5->setValue(0);
    else
        ui->Dip_5->setValue(1);
    if(dip[5]==1)
        ui->Dip_6->setValue(0);
    else
        ui->Dip_6->setValue(1);
    if(dip[6]==1)
        ui->Dip_7->setValue(0);
    else
        ui->Dip_7->setValue(1);
    if(dip[7]==1)
        ui->Dip_8->setValue(0);
    else
        ui->Dip_8->setValue(1);

}

