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

//データ変化時のスロット処理を定義
void Control::onPropertyChangedSlot(){

    QString objectName;
    int count = 0;

    bool getDataFlag = getFileData.readFile(getData, loop);

    if (getDataFlag == false){
        qInfo() << "No Data";
        return;
    }

    for (count = 0; count < 4; count++){

        manageData.setNumData(getData[count].toInt(), objectName, count);

        qmlSetProperty(objectName, getData[count]);


        //画面表示
        show();
    }



    int messageInfoPlace = manageData.setStringData((getData[count].toInt()), getData[count+1].toInt(), getData[count+2].toInt());

    qInfo() << "messageInfoSpace: " << messageInfoPlace;
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
