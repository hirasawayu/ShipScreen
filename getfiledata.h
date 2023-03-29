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


class GetFileData : public QObject
{
    Q_OBJECT

public:
    GetFileData();
    ~GetFileData();
    bool readFile(QList<QString> &getData, int &loop);
    //QList<QString> getLineData();

signals:
    void onPropertyChangedSignal();

private slots:

private:
    QTimer *timer;

};

#endif // GETFILEDATA_H
