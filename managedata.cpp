#include "managedata.h"

//コンストラクタ
ManageData::ManageData()
{
}

//デストラクタ
ManageData::~ManageData()
{
}



bool ManageData::setNumData(int dataType, int settingNumData, QString &objectName){

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

void ManageData::setStringData(int settingInfoTypeNum, QString settingStringData, int settingImportantInfoFlag){
    messageInfo[emptyMessageInfoSpace].infoTypeNum = settingInfoTypeNum;
    messageInfo[emptyMessageInfoSpace].stringData = settingStringData;
    messageInfo[emptyMessageInfoSpace].importantInfoFlag = settingImportantInfoFlag;

    emptyMessageInfoSpace++;
    //全ての要素にデータが入ったら[0]要素目から上書き
    if(emptyMessageInfoSpace == 30){
        emptyMessageInfoSpace = 0;
    }
}
