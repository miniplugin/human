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

#define FPGA_DOT_DEVICE "/dev/fpga_dot"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void itoa(int value, char* str, int base);
    void strreverse(char* begin, char* end);

private slots:

    void on_Up_BT_clicked();

    void on_Down_BT_clicked();

    void on_Set_BT_clicked();

    void on_Close_BT_clicked();


private:
    Ui::MainWindow *ui;
    int i;
    int dev;
    int str_size;
    int set_num;
    QMessageBox msgBox;
};

#endif // MAINWINDOW_H
