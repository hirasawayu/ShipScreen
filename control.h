#ifndef CONTROL_H
#define CONTROL_H

#include <QObject>
#include <QCoreApplication>
#include <QDebug>
#include <iostream>
#include <QtQuick/QQuickView>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QGuiApplication>
#include <QThread>

#include "getfiledata.h"
#include "managedata.h"

class Control :  public QObject
{
    Q_OBJECT
public:
    Control();
    ~Control();

    void initialSetup();
    void controller();
    void onPropertyChangedSlot(QList<QString> getData);
    void show();
    void hide();
    void switchScreenQml(QString stateType);

signals:

private slots:
    void onClickedButtonSlot(int buttonNum);


private:
    QQmlApplicationEngine mainEngine;
    QQuickWindow* mainWindow;

};

#endif // CONTROL_H
