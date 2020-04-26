#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMessageBox>
#include <QMainWindow>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define LED_DEVICE "/dev/fpga_led"

namespace Ui{
    class MainWindow;
}

class MainWindow:public QMainWindow {
    Q_OBJECT
    
public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    
private slots:
    void on_LED_1_clicked(bool checked);
    void on_LED_2_clicked(bool checked);
    void on_LED_3_clicked(bool checked);
    void on_LED_4_clicked(bool checked);
    void on_LED_5_clicked(bool checked);
    void on_LED_6_clicked(bool checked);
    void on_LED_7_clicked(bool checked);
    void on_LED_8_clicked(bool checked);
    void on_Close_BT_clicked();
    
    void on_pushButton3_clicked();

private:
    Ui::MainWindow *ui;
    int dev;
    unsigned char data;
    unsigned char retval;
    QMessageBox msgBox;
};
#endif // MAINWINDOW_H
