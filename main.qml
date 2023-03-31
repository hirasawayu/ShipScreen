import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml.Models
import QtQuick.Controls 2.0
import QtQuick.Shapes 1.4



Window {
    id: window
    width: 900
    height: 600
    visible: true

    //シグナルを宣言
    signal onClickedButtonSignal (int ButtonNum);

    property alias speedNum: speedNumText.text
    property alias directionDegreeNum: directionDegreeNumText.text


    Rectangle{
        id: switchRectangle
        width: 900
        height: 600
        visible: true
        state: "state0"
        objectName: "obWindow"



        //メイン画面
        Rectangle {
            id: mainScreen
            visible: true
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0


            Rectangle {
                id: toSubScreen1Button
                width: 200
                height: 150
                color: "#ffffff"
                radius: 10
                border.color: "#fc000000"
                border.width: 5
                anchors.right: toSubScreen2Button.left
                anchors.top: toSubScreen2Button.top
                anchors.topMargin: 0
                anchors.rightMargin: 0


                Text {
                    text: "サブ画面１"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                }

                MouseArea {
                    id: toSub1ButtonMA
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    onClicked: {
                        //シグナルを呼び出す
                        onClickedButtonSignal(1);
                    }
                }
            }

            Rectangle {
                id: toSubScreen2Button
                width: 200
                height: 150
                visible: true
                color: "#ffffff"
                radius: 10
                border.color: "#fc000000"
                border.width: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "サブ画面２"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                }

                MouseArea {
                    id: toSub2ButtonMA
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    onClicked: {
                        //シグナルを呼び出す
                        onClickedButtonSignal(2);
                    }
                }
            }

            Rectangle {
                id: toSubScreen3Button
                width: 200
                height: 150
                color: "#ffffff"
                radius: 10
                border.color: "#fc000000"
                border.width: 5
                anchors.left: toSubScreen2Button.right
                anchors.top: toSubScreen2Button.top
                clip: false
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Text {
                    text: "サブ画面３"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                }

                MouseArea {
                    id: toSub3ButtonMA
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    onClicked: {
                        //シグナルを呼び出す
                        onClickedButtonSignal(3);
                    }
                }
            }

            Rectangle {
                id: test
                width: 600
                height: 150
                color: "#ffffff"
                radius: 10
                border.width: 5
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 50

                Text {
                    id: speedNumText
                    width: 150
                    height: 150
                    objectName: "speedNum"
                    text: "0"
                    anchors.left: parent.left
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 0
                }

                Text {
                    id: acDecelerationLevelText
                    width: 150
                    height: 150
                    objectName: "acDecelerationLevel"
                    text: "0"
                    anchors.left: speedNumText.right
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 0
                }

                Text {
                    id: directionDegreeNumText
                    width: 150
                    height: 150
                    objectName: "directionDegreeNum"
                    text: "0"
                    anchors.left: acDecelerationLevelText.right
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 0
                }

                Text {
                    id: remainingFuelLevelText
                    width: 150
                    height: 150
                    objectName: "remainingFuelLevel"
                    text: "0"
                    anchors.left: directionDegreeNumText.right
                    font.pixelSize: 40
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 0
                }
            }
        }

        //サブ画面１
        Rectangle {
            id: subScreen1
            visible: false
            color: "#ffffff"
            border.width: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: backButtonSub1
                width: 150
                height: 50
                visible: true
                color: "#ffffff"
                radius: 10
                border.width: 5
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 20

                Text {
                    text: qsTr("← 戻る")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                }

                MouseArea {
                    id: backButtonSub1MA
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    onClicked: {
                        //シグナルを呼び出す
                        onClickedButtonSignal(0);
                    }
                }
            }

            Rectangle {
                id: rectangle2
                width: 200
                height: 200
                color: "#ffffff"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 20

                Image {
                    id: shipImage
                    anchors.fill: parent
                    width: 500; height: 500
                    visible: true
                    source: "shipImage.jpg"
                    sourceSize.height: 400
                }
            }

            Text {
                width: 200
                height: 100
                text: speedNum
                anchors.bottom: rectangle2.top
                font.pixelSize: 50
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 10
            }

            Text {
                id: text2
                width: 100
                height: 40
                text: qsTr("SET")
                anchors.top: parent.top
                font.letterSpacing: 1
                font.pixelSize: 35
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.wordSpacing: 0
                font.bold: true
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: text3
                width: 150
                height: 80
                text: directionDegreeNum
                anchors.top: text2.bottom
                font.pixelSize: 50
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.topMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Shape {
                id: shape

                ShapePath {

                    fillColor: "transparent"
                    strokeColor: "blue"

                    strokeWidth: 5


                    startX: 120; startY: 250

                    PathArc {

                        x: 780; y: 250

                        radiusX: 450; radiusY: 250



                    }
                }
            }


            Text {
                id: currentDirectionText2
                objectName: "currentDirectionText2"
                width: 30
                height: 30
                text: "-"
                anchors.top: parent.top
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 190

                Text {
                    id: currentDirectionText3
                    objectName: "currentDirectionText3"
                    width: 30
                    height: 30
                    text: "-"
                    anchors.left: currentDirectionText2.right
                    anchors.top: parent.top
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 80
                    anchors.topMargin: 10
                }

                Text {
                    id: currentDirectionText4
                    objectName: "currentDirectionText4"
                    width: 30
                    height: 30
                    text: "-"
                    anchors.left: currentDirectionText3.right
                    anchors.top: currentDirectionText3.top
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 80
                    anchors.topMargin: 15
                }

                Text {
                    id: currentDirectionText1
                    objectName: "currentDirectionText1"
                    width: 30
                    height: 30
                    text: "-"
                    anchors.right: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 80
                    anchors.topMargin: 10
                }

                Text {
                    id: currentDirectionText0
                    objectName: "currentDirectionText0"
                    width: 30
                    height: 30
                    text: "-"
                    anchors.right: currentDirectionText1.left
                    anchors.top: currentDirectionText1.top
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 15
                    anchors.rightMargin: 80
                }
            }


        }

        //サブ画面２
        Rectangle {
            id: subScreen2
            visible: false
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: backButtonSub2
                width: 150
                height: 50
                visible: true
                color: "#ffffff"
                radius: 10
                border.width: 5
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 20

                Text {
                    text: qsTr("← 戻る")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                }

                MouseArea {
                    id: backButtonSub2MA
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    onClicked: {
                        //シグナルを呼び出す
                        onClickedButtonSignal(0);
                    }
                }
            }

            Rectangle {
                id: showWeatherConditionInfoArea
                height: 230
                color: "#ffffff"
                radius: 10
                border.width: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 100

                Text {
                    width: 200
                    height: 30
                    color: "#0008ff"
                    text: qsTr("～天候情報～")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                    font.bold: true
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }

                Text {
                    id: showWeatherConditionInfoText1
                    objectName: "showWeatherConditionInfoText1"
                    height: 30
                    text: qsTr("現在情報はありません。")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 50
                }

                Text {
                    id: showWeatherConditionInfoText2
                    objectName: "showWeatherConditionInfoText2"
                    height: 30
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: showWeatherConditionInfoText1.bottom
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }

                Text {
                    id: showWeatherConditionInfoText3
                    objectName: "showWeatherConditionInfoText3"
                    height: 30
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: showWeatherConditionInfoText2.bottom
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }

                Text {
                    id: showWeatherConditionInfoText4
                    objectName: "showWeatherConditionInfoText4"
                    height: 30
                    visible: true
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: showWeatherConditionInfoText3.bottom
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }
            }

            Rectangle {
                id: showMarineConditionInfoArea
                height: 230
                color: "#ffffff"
                radius: 10
                border.width: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: showWeatherConditionInfoArea.bottom
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 20

                Text {
                    width: 200
                    height: 30
                    color: "#0008ff"
                    text: qsTr("～海上情報～")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 25
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                    font.bold: true
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }

                Text {
                    id: showMarineConditionInfoText1
                    objectName: "showMarineConditionInfoText1"
                    height: 30
                    text: qsTr("現在情報はありません。")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 50
                }

                Text {
                    id: showMarineConditionInfoText2
                    objectName: "showMarineConditionInfoText2"
                    height: 30
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: showMarineConditionInfoText1.bottom
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }

                Text {
                    id: showMarineConditionInfoText3
                    objectName: "showMarineConditionInfoText3"
                    height: 30
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: showMarineConditionInfoText2.bottom
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }

                Text {
                    id: showMarineConditionInfoText4
                    objectName: "showMarineConditionInfoText4"
                    height: 30
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: showMarineConditionInfoText3.bottom
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                }
            }

            Text {
                id: text1
                height: 60
                color: "#0008ff"
                text: qsTr("天候・海上情報")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                font.pixelSize: 50
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.italic: true
                font.bold: true
                font.family: "Times New Roman"
                anchors.rightMargin: 20
                anchors.leftMargin: 250
                anchors.topMargin: 20
            }
        }

        //サブ画面３
        Rectangle {
            id: subScreen3
            visible: false
            color: "#ffffff"
            border.width: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: backButtonSub3
                width: 150
                height: 50
                color: "#ffffff"
                radius: 10
                border.width: 5
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 20

                Text {
                    text: qsTr("← 戻る")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                }

                MouseArea {
                    id: backButtonSub3MA
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    onClicked: {
                        //シグナルを呼び出す
                        onClickedButtonSignal(0);
                    }
                }
            }

            Rectangle {
                id: rectangle
                width: 500
                height: 200
                color: "#ffffff"
                radius: 5
                border.width: 5
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 50
                anchors.topMargin: 350

                ListModel {

                    property string listDataString
                    id: infoModel
                    objectName: "infoModel"
                    //listDataString更新時にListElementを追加
                    onListDataStringChanged: infoModel.append({"name": listDataString})

                }

                Component{
                    id: infoDelegate
                    Text{
                        text: model.name
                        font.pixelSize: 10
                    }
                }

                ListView{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    model: infoModel
                    delegate: infoDelegate
                    clip: true

                }
            }
        }

        //画面状態切替
        states: [
            State {
                name: "state0"
                PropertyChanges {
                    target: mainScreen
                    visible: true
                }
            },

            State {
                name: "state1"
                PropertyChanges {
                    target: subScreen1
                    visible: true
                }
            },

            State {
                name: "state2"
                PropertyChanges {
                    target: subScreen2
                    visible: true
                }
            },

            State {
                name: "state3"
                PropertyChanges {
                    target: subScreen3
                    visible: true
                }
            }
        ]
    }



}

/*##^##
Designer {
    D{i:0}D{i:2;invisible:true}D{i:21;invisible:true}D{i:24}D{i:25}
}
##^##*/
