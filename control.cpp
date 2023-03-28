#include "control.h"

//コンストラクタ
Control::Control()
{ 
    mainEngine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    // Windowポインタを取得
    mainWindow = dynamic_cast<QQuickWindow*>(mainEngine.rootObjects().first());

}

//デストラクタ
Control::~Control()
{
}

void Control::initialSetup(){

    /*
    mainEngine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    // Windowポインタを取得
    mainWindow = dynamic_cast<QQuickWindow*>(mainEngine.rootObjects().first());
    */

    //画面表示
    show();
}

//QMLファイルとの連携をセットアップ
void Control::controller(){

    /*
    mainEngine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    // Windowポインタを取得
    mainWindow = dynamic_cast<QQuickWindow*>(mainEngine.rootObjects().first());
    */

    //画面ボタン押下のシグナルとスロットを結び付ける
    connect(mainWindow, SIGNAL(onClickedButtonSignal(int)),
            this, SLOT(onClickedButtonSlot(int)));

    GetFileData *getFileData = new GetFileData;
}

void Control::show(){
    mainWindow->show();
}

void Control::hide(){
    mainWindow->hide();
}

//データ変化時のスロット処理を定義
void Control::onPropertyChangedSlot(QList<QString> getData){

    qInfo() << "Slot Catch";

    //QList<QString> getData = getFileData.getLineData();
    qInfo() << getData[0];
    QString objectName;

    ManageData manageData;

    if (getData[0].toInt() >= 0 && getData[0].toInt() <= 4){

        bool changeFlag = manageData.setNumData(getData[0].toInt(), getData[1].toInt(), objectName);

        if (changeFlag == true){

            qInfo() << objectName;
            qInfo() << getData[1];

            //Qmlオブジェクトのプロパティを更新
            QObject *rootObject = mainEngine.rootObjects().first();
            QObject *qmlObject = rootObject->findChild<QObject*>(objectName);
            qmlObject->setProperty("text", getData[1]);
            changeFlag = false;
            qInfo() << "DataSetting";

        }

    }

    else if (getData[0].toInt() == 5){
        manageData.setStringData((getData[0].toInt()), getData[1], getData[2].toInt());
    }
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
