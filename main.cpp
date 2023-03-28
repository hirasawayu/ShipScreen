#include "main.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

   //TODO ファイル読み込みと画面表示をマルチスレッドで行いたい
    /*
   Control *initialControl = new Control;
   QThread *initialThread = new QThread;
   initialControl->moveToThread(initialThread);
   initialThread->start();

   initialControl->initialSetup();
   */

   Control *control = new Control;
   //QThread *controlThread = new QThread;
   //control->moveToThread(controlThread);
   //controlThread->start();

   control->controller();


    return app.exec();
}
