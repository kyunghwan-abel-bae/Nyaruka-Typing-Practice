/**
  @QML 파일 이름 : AgainButton.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu4에서 쓰이는 다시하기 버튼.

  @QML FileName : AgainButton.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Again Button for Menu4.

*/

import QtQuick 2.0

Rectangle {
    id: rectAgainButton
    width: 95; height: 45

    color: mrClick.pressed ? Qt.darker("#80EC3C50", 1.5) : "#80EC3C50"

    border.color: "white"
    border.width: 2
    radius: 5

    signal buttonClicked()

    Text{
        id: txtButtonLabel

        text: "Practice Again"

        color: "white"
        anchors.centerIn: parent
    }

    MouseArea{
        id: mrClick
        anchors.fill: parent
        onClicked: buttonClicked()
    }
}
