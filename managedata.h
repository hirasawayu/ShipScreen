#ifndef MANAGEDATA_H
#define MANAGEDATA_H

#include <QObject>
#include <QCoreApplication>
#include <QDebug>
#include <iostream>
#include <QtQuick/QQuickView>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QGuiApplication>
#include <QTextStream>


class ManageData
{
public:
    ManageData();
    ~ManageData();
    bool setNumData(int dataType, int numData);
    void setStringData(int infoTypeNum, QString dataString, int importantInfoFlag);



signals:

private slots:

private:

    //数値用の構造体
    struct NumInfo
    {
        int numData;
        QString objectName;
    };

    NumInfo numInfo[4] = {
        {0, "speedNum"},
        {0, "acDecelerationLevel"},
        {0, "directionDegreeNum"},
        {0, "remainingFuelLevel"}
    };

    /*
     * [0]speedNum
     * [1]acDecelerationLevel;
     * [2]DirectionDegreeNum
     * [3]remainingFuelLevel
    */

    //現在時刻
    time_t currentTime;

    //メッセージ用の構造体
    struct MessageInfo
    {
    int infoTypeNum;
    QString stringData;
    int importantInfoFlag;
    };

    MessageInfo messageInfo[30];

    //messageInfoの何番目の要素にデータを格納するかを指定する
    int emptyMessageInfoSpace = 0;




};

#endif // MANAGEDATA_H
