/**
  @QML 파일 이름 : Level6.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu1의 인스트럭션 페이지에서 쓰이는 Level6 설명

  @QML FileName : Level6.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Level6 explanation Part in Instruction of Menu1
*/

import QtQuick 2.0

Item {
    id: itemLevel6
    width: 550
    height: 300

    property bool trigger : false
    property int intLevel6 : test[0]
    property string strLevel6

    property variant test: [77, 44, 46]

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
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[0]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[1]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[2]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[3]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[4]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[5]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[6]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "intLevel6"
                    value: test[7]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel6
                    property: "trigger"
                    value: true
                }
            }
        }
    ]

    onIntLevel6Changed: {

        strLevel6 = numTotext(intLevel6)

        if(strLevel6 == ";"){
            imgKeyboard.source = "../../../img/word/w-level-6-semicolon.png"
        }else if(strLevel6 == ","){
            imgKeyboard.source =  "../../../img/word/w-level-6-comma.png"
        }else if(strLevel6 == "."){
            imgKeyboard.source = "../../../img/word/w-level-6-period.png"
        }else{
            imgKeyboard.source = "../../../img/word/w-level-6-" + strLevel6.toLowerCase() + ".png"
        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false
            itemLevel6.state = ""
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

            text: strLevel6

            color: "#333333"
            font.family: fontCapital.name; font.pixelSize: 100

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Image{
        id: imgKeyboard
        width: parent.width; height: 180

        source: "../../../img/word/w-level-6-q.png"

        anchors.top: rectRow1.bottom
        anchors.topMargin: 10
    }
}
