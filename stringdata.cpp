#include "stringdata.h"

StringData::StringData(){
}

StringData::~StringData(){
}

QString StringData::getStringData(int listType, int stringType){

    return stringData[listType][stringType];
}
