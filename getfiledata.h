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
    void readFile(QString fileName);
    void timer();
    QTimer* qTimer;

private:


};

#endif // GETFILEDATA_H
