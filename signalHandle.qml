import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml.Models
import QtQuick.Controls 2.15


Window {
    id: signalHandleWindow
    width: 900
    height: 600
    visible: false

    //シグナルを宣言
    signal onPropertyChangedSignal();

    Item {
        id: signalHandle
        property string count
        objectName: "signalHandle"
        onCountChanged: {
            console.log("count: " + count)
            onPropertyChangedSignal();

        }

    }
}
