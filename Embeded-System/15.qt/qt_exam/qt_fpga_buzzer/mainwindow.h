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

#define BUZZER_DEVICE "/dev/fpga_buzzer"

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
    void on_pushButton_toggled(bool checked);

    void on_Close_BT_clicked();

private:
    Ui::MainWindow *ui;
    int dev;
    int retval;
    unsigned char data;
    QMessageBox msgBox;
};

#endif // MAINWINDOW_H
