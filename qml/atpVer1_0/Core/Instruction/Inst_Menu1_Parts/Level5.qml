/**
  @QML 파일 이름 : Level5.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu1의 인스트럭션 페이지에서 쓰이는 Level5 설명

  @QML FileName : Level5.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Level5 explanation Part in Instruction of Menu1
*/

import QtQuick 2.0

Item {
    id: itemLevel5
    width: 550
    height: 300

    property bool trigger : false
    property int intLevel5 : test[0]
    property string strLevel5

    property variant test: [90, 88, 67, 86]

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
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[0]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[1]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[2]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[3]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[4]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[5]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[6]
                }
                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "intLevel5"
                    value: test[7]
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: itemLevel5
                    property: "trigger"
                    value: true
                }
            }
        }
    ]

    onIntLevel5Changed: {

        strLevel5 = numTotext(intLevel5)

        if(strLevel5 == ";"){
            imgKeyboard.source = "../../../img/word/w-level-5-semicolon.png"
        }else if(strLevel5 == ","){
            imgKeyboard.source =  "../../../img/word/w-level-5-comma.png"
        }else if(strLevel5 == "."){
            imgKeyboard.source = "../../../img/word/w-level-5-period.png"
        }else{
            imgKeyboard.source = "../../../img/word/w-level-5-" + strLevel5.toLowerCase() + ".png"
        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false
            itemLevel5.state = ""
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

            text: strLevel5

            font.family: fontCapital.name; font.pixelSize: 100
            color: "#333333"

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Image{
        id: imgKeyboard
        width: parent.width; height: 180

        source: "../../../img/word/w-level-5-q.png"

        anchors.top: rectRow1.bottom
        anchors.topMargin: 10        
    }
}
