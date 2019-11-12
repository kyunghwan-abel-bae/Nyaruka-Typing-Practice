/**
  ?????????????????????????????????????
  왜 있는 거지?
  @QML 파일 이름 : InstructionButton.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :

  @QML FileName : InstructionButton.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :

*/

import QtQuick 2.0

Rectangle {
    id: rectInstructionButton

    width: 250
    height: 50

    property string label
    signal buttonClicked()

    color: mrClick.pressed ? Qt.darker("#FFFFFF", 1.5) : "#FFFFFF"
    radius: 10
    border.color: "#80000000"
    border.width: 1.5

    Text{
        id: txtButtonLabel
        anchors.centerIn: parent
        font.pixelSize: 20
        text: label
    }

    MouseArea{
        id: mrClick
        anchors.fill: parent
        hoverEnabled: true

        onClicked: buttonClicked()
    }
}
