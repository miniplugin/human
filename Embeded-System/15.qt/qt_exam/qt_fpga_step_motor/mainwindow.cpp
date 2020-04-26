#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    dev = open(FPGA_STEP_MOTOR_DEVICE,O_RDWR);
    if(dev<0){
        printf("Device open error:%s\n",FPGA_STEP_MOTOR_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & DEVICE node");
        msgBox.exec();
        exit(1);
    }
    motor_action=0;
    motor_direction=0;
    motor_speed=250;
    ui->Speed_Value->setText("250");
    ui->Speed_Value->setAlignment(Qt::AlignCenter);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_Active_BT_toggled(bool checked)
{
    if(checked)
    {
        printf("Start Step Motor\n");
        memset(motor_state,0,sizeof(motor_state));
        motor_action=1;
        motor_state[0]=(unsigned char)motor_action;
        motor_state[1]=(unsigned char)motor_direction;
        motor_state[2]=(unsigned char)motor_speed;
        ui->Active_BT->setText("STOP");
        write(dev,motor_state,3);
    }
    else
    {
        printf("Stop Step Motor\n");
        memset(motor_state,0,sizeof(motor_state));
        motor_action=0;
        motor_state[0]=(unsigned char)motor_action;
        motor_state[1]=(unsigned char)motor_direction;
        motor_state[2]=(unsigned char)motor_speed;
        ui->Active_BT->setText("START");
        write(dev,motor_state,3);
    }
}

void MainWindow::on_Direction_BT_toggled(bool checked)
{
    if(checked)
    {
        printf("Left \n");
        memset(motor_state,0,sizeof(motor_state));
        motor_direction=1;
        motor_state[0]=(unsigned char)motor_action;
        motor_state[1]=(unsigned char)motor_direction;
        motor_state[2]=(unsigned char)motor_speed;
        ui->Direction_BT->setText("RIGHT");
        write(dev,motor_state,3);
    }
    else
    {
        printf("RIGHT \n");
        memset(motor_state,0,sizeof(motor_state));
        motor_direction=0;
        motor_state[0]=(unsigned char)motor_action;
        motor_state[1]=(unsigned char)motor_direction;
        motor_state[2]=(unsigned char)motor_speed;
        ui->Direction_BT->setText("LEFT");
        write(dev,motor_state,3);
    }
}

void MainWindow::on_Speed_Bar_sliderMoved(int position)
{
    printf("Change Value %d \n",position);
    QString Value = QString::number(position);
    memset(motor_state,0,sizeof(motor_state));
    motor_speed = position;
    motor_state[0]=(unsigned char)motor_action;
    motor_state[1]=(unsigned char)motor_direction;
    motor_state[2]=(unsigned char)motor_speed;
    write(dev,motor_state,3);

    ui->Speed_Value->setText(Value);
    ui->Speed_Value->setAlignment(Qt::AlignCenter);

}

void MainWindow::on_Close_BT_clicked()
{
    this->close();
}
