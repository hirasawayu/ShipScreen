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


class ManageData : public QObject
{
public:
    ManageData();
    ~ManageData();
    void setNumData(int settingNumData, QString &objectName, int i);
    //bool setNumData(int dataType, int numData, QString &objectName);
    int setStringData(int settingInfoTypeNum, int settingInfoDetailNum, int settingImportantInfoFlag);




signals:

private slots:

private:

    //数値用の構造体
    int numData[4] = {0};
    QList<QString> objectNames = {"speedNum", "acDecelerationLevel", "directionDegreeNum", "remainingFuelLevel"};


    //旧バージョン
    /*
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
    */

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
    int infoDetailNum;
    int importantInfoFlag;
    };

    MessageInfo messageInfo[30];

    //messageInfoの何番目の要素にデータを格納するかを指定する
    int emptyMessageInfoPlace = 0;
};

#endif // MANAGEDATA_H
