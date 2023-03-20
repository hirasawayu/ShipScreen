#ifndef GETFILEDATA_H
#define GETFILEDATA_H

#include <QObject>
#include <QCoreApplication>
#include <QDebug>
#include <iostream>
#include <QtQuick/QQuickView>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QGuiApplication>
#include <QFile>
#include <QTextStream>
#include <QTimer>
#include <QThread>


class GetFileData : public QObject
{
    Q_OBJECT

public:
    GetFileData(QString fileName);
    ~GetFileData();
    void timer();
    QTimer* qTimer;

private:


};

#endif // GETFILEDATA_H
