#ifndef STRINGDATA_H
#define STRINGDATA_H

#include <QObject>


class StringData : public QObject
{
public:
    StringData();
    ~StringData();
    QString getStringData(QString listType, QString stringType);

private:
    QList<QList<QString>> stringData = {
        numList,
        infoTypeList,
        infoDetailList
    };

    QList<QString> numList = {
        " km/h",
        " km/h²",
        " °",
        ""
    };

    QList<QString> infoTypeList = {
        "台風警報: ",
        "波浪警報: ",
        "海上事故警報: "
    };

    QList<QString> infoDetailList = {
        "午後６時頃から台風接近による強風・高波が見込まれます。",
        "東京湾沖にて１０ｍの高波が発生しています。",
        "付近の海上にて船舶事故が発生しています。注意して進行してください。"
    };




    /*
     * [0]speedNum
     * [1]acDecelerationLevel;
     * [2]DirectionDegreeNum
     * [3]remainingFuelLevel
     * [4]
    */
};

#endif // STRINGDATA_H
