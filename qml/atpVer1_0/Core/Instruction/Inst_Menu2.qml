/**
  @QML 파일 이름 : Inst_Menu2.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu2을 위한 인스트럭션 페이지.

  @QML FileName : Inst_Menu2.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Instruction Page for Menu2
*/

import QtQuick 2.0

import QtGraphicalEffects 1.0


Item {
    id: itemInst_Menu2

    width: 830; height: 550

    property string langExplanation
    property string langExplanation_en : "At the Typing, There are Essential Keys.\nBasic practice to learn Essential Keys."
    property string langExplanation_rw : "Iyo wandika, hari touches z'ibanze.\nUburyo bw'ibanze bwo kwiga touches z'ibanze."

    property string selectedLanguage

    signal btnBack()

    Component.onCompleted: {
        imgKeyboard.state = "startInstruction"

        selectedLanguage = itemInst_Menu2.parent.selectedLanguage
        if(selectedLanguage == "en"){
            langExplanation = langExplanation_en
        }else if(selectedLanguage == "rw"){
            langExplanation = langExplanation_rw
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
        id: rectInst_Menu2
        width: parent.width; height: 495

        color: "#B2FFFFFF"
        clip: true
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

                text: "Essential Keys"

                color: "#F5BC75"
                font.bold: true
                font.pixelSize: 22
                //font.family: fontTitle.name

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

                    color: "#F5BC75"

                    anchors.left: parent.left
                }

                Text{
                    id: textExplanation

                    text: langExplanation

                    color: "black"
                    font.family: fontNanum.name
                    font.pixelSize: 16

                    anchors.left: rectPointLine.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Image{
                id: imgKeyboard
                width: parent.width-100; height: 300

                anchors.top: rectContainer.bottom
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter

                states: [
                    State{
                        name: "startInstruction"
                    }
                ]

                transitions: [
                    Transition{
                        to: "startInstruction"
                        SequentialAnimation{
                            PropertyAction{
                                target: imgKeyboard
                                property: "source"
                                value: "../../img/essential/Backspace.png"
                            }
                            NumberAnimation{
                                duration: 2000
                            }

                            PropertyAction{
                                target: imgKeyboard
                                property: "source"
                                value: "../../img/essential/Caps Lock.png"
                            }
                            NumberAnimation{
                                duration: 1000
                            }

                            PropertyAction{
                                target: imgKeyboard
                                property: "source"
                                value: "../../img/essential/ShiftA.png"
                            }
                            NumberAnimation{
                                duration: 1000
                            }

                            PropertyAction{
                                target: imgKeyboard
                                property: "source"
                                value: "../../img/essential/Space.png"
                            }
                            NumberAnimation{
                                duration: 1000
                            }

                            PropertyAction{
                                target: imgKeyboard
                                property: "source"
                                value: "../../img/essential/Enter.png"
                            }
                            NumberAnimation{
                                duration: 1000
                            }
                        }
                    }
                ]
            }

        }


        Inst_Buttons{
            id: itemButtons

            anchors.bottom : parent.bottom
            anchors.bottomMargin : 20
            anchors.right: parent.right
            anchors.rightMargin: 10

            onBtnGo: {
                itemInst_Menu2.parent.source = "../Menu2.qml"
            }
        }
    }
}
