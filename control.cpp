#include "control.h"

//コンストラクタ
Control::Control()
{
}

//デストラクタ
Control::~Control()
{
}

//QMLファイルとの連携をセットアップ
void Control::qmlSetup(QString const iQmlFile){

    const QUrl url(iQmlFile);

    connect(&qQmlEngine, &QQmlApplicationEngine::objectCreated, this,
            [url](QObject *obj, const QUrl &objUrl)
    {
    }, Qt::QueuedConnection);
    qQmlEngine.load(url);

    // Windowポインタを取得
    qQmlWindow = dynamic_cast<QQuickWindow*>(qQmlEngine.rootObjects().first());
    //画面ボタン押下のシグナルとスロットを結び付ける
    connect(qQmlWindow, SIGNAL(onClickedButtonSignal(int)),
            this, SLOT(onClickedButtonSlot(int)));
    //画面表示
    show();


    //TODO ファイル読み込みと画面表示をマルチスレッドで行いたい

    GetFileData getFileData;

    QThread *getFileDataThread = new QThread;
    getFileData.moveToThread(getFileDataThread);
    getFileDataThread->start();

    while(1) {
    bool readFlag = getFileData.readFile();

    if (readFlag == false){
        break;
    }

    getDataSignal();
    }


}

void Control::show(){
    qQmlWindow->show();
}

void Control::hide(){
    qQmlWindow->hide();
}

void Control::getDataSignal(){

    GetFileData getFileData;

     QList<QString> getData = getFileData.getLineData();
    QString objectName;

    ManageData manageData;

    if (getData[0].toInt() >= 0 && getData[0].toInt() <= 4){

        bool changeFlag = manageData.setNumData(getData[0].toInt(), getData[1].toInt(), objectName);

        if (changeFlag == true){

            qInfo() << objectName;
            qInfo() << getData[1];


        //Qmlオブジェクトのプロパティを更新
            QObject *rootObject = qQmlEngine.rootObjects().first();
            QObject *qmlObject = rootObject->findChild<QObject*>(objectName);
        qmlObject->setProperty("text", getData[1]);
        changeFlag = false;

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
    QObject *rootObject = qQmlEngine.rootObjects().first();
    QObject *qmlObject = rootObject->findChild<QObject*>("obWindow");
    qmlObject->setProperty("state" , stateType);
}
