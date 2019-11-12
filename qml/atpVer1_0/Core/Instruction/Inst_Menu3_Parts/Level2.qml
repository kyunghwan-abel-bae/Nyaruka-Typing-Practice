/**
  @QML 파일 이름 : Level2.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu3의 인스트럭션 페이지에서 쓰이는 Level2 설명

  @QML FileName : Level2.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Level2 explanation Part in Instruction of Menu3
*/

import QtQuick 2.0

Item {
    id: itemLevel2
    width: 550
    height: 300

    property bool trigger : false

    property int test_index: 0

    property string word_blueText
    property string word_redText
    property string wordLevel2 : test[0]

    property variant test: ["seka", "kawa"]

    signal setRedText()

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
                    target: inputArea
                    property: "text"
                    value: ""
                }

                PropertyAction{
                    target: imgKeyboard
                    property: "source"
                    value: "../../../img/word/w-level-2-s.png"
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "s"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "se"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "sek"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "seka"
                }

                NumberAnimation{
                    duration: 3000
                }

                PropertyAction{
                    target: itemLevel2
                    property: "test_index"
                    value: "1"
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: ""
                }

                PropertyAction{
                    target: imgKeyboard
                    property: "source"
                    value: "../../../img/word/w-level-2-k.png"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "k"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "ka"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "kaw"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "kawx"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "kaw"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "kawa"
                }
            }
        }
    ]

    Component.onCompleted: {
        imgKeyboard.source = "../../../img/word/w-level-2-s.png"
    }

    onSetRedText: {
        var inputTextSize = inputArea.text.length
        var textSize = wordLevel2.length

        if(inputTextSize <= textSize){
            var text_cmp = test[test_index];
            var text_new = inputArea.text;

            if(text_new.substring(0, inputTextSize) == text_cmp.substring(0, inputTextSize)){
                //soundCorrect.play()
                word_blueText = '<font color="blue">' + text_cmp.substring(0, inputTextSize) + '</font>';
                word_redText = ""
            }else{
                //if(trigger_backspace == false) soundIncorrect.play()
                word_redText = '<font color="red">' + text_cmp.substring(word_blueText.length - 26, inputTextSize) + '</font>';
            }

            wordLevel2 = word_blueText + word_redText + text_cmp.substring(inputTextSize, textSize);

        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false
            itemLevel2.state = ""
        }
    }

    function returnKeyImage(){
        var keyboard_char;

        if(word_redText.length){
            imgKeyboard.source = "../../../img/word/w-level-2-" + "backspace.png";
        }else{
            var text = test[test_index]; // delete font tag ( color )
            var index = inputArea.text.length;

            keyboard_char = text.charAt(index);
            keyboard_char = keyboard_char.toLowerCase()

            if(keyboard_char == ";"){
                keyboard_char = "semicolon"
            }else if(keyboard_char == ","){
                keyboard_char = "comma"
            }else if(keyboard_char == "."){
                keyboard_char = "period"
            }

            imgKeyboard.source = "../../../img/word/w-level-2-" + keyboard_char + ".png"
        }
    }

    Item{
        id: itemFont

        FontLoader{
            id: fontWord
            source: "../../../fonts/SourceSansPro-ExtraLight.otf"
        }
    }

    Item{
        id: rectRow1
        width: parent.width; height: 120
        anchors.top: parent.top

        Text{
            id: textMain

            text: wordLevel2

            color: "#333333"
            font.family: fontWord.name
            font.pixelSize: 70

            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle{
            id: rectUserinput
            width: textMain.width; height: 30

            color: "#80666666"

            anchors.top: textMain.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            TextInput{
                id: inputArea

                text: ""

                cursorVisible: true
                font.pixelSize: 30
                font.family: fontWord.name

                enabled: false

                anchors.centerIn: parent

                onTextChanged: {
                    setRedText()
                    if(inputArea.text == test[test_index]){
                        imgKeyboard.source = "../../../img/word/w-level-2-" + "enter.png";
                    }else{
                        returnKeyImage()
                    }
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

    Image{
        id: imgKeyboard

        width: parent.width; height: 180

        anchors.top: rectRow1.bottom
        anchors.topMargin: 10
    }
}
