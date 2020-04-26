#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    dev = open(BUZZER_DEVICE,O_RDWR);
    if(dev<0){
        printf("Device open error:%s\n",BUZZER_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & DEVICE node");
        msgBox.exec();
        exit(1);
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_toggled(bool checked)
{
    if(checked)
    {
        data = 1;
        retval=write(dev,&data,1);
        if(retval<0){
            printf("Write Error!\n");
            msgBox.setText("Write Error!");
            msgBox.exec();
            exit(1);
        }
        ui->pushButton->setText("Buzzer OFF");
    }
    else
    {
        data = 0;
        retval=write(dev,&data,1);
        if(retval<0){
            printf("Write Error!\n");
            msgBox.setText("Write Error!");
            msgBox.exec();
            exit(1);
        }
        ui->pushButton->setText("Buzzer ON");
    }
}

void MainWindow::on_Close_BT_clicked()
{
    this->close();
}
