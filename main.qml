import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml.Models
import QtQuick.Controls 2.0


Window {
    id: window
    width: 900
    height: 600
    visible: true

    //シグナルを宣言
    signal onClickedButtonSignal (int ButtonNum);


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
                    height: 30
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
    D{i:0}D{i:2;invisible:true}D{i:17;invisible:true}D{i:27}D{i:37}D{i:38;invisible:true}
}
##^##*/
