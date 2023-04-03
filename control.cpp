#include "control.h"

//コンストラクタ
Control::Control()
{ 
    mainEngine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    //Windowポインタを取得
    mainWindow = dynamic_cast<QQuickWindow*>(mainEngine.rootObjects().first());
    //Windowオブジェクトを取得
    rootObject = mainEngine.rootObjects().first();

    //画面ボタン押下のシグナルとスロットを結び付ける
    connect(mainWindow, SIGNAL(onClickedButtonSignal(int)),
            this, SLOT(onClickedButtonSlot(int)));

    //データ読み込み用のシグナルとスロットを結び付ける
    connect(&getFileData, &GetFileData::onPropertyChangedSignal, this, &Control::onPropertyChangedSlot);

    //画面更新用のシグナルとスロットを結び付ける
    connect(&getFileData, &GetFileData::updateScreenSignal, this, &Control::updateScreenSlot);

    //初期表示
    onPropertyChangedSlot();

}

//デストラクタ
Control::~Control()
{
}

void Control::show(){
    mainWindow->show();
}

void Control::hide(){
    mainWindow->hide();
}

void Control::qmlSetProperty(QString objectName, const char *propertyName, QString data){

    //QmlオブジェクトのTextプロパティを更新
    QObject *qmlObject = rootObject->findChild<QObject*>(objectName);
    qmlObject->setProperty(propertyName, data);

}

//データ変化時のスロット処理を定義
void Control::onPropertyChangedSlot(){

    int count = 0;

    bool getDataFlag = getFileData.readFile(getData, loop);

    if (getDataFlag == false){
        qInfo() << "No Data";
        return;
    }

    //数値データを更新する
    for (count = 0; count < 4; count++){

        QString numString;
        QString numObjectName;

        manageData.setNumData(getData[count].toInt(), count);
        stringData.getNumString(count, numString, numObjectName);

        numString = getData[count] + numString;

        qmlSetProperty(numObjectName, "text", numString);


        //画面表示
        show();
    }

    QString stringInfoString;
    QString stringObjectName;
    QString detailInfoString;

    //ManageDataクラスに表示データを保存、および表示位置の値を取得
    int infoPosition = manageData.setStringData(getData[count].toInt(), getData[count+1].toInt(), getData[count+2].toInt());

    //オブジェクト名と表示する文字列を取得
    stringData.getStringInfo(getData[count].toInt(), stringInfoString, stringObjectName);
    detailInfoString = stringData.getDetailInfo(getData[count+1].toInt());

    //例：　"weatherConditionInfoText" + "1"
    stringObjectName = stringObjectName + QString::number(infoPosition);
    stringInfoString = stringInfoString + detailInfoString;
    qmlSetProperty(stringObjectName, "text", stringInfoString);

    //ListViewに表示
    qmlSetProperty("infoModel", "listDataString", stringInfoString);
}

//画面更新時のスロット
void Control::updateScreenSlot(){

    //currentDirectionDegreeNumの更新
    bool updateFlag = manageData.checkDataState(4);
    bool directionChangeFlag = false;

    if(updateFlag == true){

        int currentDirectionDegreeNum = manageData.updateCurrentDirectionDegreeNum(directionChangeFlag);
        qInfo() << currentDirectionDegreeNum;
        //-20から+20の幅まで表示
        currentDirectionDegreeNum -= 10;

        for (int i = 0; i < 5; i++){
            QString currentDirectionObjectName = "currentDirectionText" + QString::number(i);

            qmlSetProperty(currentDirectionObjectName, "text", QString::number(currentDirectionDegreeNum));
            currentDirectionDegreeNum += 5;
        }
    }

    onDirectionChange(updateFlag, directionChangeFlag);


}

//画面ボタン押下時のスロットを定義
void Control::onClickedButtonSlot(int buttonNum){

    //押されたボタンの種類に応じて画面状態を切り替える
    //メイン画面へ切替
    switch (buttonNum) {
    case 0:
        switchScreenQml("state0");
        break;
        //サブ画面１へ切替
    case 1:
        switchScreenQml("state1");
        break;
        //サブ画面２へ切替
    case 2:
        switchScreenQml("state2");
        break;
        //サブ画面３へ切替
    case 3:
        switchScreenQml("state3");
        break;
    }
}

//画面状態切替処理
void Control::switchScreenQml(QString stateType){

    QObject *qmlObject = rootObject->findChild<QObject*>("obWindow");
    qmlObject->setProperty("state" , stateType);
}

void Control::onDirectionChange(bool updateFlag, bool directionChangeFlag){

    //進行方向変更の矢印を非表示にする
    qmlSetProperty("rightArrowSign", "visible", "false");
    qmlSetProperty("leftArrowSign", "visible", "false");

    if (updateFlag == true){
        //左方向の矢印を表示する
        if (directionChangeFlag == false){
            qmlSetProperty("leftArrowSign", "visible", "true");
        }

        //右方向の矢印を表示する
        if (directionChangeFlag == true){
            qmlSetProperty("rightArrowSign", "visible", "true");
        }
    }
}
