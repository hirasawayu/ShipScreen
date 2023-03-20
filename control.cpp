#include "control.h"
#include "getfiledata.h"

//コンストラクタ
Control::Control(QString const iQmlFile): QObject(nullptr), qQmlWindow(nullptr)
{
    const QUrl url(iQmlFile);
    QString fileName = "/home/hirasawayu/ShipScreen/file.txt";

    GetFileData getFileData (fileName);
    QThread *getFileDataThread = new QThread;
    getFileData.moveToThread(getFileDataThread);
    getFileDataThread->start();



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
}

//デストラクタ
Control::~Control()
{
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
