/**
  @QML 파일 이름 : Level3.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu1의 인스트럭션 페이지에서 쓰이는 Level3 설명

  @QML FileName : Level3.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Level3 explanation Part in Instruction of Menu1
*/

import QtQuick 2.0

Item {
    id: itemLevel3
    width: 550
    height: 300

    property bool trigger : false
    property int intLevel3 : test[0]
    property string strLevel3

    property variant test: [84, 89, 71, 72, 66, 78]

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
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[0]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[1]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[2]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[3]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[4]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[5]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[6]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "intLevel3"
                    value: test[7]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel3
                    property: "trigger"
                    value: true
                }
            }
        }
    ]

    onIntLevel3Changed: {

        strLevel3 = numTotext(intLevel3)

        if(strLevel3 == ";"){
            imgKeyboard.source = "../../../img/word/w-level-3-semicolon.png"
        }else if(strLevel3 == ","){
            imgKeyboard.source =  "../../../img/word/w-level-3-comma.png"
        }else if(strLevel3 == "."){
            imgKeyboard.source = "../../../img/word/w-level-3-period.png"
        }else{
            imgKeyboard.source = "../../../img/word/w-level-3-" + strLevel3.toLowerCase() + ".png"
        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false
            itemLevel3.state = ""
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

            text: strLevel3

            color: "#333333"
            font.family: fontCapital.name; font.pixelSize: 100

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Image{
        id: imgKeyboard
        width: parent.width; height: 180
        source: "../../../img/word/w-level-3-q.png"

        anchors.top: rectRow1.bottom
        anchors.topMargin: 10        
    }
}
