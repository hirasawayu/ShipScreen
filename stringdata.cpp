#include "stringdata.h"

StringData::StringData(){
}

StringData::~StringData(){
}

void StringData::getNumString(int numType, QString &numString, QString &numObjectName){

    numString = numInfoList[numType].numString;
    numObjectName = numInfoList[numType].numObjectName;
}

void StringData::getStringInfo(int stringType, QString &stringInfoString, QString &stringObjectName){

    stringInfoString = stringInfoList[stringType].stringInfoString;
    stringObjectName = stringInfoList[stringType].stringObjectName;
}


QString StringData::getDetailInfo(int detailInfoNum){

    return detailInfoList[detailInfoNum];
}
