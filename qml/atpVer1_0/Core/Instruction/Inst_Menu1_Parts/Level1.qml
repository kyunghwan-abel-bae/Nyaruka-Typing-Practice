/**
  @QML 파일 이름 : Level1.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu1의 인스트럭션 페이지에서 쓰이는 Level1 설명

  @QML FileName : Level1.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Level1 explanation Part in Instruction of Menu1
*/

import QtQuick 2.0

Item {
    id: itemLevel1
    width: 550
    height: 300

    property bool trigger : false
    property int intLevel1 : test[0]
    property string strLevel1

    property variant test: [65, 83, 68, 70, 74, 75, 76, 59]

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
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[0]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[1]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[2]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[3]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[4]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[5]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[6]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "intLevel1"
                    value: test[7]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel1
                    property: "trigger"
                    value: true
                }
            }
        }
    ]


    onIntLevel1Changed: {

        strLevel1 = numTotext(intLevel1)

        if(strLevel1 == ";"){
            imgKeyboard.source = "../../../img/word/w-level-1-semicolon.png"
        }else if(strLevel1 == ","){
            imgKeyboard.source =  "../../../img/word/w-level-1-comma.png"
        }else if(strLevel1 == "."){
            imgKeyboard.source = "../../../img/word/w-level-1-period.png"
        }else{
            imgKeyboard.source = "../../../img/word/w-level-1-" + strLevel1.toLowerCase() + ".png"
        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false
            itemLevel1.state = ""
        }
    }

    function numTotext(index){
        var text = String.fromCharCode(index);

        return text;
    }

    Item{
        id: itemFont

        FontLoader{
            id: fontCapital
            source: "../../../fonts/SourceSansPro-ExtraLight.otf"
        }
    }

    Item{
        id: rectRow1
        width: parent.width; height: 120
        anchors.top: parent.top

        Text{
            id: textMain

            text: strLevel1

            y: 10

            color: "#333333"
            font.family: fontCapital.name; font.pixelSize: 100

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Image{
        id: imgKeyboard
        width: parent.width; height: 180

        source: "../../../img/word/w-level-1-a.png"

        anchors.top: rectRow1.bottom
        anchors.topMargin: 10
    }
}
