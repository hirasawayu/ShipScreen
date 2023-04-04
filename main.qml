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
    signal onClickedHelpButtonSignal(int buttonState);

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
                    text: qsTr("Sub Screen 1")
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
                    text: qsTr("Sub Screen 2")
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
                    text: qsTr("Sub Screen 3")
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

            Rectangle {
                id: helpButton
                objectName: "helpButton"
                width: 80
                height: 80
                radius: width * 0.5
                color: "red"
                border.width: 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 450
                anchors.leftMargin: 800

                MouseArea {
                    property int buttonState: 0
                    id: helpButtonMA
                    objectName: "helpButtonMA"
                    anchors.fill: parent
                    onClicked: {
                        onClickedHelpButtonSignal(buttonState);
                        console.log("Catch")

                    }
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
                    text: qsTr("← Back")
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
                visible: false
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

            Shape {
                id: leftArrowSign
                objectName: "leftArrowSign"
                visible: false
                width: 150
                height: 150
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 180
                anchors.topMargin: 400
                ShapePath{
                    strokeWidth: 5
                    strokeColor: "red"
                    fillColor: "red"
                    startX: 0; startY: 50
                    PathLine{x: 50; y: 0}
                    PathLine{x: 50; y: 30}
                    PathLine{x: 100; y: 30}
                    PathLine{x: 100; y: 70}
                    PathLine{x: 50; y: 70}
                    PathLine{x: 50; y: 100}
                    PathLine{x: 0; y: 50}
                }
            }

            Shape {
                id: rightArrowSign
                objectName: "rightArrowSign"
                visible: false
                width: 150
                height: 150
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 730
                anchors.topMargin: 400
                ShapePath{
                    strokeWidth: 5
                    strokeColor: "green"
                    fillColor: "green"
                    startX: 0; startY: 50
                    PathLine{x: -50; y: 0}
                    PathLine{x: -50; y: 30}
                    PathLine{x: -100; y: 30}
                    PathLine{x: -100; y: 70}
                    PathLine{x: -50; y: 70}
                    PathLine{x: -50; y: 100}
                    PathLine{x: 0; y: 50}
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
                    text: qsTr("← Back")
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
                    text: qsTr("～Weather Info～")
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
                    text: qsTr("No available Infomation.")
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
                    visible: true
                    color: "#0008ff"
                    text: qsTr("～Marine Info～")
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
                    text: qsTr("No available Infomation.")
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
                text: qsTr("Weather/Marine Info")
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
                    text: qsTr("← Back")
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
                id: infoList
                objectName: "infoList"
                visible: false
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

            Rectangle {
                id: helpRec
                objectName: "helpRec"
                visible: false
                width: 700
                height: 200
                color: "#ffffff"
                radius: 10
                border.width: 5
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 100
                anchors.leftMargin: 50

                Text {
                    id: helpText
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:16pt;\">各画面について</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt;\">1. 走行情報画面：走行情報の詳細表示、および残燃料を表示する</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt;\">2. 天候・海上情報画面：各時間帯の天候情報、海上情報（波浪警報、事故警報）を表示する</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt;\">3. ヘルプ画面：ユーザーガイドを表示する</span></p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignLeft
                    anchors.rightMargin: 0
                    textFormat: Text.RichText
                    anchors.leftMargin: 5
                    anchors.topMargin: 5
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
    D{i:0}D{i:2;invisible:true}
}
##^##*/
