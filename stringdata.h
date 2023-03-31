#ifndef STRINGDATA_H
#define STRINGDATA_H

#include <QObject>


class StringData : public QObject
{
public:
    StringData();
    ~StringData();
    void getNumString(int numType, QString &numString, QString &numObjectName);
    void getStringInfo(int stringType, QString &stringInfoString, QString &stringObjectName);
    QString getDetailInfo(int detailInfoNum);

private:

    struct NumInfoList
    {
        QString numString;
        QString numObjectName;
    };

    NumInfoList numInfoList[4] = {
        {" km/h", "speedNum"},
        {" km/h²", "acDecelerationLevel"},
        {" °", "directionDegreeNum"},
        {"", "remainingFuelLevel"}
    };

    struct StringInfoList
    {
        QString stringInfoString;
        QString stringObjectName;
    };

    StringInfoList stringInfoList[4] = {
        {"天候情報: ", "showWeatherConditionInfoText"},
        {"台風警報: ", "showMarineConditionInfoText"},
        {"波浪警報: ", "showMarineConditionInfoText"},
        {"海上事故警報: ", "showMarineConditionInfoText"}
    };

    QList<QString> detailInfoList = {
        "晴れのち曇り/降水確率２０％",
        "午後６時頃から台風接近による強風・高波が見込まれます。",
        "東京湾沖にて１０ｍの高波が発生しています。",
        "付近の海上にて船舶事故が発生。注意して進行してください。"
    };
};

#endif // STRINGDATA_H
