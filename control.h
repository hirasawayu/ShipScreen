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
#include <QTranslator>

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
    void qmlSetProperty(QString objectName, const char *propertyName, QString data);
    void switchScreenQml(QString stateType);
    void onDirectionChange(bool updateFlag, bool directionChangeFlag);

signals:


private slots:
    void onPropertyChangedSlot();
    void updateScreenSlot();
    void onClickedButtonSlot(int buttonNum);
    void onClickedHelpButtonSlot(int buttonState);

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
