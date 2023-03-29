#include "managedata.h"

//コンストラクタ
ManageData::ManageData()
{
}

//デストラクタ
ManageData::~ManageData()
{
}


void ManageData::setNumData(int settingNumData, QString &objectName, int i){

    if(numData[i] != settingNumData){
        numData[i] = settingNumData;
        objectName = objectNames[i];

        qInfo() << objectName << " is changed to " << numData[i];
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
    messageInfo[emptyMessageInfoPlace].infoTypeNum = settingInfoTypeNum;
    messageInfo[emptyMessageInfoPlace].infoDetailNum = settingInfoDetailNum;
    messageInfo[emptyMessageInfoPlace].importantInfoFlag = settingImportantInfoFlag;

    emptyMessageInfoPlace++;
    //全ての要素にデータが入ったら[0]要素目から上書き
    if(emptyMessageInfoPlace == 10){
        emptyMessageInfoPlace = 0;
    }

    //データを入れた要素の値を返す
    return emptyMessageInfoPlace - 1;
}
