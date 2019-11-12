/**
  @QML 파일 이름 : Level2.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu1의 인스트럭션 페이지에서 쓰이는 Level2 설명

  @QML FileName : Level2.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Level2 explanation Part in Instruction of Menu1
*/

import QtQuick 2.0

Item {
    id: itemLevel2
    width: 550
    height: 300

    property bool trigger : false
    property int intLevel2 : test[0]
    property string strLevel2

    property variant test: [81, 87, 69, 82]

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
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[0]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[1]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[2]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[3]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[4]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[5]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[6]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "intLevel2"
                    value: test[7]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "trigger"
                    value: true
                }
            }
        }
    ]

    onIntLevel2Changed: {

        strLevel2 = numTotext(intLevel2)

        if(strLevel2 == ";"){
            imgKeyboard.source = "../../../img/word/w-level-2-semicolon.png"
        }else if(strLevel2 == ","){
            imgKeyboard.source =  "../../../img/word/w-level-2-comma.png"
        }else if(strLevel2 == "."){
            imgKeyboard.source = "../../../img/word/w-level-2-period.png"
        }else{
            imgKeyboard.source = "../../../img/word/w-level-2-" + strLevel2.toLowerCase() + ".png"
        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false
            itemLevel2.state = ""
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
            y: 10

            text: strLevel2

            color: "#333333"
            font.family: fontCapital.name; font.pixelSize: 100

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Image{
        id: imgKeyboard
        width: parent.width; height: 180

        source: "../../../img/word/w-level-2-q.png"

        anchors.top: rectRow1.bottom
        anchors.topMargin: 10
    }
}
