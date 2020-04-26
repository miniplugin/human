#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMessageBox>
#include <QTimer>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/io.h>
#include <signal.h>

#define MAX_BUTTON 9
#define FPGA_PUSH_SWITCH_DEVICE "/dev/fpga_push_switch"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void update();

private:
    Ui::MainWindow *ui;
    int i;
    int dev;
    int buff_size;

    unsigned char push_sw_buff[MAX_BUTTON];
    QMessageBox msgBox;
};

#endif // MAINWINDOW_H
