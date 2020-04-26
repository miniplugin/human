#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QGroupBox>
#include <QVBoxLayout>

MainWindow::MainWindow(QWidget *parent): QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);
    dev = open(LED_DEVICE, O_RDWR);
    if(dev < 0) {
        printf("Device open error:%s\n", LED_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & DEVICE node");
        msgBox.exec();
        exit(1);
    }
}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::on_LED_1_clicked(bool checked) {
    if(checked) data = 1;
    else data = 0;
    write(dev, &data, 1);
}

void MainWindow::on_LED_2_clicked(bool checked) {
    if(checked) data = 2;
    else data = 0;
    write(dev, &data, 1);
}

void MainWindow::on_LED_3_clicked(bool checked) {
    if(checked) data = 4;
    else data = 0;
    write(dev, &data, 1);
}

void MainWindow::on_LED_4_clicked(bool checked) {
    if(checked) data = 8;
    else data = 0;
    write(dev, &data, 1);
}

void MainWindow::on_LED_5_clicked(bool checked) {
    if(checked) data = 16;
    else data = 0;
    write(dev, &data, 1);
}
void MainWindow::on_LED_6_clicked(bool checked) {
    if(checked) data = 32;
    else data = 0;
    write(dev, &data, 1);
}
void MainWindow::on_LED_7_clicked(bool checked) {
    if(checked) data = 64;
    else data = 0;
    write(dev, &data, 1);
}
void MainWindow::on_LED_8_clicked(bool checked) {
    if(checked) data = 128;
    else data = 0;
    write(dev, &data, 1);
}
void MainWindow::on_Close_BT_clicked() {
    this->close();
}

void MainWindow::on_pushButton3_clicked() {
    data = 0xff;
    write(dev, &data, 1);
}
