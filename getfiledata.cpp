#include "getfiledata.h"
#include "control.h"

//コンストラクタ
GetFileData::GetFileData()
{
    //タイマーを設定
    timer = new QTimer;
    //1秒ごとにreadFileを呼び出す
    connect(timer, SIGNAL(timeout()), this, SLOT(readFile()));
    timer->start(1000);
}

//デストラクタ
GetFileData::~GetFileData()
{
}

void GetFileData::readFile(){

    QFile file("/home/hirasawayu/ShipScreen/file.txt");
    Control *control = new Control;
    //
    if (! file.open(QIODevice::ReadOnly)) {
        QString errStr = "ファイル読み込みに失敗しました";
        qInfo() << errStr;

        delete timer;
        return;
    }

    QTextStream in(&file);

    while (1){

        QString line;
        bool loopOutFlag = false;

        //次の読み込み位置まで移動
        for (int i = 0; i <= loop; i++){

            //ファイルの最後ならループ終了
            if(in.atEnd()){
                loopOutFlag = true;
                break;
            }

            //ファイルを一行ずつ読み込む
            line = in.readLine();
        }

        if (loopOutFlag == true)
            break;

        qInfo() << line;
        loop++;

        //１行ごとに初期化
        int start = 0;
        int pointer = 0;
        int j = 0;
        getData = {};

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

        control->onPropertyChangedSlot(getData);
        return;
    }
    file.close();

    delete timer;
    return;
}
