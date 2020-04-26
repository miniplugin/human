/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.7.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QGridLayout *gridLayout;
    QRadioButton *LED_4;
    QRadioButton *LED_6;
    QRadioButton *LED_3;
    QRadioButton *LED_8;
    QRadioButton *LED_5;
    QRadioButton *LED_2;
    QRadioButton *LED_1;
    QRadioButton *LED_7;
    QPushButton *Close_BT;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(800, 480);
        MainWindow->setCursor(QCursor(Qt::BlankCursor));
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        gridLayout = new QGridLayout(centralWidget);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        LED_4 = new QRadioButton(centralWidget);
        LED_4->setObjectName(QStringLiteral("LED_4"));
        LED_4->setCursor(QCursor(Qt::BlankCursor));
        LED_4->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_4, 1, 0, 1, 1);

        LED_6 = new QRadioButton(centralWidget);
        LED_6->setObjectName(QStringLiteral("LED_6"));
        LED_6->setCursor(QCursor(Qt::BlankCursor));
        LED_6->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_6, 0, 3, 1, 1);

        LED_3 = new QRadioButton(centralWidget);
        LED_3->setObjectName(QStringLiteral("LED_3"));
        LED_3->setCursor(QCursor(Qt::BlankCursor));
        LED_3->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_3, 1, 2, 1, 1);

        LED_8 = new QRadioButton(centralWidget);
        LED_8->setObjectName(QStringLiteral("LED_8"));
        LED_8->setCursor(QCursor(Qt::BlankCursor));
        LED_8->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_8, 0, 0, 1, 1);

        LED_5 = new QRadioButton(centralWidget);
        LED_5->setObjectName(QStringLiteral("LED_5"));
        LED_5->setCursor(QCursor(Qt::BlankCursor));
        LED_5->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_5, 0, 4, 1, 1);

        LED_2 = new QRadioButton(centralWidget);
        LED_2->setObjectName(QStringLiteral("LED_2"));
        LED_2->setCursor(QCursor(Qt::BlankCursor));
        LED_2->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_2, 1, 3, 1, 1);

        LED_1 = new QRadioButton(centralWidget);
        LED_1->setObjectName(QStringLiteral("LED_1"));
        LED_1->setCursor(QCursor(Qt::BlankCursor));
        LED_1->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_1, 1, 4, 1, 1);

        LED_7 = new QRadioButton(centralWidget);
        LED_7->setObjectName(QStringLiteral("LED_7"));
        LED_7->setCursor(QCursor(Qt::BlankCursor));
        LED_7->setStyleSheet(QLatin1String("QRadioButton::indicator{\n"
"	width: 120px;\n"
"	height: 120px;\n"
"}"));

        gridLayout->addWidget(LED_7, 0, 2, 1, 1);

        Close_BT = new QPushButton(centralWidget);
        Close_BT->setObjectName(QStringLiteral("Close_BT"));
        Close_BT->setCursor(QCursor(Qt::BlankCursor));

        gridLayout->addWidget(Close_BT, 2, 2, 1, 2);

        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 800, 27));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", Q_NULLPTR));
        LED_4->setText(QApplication::translate("MainWindow", "D5", Q_NULLPTR));
        LED_6->setText(QApplication::translate("MainWindow", "D3", Q_NULLPTR));
        LED_3->setText(QApplication::translate("MainWindow", "D6", Q_NULLPTR));
        LED_8->setText(QApplication::translate("MainWindow", "D1", Q_NULLPTR));
        LED_5->setText(QApplication::translate("MainWindow", "D4", Q_NULLPTR));
        LED_2->setText(QApplication::translate("MainWindow", "D7", Q_NULLPTR));
        LED_1->setText(QApplication::translate("MainWindow", "D8", Q_NULLPTR));
        LED_7->setText(QApplication::translate("MainWindow", "D2", Q_NULLPTR));
        Close_BT->setText(QApplication::translate("MainWindow", "Close", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
