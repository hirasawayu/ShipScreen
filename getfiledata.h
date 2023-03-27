#ifndef GETFILEDATA_H
#define GETFILEDATA_H

#include <QObject>
#include <QCoreApplication>
#include <QDebug>
#include <QtQuick/QQuickView>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QGuiApplication>
#include <QFile>
#include <QTextStream>
#include <QTimer>
#include <QThread>

#include "control.h"


class GetFileData : public QObject
{
    Q_OBJECT

public:
    GetFileData();
    ~GetFileData();
    bool readFile(QList<QString> &getData, int &loop);
    void timer();
    //QList<QString> getLineData();
    QTimer* qTimer;

private:
    QList<QString> getData;

    //QQmlApplicationEngine signalEngine;



};

#endif // GETFILEDATA_H
