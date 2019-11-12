/**
  @QML 파일 이름 : Inst_Menu5_Part.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Inst_Menu5에 있는 콘텐츠 파트

  @QML FileName : Inst_Menu5_Part.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Contents Part in Inst_Menu5
*/

import QtQuick 2.0

Rectangle {
    id: rectPart

    width: 520 ; height: 200

    color: colorOn == true ? "#800000FF" : "transparent"

    property bool colorOn : false
    property bool colorNextOn : false

    property string strImgPath
    property string strTitle
    property string strWriter
    property string strInstruction

    signal menuSelected()
    signal menuDoubleClicked()

    MouseArea{

        anchors.fill: parent

        onClicked: {
            colorNextOn = true
            rectPart.parent.menuSelected()
            console.log("imgPath : " + imgPath.source)
        }

        onDoubleClicked: {
            colorNextOn = true
            rectPart.parent.menuSelected()
            rectPart.parent.menuDoubleClicked()
        }
    }

    Image{
        id: imgPath
        width: 200; height: 200

        source: strImgPath

        asynchronous: true
    }

    Item{
        id: itemContainer

        width: 310; height: parent.height

        anchors.left: imgPath.right
        anchors.leftMargin: 10

        Text{
            id: textTitle
            y: 50

            text: strTitle

            font.pixelSize: textTitle.text.length < 23 ? 20 : 15

            anchors.left: parent.left
        }
        Text{
            id: textWriter

            text: strWriter

            font.pixelSize: 11

            anchors.left: parent.left
            anchors.top: textTitle.bottom
        }
        Text{
            id: textInstruction

            text: strInstruction

            font.pixelSize: 15

            anchors.left: parent.left
            anchors.top: textWriter.bottom
            anchors.topMargin: 5
        }
    }
}
