#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.setWindowFlags(Qt::Window|Qt::FramelessWindowHint);
    w.setFixedSize(800,480);
    w.setEnabled(false);
    w.show();

    return a.exec();
}
