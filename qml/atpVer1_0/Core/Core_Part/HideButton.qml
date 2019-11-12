/**
  @QML 파일 이름 : HideButton.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu1, Menu3에서 쓰이는 키보드 숨기기 버튼.

  @QML FileName : HideButton.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Button for hiding a keyboard in Menu1, Menu3

*/

import QtQuick 2.0

Rectangle {
    id: rectHideButton

    width: 95; height: 45

    color: mrClick.pressed ? Qt.darker("#80D6C342", 1.5) : "#80D6C342"

    border.color: "white"
    border.width: 2
    radius: 5

    property string strState : "HIDE"

    signal buttonClicked()

    Text{
        id: txtButtonLabel1

        text: strState

        color: "white"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    Text{
        id: txtButtonLabel2

        text: "KEYBOARD"

        color: "white"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: txtButtonLabel1.bottom
    }

    MouseArea{
        id: mrClick
        anchors.fill: parent
        onClicked: buttonClicked()
    }
}
