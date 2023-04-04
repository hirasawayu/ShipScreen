#ifndef STRINGDATA_H
#define STRINGDATA_H

#include <QObject>


class StringData : public QObject
{
    Q_OBJECT

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
        {tr("Weather Info: "), "showWeatherConditionInfoText"},
        {tr("Typhoon Alert: "), "showMarineConditionInfoText"},
        {tr("Tidal Wave Alert: "), "showMarineConditionInfoText"},
        {tr("Accident Alert: "), "showMarineConditionInfoText"}
    };

    QList<QString> detailInfoList = {
        tr("sunny to cloudyl/20% chance of rain"),
        tr("Strong wind and tidal wave are predicted from 6 p.m. due to incoming typhoon."),
        tr("Over 10-meter tidal wave are observed along the Tokyo Bay."),
        tr("Be Aware of a marine accident occured around this area.")
    };
};

#endif // STRINGDATA_H
