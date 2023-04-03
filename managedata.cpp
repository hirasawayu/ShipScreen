#include "managedata.h"

//コンストラクタ
ManageData::ManageData()
{
}

//デストラクタ
ManageData::~ManageData()
{
}

int ManageData::getNumData(int numType){

    return numData[numType];
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

bool ManageData::checkDataState(int numType){
    //DirectionDegreeNumの場合
    if (numType == 4){
        if (numData[4] != numData[2])
            return true;
        else
            return false;
    }
}

int ManageData::updateCurrentDirectionDegreeNum(bool &directionChangeFlag){

    //時計回りか反時計回りかを判断
    if( (numData[4] > numData[2]) && ((numData[4]-numData[2]) < 180) ){
        numData[4]--;
        directionChangeFlag = false;
    }
    else if( (numData[4] < numData[2]) && ((numData[2]-numData[4]) > 180) ){
        numData[4]--;
        directionChangeFlag = false;
    }
    else {
        numData[4]++;
        directionChangeFlag = true;
    }

    if (numData[4] > 359){
        numData[4] -= 360;
    }
    else if (numData[4] < 0){
        numData[4] += 360;
    }

    return numData[4];
}
