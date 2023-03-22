#include "getfiledata.h"

//コンストラクタ
GetFileData::GetFileData()
{
}

//デストラクタ
GetFileData::~GetFileData()
{
}

void GetFileData::readFile(QString fileName){

    QFile file(fileName);
    //
    if (! file.open(QIODevice::ReadOnly)) {
        QString errStr = "ファイル読み込みに失敗しました";
        qInfo() << errStr;
        return;
    }

    QTextStream in(&file);

    int i = 0;
    //ファイルを一行ずつ読み込む
    while (! in.atEnd()){

        i++;
        //qInfo() << "Line " + QString::number(i) + " is Reading";

        QString line = in.readLine();
        qInfo() << line;

        //１行ごとに初期化
        int start = 0;
        int pointer = 0;
        int j = 0;
        QList<QString> getData = {};

        //データ形式
        //(データタイプ),(データ),(補助データ)
        while (pointer != -1){

            pointer++;
            //","でデータを区切る
            pointer = line.indexOf(",", pointer);
            getData << line.mid(start, pointer - start);
            qInfo() << getData[j];
            j++;
            start = pointer + 1;
        }

        Control control;
        control.getDataSignal(getData);

        //タイマーを呼び出す
        timer();
    }
    file.close();
}

//タイマー
void GetFileData::timer(){

    //１秒ごとに１行のデータを取得
    QThread::sleep(1);

    //ボツ
    /*
    qTimer = new QTimer();
    qTimer->setInterval(1000);
    qTimer->setTimerType(Qt::PreciseTimer);
    qTimer->start();
    */
}
