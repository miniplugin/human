#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMessageBox>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define MOTOR_ATTRIBUTE_ERROR_RANGE 4
#define FPGA_STEP_MOTOR_DEVICE "/dev/fpga_step_motor"

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
    void on_Active_BT_toggled(bool checked);

    void on_Direction_BT_toggled(bool checked);

    void on_Speed_Bar_sliderMoved(int position);

    void on_Close_BT_clicked();

private:
    Ui::MainWindow *ui;
    int dev;
    int motor_action;
    int motor_direction;
    int motor_speed;
    unsigned char motor_state[3];
    QMessageBox msgBox;
};

#endif // MAINWINDOW_H
