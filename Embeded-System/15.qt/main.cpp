#include "mainwindow.h"

#include <QApplication>

int main(int argc, char *arg v[]) {
    QApplication a(argc, argv);
    MainWindow w;
    w.setWindowFlags(Qt::Window | Qt::FramelessWindowHint);
    w.setFixedSize(800 ,480);
    w.show();
    return a.exec();
}
