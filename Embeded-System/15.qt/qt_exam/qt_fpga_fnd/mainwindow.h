#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMessageBox>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <string.h>

#define MAX_DIGIT 4
#define FND_DEVICE "/dev/fpga_fnd"

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
    void on_FND_Set_BT_clicked();
    void on_Close_BT_clicked();

private:
    Ui::MainWindow *ui;
    int dev;
    unsigned char data[4];
    unsigned char retval;
    int i;
    int str_size;
    QMessageBox msgBox;

};

#endif // MAINWINDOW_H
