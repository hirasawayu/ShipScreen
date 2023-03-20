#ifndef CONTROL_H
#define CONTROL_H

#include <QObject>
#include <QCoreApplication>
#include <QDebug>
#include <iostream>
#include <QtQuick/QQuickView>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QGuiApplication>
#include <QThread>

class Control :  public QObject
{
    Q_OBJECT
public:
    Control(QString const iQmlFile);
    ~Control();

    void show() {qQmlWindow->show();}
    void hide() {qQmlWindow->hide();}
    void switchScreenQml(QString stateType);
    void reloadQml(QString objectName, int givenNum);

protected:
    QQuickWindow* qQmlWindow;
    QQmlApplicationEngine qQmlEngine;

signals:

private slots:
    void onClickedButtonSlot(int buttonNum);

private:

};

#endif // CONTROL_H
