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

    void qmlSetup(QString const iQmlFile);
    void show();
    void hide();
    void getDataSignal();
    void switchScreenQml(QString stateType);

protected:
    QQuickWindow* qQmlWindow;
    QQmlApplicationEngine qQmlEngine;

signals:

private slots:
    void onClickedButtonSlot(int buttonNum);

private:

};

#endif // CONTROL_H
