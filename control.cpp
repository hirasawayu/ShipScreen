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

    //データ受け取り時のシグナルとスロットを結び付ける
    connect(&getFileData, &GetFileData::onPropertyChangedSignal, this, &Control::onPropertyChangedSlot);

}

//デストラクタ
Control::~Control()
{
}

//QMLファイルとの連携をセットアップ
void Control::controller(){

    /*
    mainEngine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    // Windowポインタを取得
    mainWindow = dynamic_cast<QQuickWindow*>(mainEngine.rootObjects().first());
    */
}

void Control::show(){
    mainWindow->show();
}

void Control::hide(){
    mainWindow->hide();
}

void Control::qmlSetProperty(QString objectName, QString data){

    //QmlオブジェクトのTextプロパティを更新
    QObject *qmlObject = rootObject->findChild<QObject*>(objectName);
    qmlObject->setProperty("text", data);

}

void Control::addListData(QString listData){

    QObject *qmlObject = rootObject->findChild<QObject*>("infoModel");
    qmlObject->setProperty("listDataString", listData);

}

//データ変化時のスロット処理を定義
void Control::onPropertyChangedSlot(){

    int count = 0;

    bool getDataFlag = getFileData.readFile(getData, loop);

    if (getDataFlag == false){
        qInfo() << "No Data";
        return;
    }

    for (count = 0; count < 4; count++){

        //
        QString numString;
        QString numObjectName;

        manageData.setNumData(getData[count].toInt(), count);
        stringData.getNumString(count, numString, numObjectName);

        numString = getData[count] + numString;

        qmlSetProperty(numObjectName, numString);


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
    qmlSetProperty(stringObjectName, stringInfoString);

    addListData(stringInfoString);
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
    QObject *rootObject = mainEngine.rootObjects().first();
    QObject *qmlObject = rootObject->findChild<QObject*>("obWindow");
    qmlObject->setProperty("state" , stateType);
}
