#include "main.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    //多言語化
    QTranslator translator;
    translator.load(":/shipscreen_jp.qm");
    app.installTranslator(&translator);

   Control control;

   control.show();

    return app.exec();
}
