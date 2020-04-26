#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    dev = open(FND_DEVICE,O_RDWR);
    if (dev<0){
        printf("Device open error : %s\n",FND_DEVICE);
        msgBox.setText("Device Open Error!");
        msgBox.setInformativeText("Check Module & Device node");
        msgBox.exec();
        exit(1);
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_FND_Set_BT_clicked()
{
    int retval;
    QString Fnd_value = ui->FND_Value->toPlainText();
    QByteArray bytevalue = Fnd_value.toLocal8Bit();
    char *text_value = bytevalue.data();

    str_size = (strlen(text_value));
    printf("%d",str_size);
    if(str_size>MAX_DIGIT)
    {
        printf("Warning! 4 Digit number only!\n");
        msgBox.setText("Warning! 4 Digit number only!");
        msgBox.exec();
        str_size=MAX_DIGIT;
        goto fail;
    }

    for(i=0;i<str_size;i++)
    {
        if((text_value[i]<0x30)||(text_value[i]>0x39)){
            printf("Error! Invalid Value!\n");
            msgBox.setText("Error! Invalid Value!");
            msgBox.exec();
            goto fail;
        }
        data[i]=text_value[i]-0x30;
    }

    retval = write(dev,&data,4);
    if(retval<0)
    {
        printf("Write Error\n");
        msgBox.setText("Write Error");
        msgBox.exec();
    }

    fail:
        printf("Set Value");
}

void MainWindow::on_Close_BT_clicked()
{
    this->close();
}
