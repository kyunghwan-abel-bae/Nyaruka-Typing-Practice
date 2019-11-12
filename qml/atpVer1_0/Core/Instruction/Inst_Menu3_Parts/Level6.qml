/**
  @QML 파일 이름 : Level6.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu3의 인스트럭션 페이지에서 쓰이는 Level6 설명

  @QML FileName : Level6.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Level6 explanation Part in Instruction of Menu3
*/

import QtQuick 2.0

Item {
    id: itemLevel6
    width: 550
    height: 300

    property bool trigger : false

    property int test_index: 0

    property string word_blueText
    property string word_redText
    property string wordLevel6 : test[0]

    property variant test: ["muhabura","karisimbi"]

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
                    value: "../../../img/word/w-level-6-m.png"
                }

                NumberAnimation{
                    duration: 2000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "m"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "mu"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "muh"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "muha"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "muhab"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "muhabu"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "muhabur"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "muhabura"
                }

                NumberAnimation{
                    duration: 3000
                }

                PropertyAction{
                    target: itemLevel6
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
                    value: "../../../img/word/w-level-6-k.png"
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
                    value: "kar"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "karw"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "kar"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "kari"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "karis"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "karisi"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "karisim"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "karisimb"
                }

                NumberAnimation{
                    duration: 1000
                }

                PropertyAction{
                    target: inputArea
                    property: "text"
                    value: "karisimbi"
                }
            }
        }
    ]

    Component.onCompleted: {
        imgKeyboard.source = "../../../img/word/w-level-6-m.png"
    }

    onSetRedText: {
        var inputTextSize = inputArea.text.length
        var textSize = wordLevel6.length

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

            wordLevel6 = word_blueText + word_redText + text_cmp.substring(inputTextSize, textSize);
        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false
            itemLevel6.state = ""
        }
    }

    function returnKeyImage(){
        var keyboard_char;

        if(word_redText.length){
            imgKeyboard.source = "../../../img/word/w-level-6-" + "backspace.png";
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

            imgKeyboard.source = "../../../img/word/w-level-6-" + keyboard_char + ".png"
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

            text: wordLevel6

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
                font.family: fontWord.name
                font.pixelSize: 30

                enabled: false

                anchors.centerIn: parent

                onTextChanged: {
                    setRedText()
                    if(inputArea.text == test[test_index]){
                        imgKeyboard.source = "../../../img/word/w-level-6-" + "enter.png";
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
