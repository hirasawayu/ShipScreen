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

    void qmlSetup();
    void onPropertyChangedSlot(QList<QString> getData);
    void show();
    void hide();
    void switchScreenQml(QString stateType);

protected:
    QQmlApplicationEngine mainEngine;
    QQuickWindow* mainWindow;

    QQmlApplicationEngine signalHandleEngine;
    QQuickWindow* signalHandleWindow;

signals:

private slots:
    void onClickedButtonSlot(int buttonNum);


private:

};

#endif // CONTROL_H
