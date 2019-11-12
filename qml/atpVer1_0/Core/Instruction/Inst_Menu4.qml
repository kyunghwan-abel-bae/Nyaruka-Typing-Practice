/**
  @QML 파일 이름 : Inst_Menu4.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu4을 위한 인스트럭션 페이지.

  @QML FileName : Inst_Menu4.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Instruction Page for Menu4
*/

import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: itemInst_Menu4

    width: 830; height: 550

    property string givenInstruction: "Let's see how fast you can type!"
    property string strInstruction: givenInstruction

    property string langExplanation
    property string langExplanation_en : "More practical training with short sentences.\nTry to type given sentences as fast as you can.\nPress Start to continue."
    property string langExplanation_rw : "Imyitozo myinshi ku nteruro ngufi.\nGerageza kwandika izi nteruro vuba vuba bishoboka.\nKanda start kugira ngo ubashe gukomeza."

    property string selectedLanguage

    property string short_blueText
    property string short_redText

    signal btnBack()
    signal setRedText()

    states: [
        State{
            name: "startInstrcution"
        }
    ]

    // Let's see how fast you can type!"
    transitions: [
        Transition{
            to: "startInstruction"
            SequentialAnimation{
                NumberAnimation{
                    duration: 2000
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "L"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Le"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let'"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's "
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's s"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's se"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see "
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see h"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see ho"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how "
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how f"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fa"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fas"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast "
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast y"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast yo"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you "
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you c"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you ca"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you can"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you can "
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you can t"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you can ty"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you can typ"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you can type"
                }

                NumberAnimation{
                    duration: 500
                }
                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "Let's see how fast you can type!"
                }
            }
        }
    ]

    Component.onCompleted: {
        itemInst_Menu4.state = "startInstruction"

        selectedLanguage = itemInst_Menu4.parent.selectedLanguage
        if(selectedLanguage == "en"){
            langExplanation = langExplanation_en
        }else if(selectedLanguage == "rw"){
            langExplanation = langExplanation_rw
        }
    }

    onSetRedText: {
        var inputTextSize = inputArea.text.length
        var textSize = strInstruction.length

        if(inputTextSize <= textSize){
            var text_cmp = givenInstruction;
            var text_new = inputArea.text;

            if(text_new.substring(0, inputTextSize) == text_cmp.substring(0, inputTextSize)){
                short_blueText = '<font color="blue">' + text_cmp.substring(0, inputTextSize) + '</font>';
                short_redText = ""
            }else{
                short_redText = '<font color="red">' + text_cmp.substring(short_blueText.length - 26, inputTextSize) + '</font>';
            }

            strInstruction = short_blueText + short_redText + text_cmp.substring(inputTextSize, textSize);
        }
    }

    /*

      Interface

    */

    Item{
        id: itemFont

        FontLoader{
            id: fontNanum
            source: "../../fonts/NanumMyeongjo.ttf"
        }
    }

    Item{
        id: itemKeypress
        focus: true

        anchors.fill: parent

        Keys.onEscapePressed: {
            btnBack()
        }
    }

    Image{
        id: imgTitle
        scale: 0.8

        source: "../../img/title.png"

        asynchronous: true

        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle{
        id: rectInst_Menu4
        width: parent.width; height: 495

        clip: true
        color: "#B2FFFFFF"
        radius: 10

        anchors.top: imgTitle.bottom
        anchors.topMargin: 20

        Item{
            id: itemInstruction
            width: parent.width; height: 100

            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left

            Text{
                id: textLabel

                text: "Short Sentences"

                color: "#90DC82"

                font.bold: true
                //font.family: fontTitle.name
                font.pixelSize: 22

                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 20
            }

            Item{
                id: rectContainer
                width: parent.width; height: 80

                anchors.top: textLabel.bottom
                anchors.topMargin: 10
                anchors.left: parent.left

                LinearGradient{
                    start : Qt.point(0,0)
                    end : Qt.point(600,0)
                    gradient : Gradient {
                        GradientStop { position: 0.0; color: "white" }
                        GradientStop { position: 1.0; color: "transparent" }
                    }

                    anchors.fill: parent
                }

                Rectangle{
                    id: rectPointLine
                    width: 8; height: 80

                    color: "#90DC82"

                    anchors.left: parent.left
                }

                Text{
                    id: textExplanation

                    text: langExplanation

                    color: "black"

                    font.family: fontNanum.name
                    font.pixelSize: 15

                    anchors.left: rectPointLine.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Item{
                id: itemText_Userinput
                width: parent.width; height: 300

                anchors.top: rectContainer.bottom

                Text{
                    id: textMain

                    text: strInstruction

                    color: "#333333"

                    font.bold: true
                    font.family: fontNanum.name
                    font.pixelSize: 30

                    anchors.top: parent.top
                    anchors.topMargin: 100
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle{
                    id: rectUserinput
                    width: textMain.width + 40 ; height: 40

                    color: "#80666666"

                    anchors.top: textMain.bottom
                    anchors.topMargin: 50
                    anchors.horizontalCenter: parent.horizontalCenter

                    TextInput{
                        id: inputArea

                        text: ""

                        cursorVisible: true
                        font.bold: true
                        font.family: fontNanum.name
                        font.pixelSize: 30

                        enabled: false

                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20

                        onTextChanged: {
                            setRedText()
                        }
                    }
                    Rectangle{
                        id: rectUserinputLine
                        width: textMain.width; height: 1
                        color: "#80777777"

                        anchors.top: inputArea.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }


        Inst_Buttons{
            id: itemButtons

            anchors.bottom : parent.bottom
            anchors.bottomMargin : 20
            anchors.right: parent.right
            anchors.rightMargin: 10

            onBtnGo: {
                itemInst_Menu4.parent.source = "../Menu4.qml"
            }
        }
    }
}
