#include "getfiledata.h"

//コンストラクタ
GetFileData::GetFileData()
{
    //ファイル読み込み用のタイマーを設定
    readFileTimer = new QTimer;
    //30秒ごとにonPropertyChangedSlotを呼び出す
    connect(readFileTimer, &QTimer::timeout, [this]()
    {
        emit onPropertyChangedSignal();
    });
    readFileTimer->start(3000);

    //画面更新用のタイマーを設定
    updateScreenTimer = new QTimer;
    //0.5秒ごとにreloadScreenSlotを呼び出す
    connect(updateScreenTimer, &QTimer::timeout, [this](){
        emit updateScreenSignal();
    });
    updateScreenTimer->start(200);

}

//デストラクタ
GetFileData::~GetFileData()
{
}

bool GetFileData::readFile(QList<QString> &getData, int &loop){

    QFile file("/home/hirasawayu/ShipScreen/file.txt");
    //
    if (! file.open(QIODevice::ReadOnly)) {
        QString errStr = "ファイル読み込みに失敗しました";
        qInfo() << errStr;

        delete readFileTimer;
        return false;
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
        return true;
    }
    file.close();

    delete readFileTimer;
    return false;
}
