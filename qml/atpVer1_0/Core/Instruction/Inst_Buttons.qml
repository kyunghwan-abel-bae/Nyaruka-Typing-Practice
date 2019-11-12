/**
  @QML 파일 이름 : Inst_Buttons.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  인스트럭션 페이지에서 쓰이는 버튼.

  @QML FileName : Inst_Buttons.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Button for Instruction Page.
*/

import QtQuick 2.0

Item {
    width: 150
    height: 50

    signal btnGo()

    Item{
        id: itemFont

        FontLoader{
            id: fontButton
            source: "../../fonts/SourceSansPro-Regular.otf"
        }
    }

    Rectangle{
        id: rectBtnBack
        width: 60; height: 60

        border.color: "white"
        border.width: 2

        color: "#FF7175"

        radius: 30

        anchors.left: parent.left

        Text{
            id: textBtnBack

            text: "Back"

            font.family: fontButton.name; font.pixelSize: 15
            color: "white"

            anchors.centerIn: parent
        }

        MouseArea{
            id: mrBack

            hoverEnabled: true

            anchors.fill: parent

            onClicked: {
                btnBack()
            }

            onPressed: {
                rectBtnBack.color = Qt.darker(rectBtnBack.color, 1.1)
            }

            onEntered: {
                rectBtnBack.color = Qt.lighter(rectBtnBack.color, 1.1)
            }
            onExited: {
                rectBtnBack.color = "#FF7175"
            }
        }
    }

    Rectangle{
        id: rectBtnGo
        width: 60; height: 60

        border.color: "white"
        border.width: 2

        color: "#00AE8B"

        radius: 30

        anchors.right: parent.right

        Text{
            id: textBtnStart

            text: "Start"

            color: "white"
            font.family: fontButton.name; font.pixelSize: 15

            anchors.centerIn: parent
        }

        MouseArea{
            id: mrGo
            hoverEnabled: true

            anchors.fill: parent

            onClicked: {
                btnGo()
            }

            onPressed: {
                rectBtnGo.color = Qt.darker(rectBtnGo.color, 1.1)
            }

            onEntered: {
                rectBtnGo.color = Qt.lighter(rectBtnGo.color, 1.1)
            }
            onExited: {
                rectBtnGo.color = "#00AE8B"

            }
        }
    }
}
