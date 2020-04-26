#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    dev = open(FPGA_TEXT_LCD_DEVICE,O_RDWR);
    if(dev<0){
        printf("Device open error:%s\n",FPGA_TEXT_LCD_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & DEVICE node");
        msgBox.exec();
        exit(1);
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{

    memset(string,0,sizeof(string));

    QString Text1 = ui->textEdit->toPlainText();
    QByteArray bytevalue = Text1.toLocal8Bit();
    char* text_value = bytevalue.data();
    str_size=strlen(text_value);

    QString Text2 = ui->textEdit_2->toPlainText();
    QByteArray bytevalue2 = Text2.toLocal8Bit();
    char* text_value2 = bytevalue2.data();
    str_size2=strlen(text_value2);

    if(strlen(text_value)>LINE_BUFF||strlen(text_value2)>LINE_BUFF)
    {
        printf("16 Alphanumeric characters on a line! \n");
        msgBox.setText("16 alphanumberic characters on a line!");
        msgBox.exec();
        goto fail;
    }

    if(str_size>0){
        strncat(string,text_value,str_size);
        memset(string+str_size,' ',LINE_BUFF-str_size);
    }

    if(str_size2>0){
        strncat(string,text_value2,str_size2);
        memset(string+LINE_BUFF+str_size2,' ',LINE_BUFF-str_size2);
    }

    write(dev,string,MAX_BUFF);

    fail:
        printf("retry");
}

void MainWindow::on_Close_BT_clicked()
{
    this->close();
}
