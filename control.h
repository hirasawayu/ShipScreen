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
#include "stringdata.h"

class Control :  public QObject
{
    Q_OBJECT
public:
    Control();
    ~Control();

    void show();
    void hide();
    void qmlSetProperty(QString objectName, QString data);
    void addListData(QString stringInfooString);
    void switchScreenQml(QString stateType);

signals:


private slots:
    void onPropertyChangedSlot();
    void updateScreenSlot();
    void onClickedButtonSlot(int buttonNum);


private:
    QQmlApplicationEngine mainEngine;
    QQuickWindow* mainWindow;
    QObject *rootObject;

    ManageData manageData;
    GetFileData getFileData;
    StringData stringData;
    QList<QString> getData;
    int loop = 0;
};

#endif // CONTROL_H
