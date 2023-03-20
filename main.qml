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
            anchors.bottom: parent.bottom
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

        }

        //サブ画面１
        Rectangle {
            id: subScreen1
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
                id: backButtonSub1
                width: 100
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
                    text: "\u2190 1"
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
                width: 100
                height: 50
                color: "#ffffff"
                radius: 10
                border.width: 5
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 20

                Text {
                    text: "\u2190 2"
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
                width: 100
                height: 50
                color: "#ffffff"
                radius: 10
                border.width: 5
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 20

                Text {
                    text: "\u2190 3"
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
    D{i:0}D{i:2}D{i:12;invisible:true}D{i:16;invisible:true}D{i:20;invisible:true}
}
##^##*/
