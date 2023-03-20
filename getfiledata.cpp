#include "getfiledata.h"

//コンストラクタ
GetFileData::GetFileData(QString fileName)
{
    QFile file(fileName);
    //
    if (! file.open(QIODevice::ReadOnly)) {
        QString errStr = "ファイル読み込みに失敗しました";
        qInfo() << errStr;
        return;
    }

    QTextStream in(&file);

    //ファイルを一行ずつ読み込む
    while (! in.atEnd()){
        int i = 0;
        i++;
        qInfo() << "Line " + QString::number(i) + " is Reading";
        qInfo() << in.readLine();

        //タイマーを呼び出す
        timer();
    }

    file.close();
}

//デストラクタ
GetFileData::~GetFileData(){
}

//
void GetFileData::ReadFile(){

}

//タイマー
void GetFileData::timer(){

    //１秒ごとに１行のデータを取得
    QThread::sleep(1);

    //
    /*
    qTimer = new QTimer();
    qTimer->setInterval(1000);
    qTimer->setTimerType(Qt::PreciseTimer);
    qTimer->start();
    */
}
