#include "managedata.h"

//コンストラクタ
ManageData::ManageData()
{
}

//デストラクタ
ManageData::~ManageData()
{
}


void ManageData::setNumData(int settingNumData, int i){

    if(numData[i] != settingNumData){
        numData[i] = settingNumData;
        //numObjectName = objectNames[i];

        //qInfoinfo() << objectName << " is changed to " << numData[i];
    }
}

//旧バージョン
/*
bool ManageData::setNumData(int dataType, int settingNumData, QString &objectName){

    for (int i = 0; i < 4; i++){
        numData[i] = settingNumData;
    }

    //データに変化があったらQmlオブジェクトのプロパティを更新
    if (numInfo[dataType].numData != settingNumData){
        numInfo[dataType].numData = settingNumData;
        qInfo() << "numDataType: " << dataType << ", num " << numInfo[dataType].numData;
        objectName = numInfo[dataType].objectName;

        return true;
    }

    else
        return false;
}
*/

int ManageData::setStringData(int settingInfoTypeNum, int settingInfoDetailNum, int settingImportantInfoFlag){
    messageInfo[emptyMessageInfoPosition].infoTypeNum = settingInfoTypeNum;
    messageInfo[emptyMessageInfoPosition].infoDetailNum = settingInfoDetailNum;
    messageInfo[emptyMessageInfoPosition].importantInfoFlag = settingImportantInfoFlag;

    qInfo() << "messageInfoPosition: " << emptyMessageInfoPosition;

    emptyMessageInfoPosition++;
    //全ての要素にデータが入ったら[0]要素目から上書き
    if(emptyMessageInfoPosition == 10){
        emptyMessageInfoPosition = 0;
    }

    //天候情報の場合
    if (settingInfoTypeNum >= 0 && settingInfoTypeNum <= 0){

        weatherConditionInfoPosition++;
        //表示する天候情報が何個あるかを返す
        return weatherConditionInfoPosition;
    }

    //海上情報の場合
    else if (settingInfoTypeNum >= 1 && settingInfoTypeNum <= 3){

        marineConditionInfoPosition++;
        return marineConditionInfoPosition;
    }
}
