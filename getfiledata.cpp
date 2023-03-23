#include "getfiledata.h"

//コンストラクタ
GetFileData::GetFileData()
{
    QFile file("/home/hirasawayu/ShipScreen/file.txt");

}

//デストラクタ
GetFileData::~GetFileData()
{
}

bool GetFileData::readFile(){

   QFile file("/home/hirasawayu/ShipScreen/file.txt");
    //
    if (! file.open(QIODevice::ReadOnly)) {
        QString errStr = "ファイル読み込みに失敗しました";
        qInfo() << errStr;
        return false;
    }

    QTextStream in(&file);

    int i = 0;

    if (in.atEnd()){
        file.close();
        return false;
    }

        i++;
        //qInfo() << "Line " + QString::number(i) + " is Reading";

        //ファイルを一行ずつ読み込む
        QString line = in.readLine();
        qInfo() << line;

        //１行ごとに初期化
        int start = 0;
        int pointer = 0;
        int j = 0;
        getData = {};

        //データ形式
        //(データタイプ),(データ),(補助データ)
        while (1){

            pointer++;
            //","でデータを区切る
            pointer = line.indexOf(",", pointer);
            if(pointer == -1){
                break;
            }
            getData << line.mid(start, pointer - start);
            qInfo() << getData[j];
            j++;
            start = pointer + 1;
        }

        //タイマーを呼び出す
        timer();

        return true;

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

//getDataを渡す
QList<QString> GetFileData::getLineData(){

    return getData;
}
