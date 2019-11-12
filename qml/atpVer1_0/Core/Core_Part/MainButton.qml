/**
  @QML 파일 이름 : MainButton.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  메인메뉴에서 쓰이는 버튼

  @QML FileName : MainButton.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Button for MainMenu.qml

*/

import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: rectMainButton

    width: 310; height: 50

    clip: true
    color: "transparent"
    radius: 10

    property int number
    property string label
    property string strColor

    signal buttonClicked()

    FontLoader{
        id: fontMenu
        source: "../../fonts/SourceSansPro-Semibold.otf"
    }

    Rectangle{
        id: rectSpace
        width: 25; height: parent.height

        color: "#" + strColor
        radius: 10

        anchors.left: parent.left
    }

    Rectangle{
        id: rectNumber

        width: 35; height: parent.height

        color: "#" + strColor

        anchors.left: rectSpace.right
        anchors.leftMargin: -10

        Text{
            id: textButtonNumber

            text: number + "."

            color: "white"
            font.family: fontMenu.name
            font.pixelSize: 30

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

        }
    }

    Rectangle{
        id: rectLabel
        width: 250; height: parent.height
        color: "transparent"

        anchors.left: rectNumber.right

        Text{
            id: textButtonLabel
            z: 300

            text: label

            color: "#" + strColor
            font.bold: true
            font.family: fontMenu.name
            font.pixelSize: label.length > 20 ? 20 : 25

            anchors.centerIn: parent
        }

        LinearGradient{
            id: gradient
            start : Qt.point(0,0)
            end : Qt.point(225,0)
            gradient : Gradient {
                GradientStop { position: 0.0; color: "#C0FFFFFF" }
                GradientStop { position: 1.0; color: "transparent" }
            }

            visible: true

            anchors.fill: parent

        }
    }

    MouseArea{
        id: mrClick
        hoverEnabled: true
        
        anchors.fill: parent

        onClicked: buttonClicked()

        onPressed: {
            color = Qt.darker("#" + strColor, 1.1)
            rectSpace.color = Qt.darker("#" + strColor, 1.1)
            rectNumber.color = Qt.darker("#" + strColor, 1.1)
            rectLabel.color = Qt.darker("#" + strColor, 1.1)


        }

        onEntered: {
            color = "#" + strColor
            rectLabel.color = "#" + strColor
            textButtonLabel.color = "white"
            gradient.visible = false
        }
        onExited: {
            color = "transparent"
            rectLabel.color = "transparent"
            rectSpace.color = "#" + strColor
            rectNumber.color = "#" + strColor
            textButtonLabel.color = "#" + strColor
            gradient.visible = true
        }
    }
}
