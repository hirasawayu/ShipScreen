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
    int getNumData(int numType);
    void setNumData(int settingNumData, int i);
    //bool setNumData(int dataType, int numData, QString &objectName);
    int setStringData(int settingInfoTypeNum, int settingInfoDetailNum, int settingImportantInfoFlag);
    bool checkDataState(int numType);
    int updateCurrentDirectionDegreeNum(bool &directionChangeFlag);




signals:

private slots:

private:

    //数値用の構造体
    int numData[5] = {0};

    /*
     * [0]speedNum
     * [1]acDecelerationLevel
     * [2]directionDegreeNum (set)
     * [3]remainingFuelLevel
     *
     * //ファイルから入力しないデータ
     * [n+1]currentDirectionDegreeNum
     * */

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
    int emptyMessageInfoPosition = 0;
    int weatherConditionInfoPosition = 0;
    int marineConditionInfoPosition = 0;
};

#endif // MANAGEDATA_H
