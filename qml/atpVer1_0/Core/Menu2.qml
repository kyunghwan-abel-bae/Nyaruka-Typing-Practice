/**

  @QML 파일 이름 : Menu2.qml
  @작 성 일 : 2013-11-09
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  사용자는 백스페이스나 엔터와 같이 가장 자주 사용되는 기능키들을 익힌다.

  @QML FileName : Menu1.qml
  @Date : 2013-11-09
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Learners will practice the most commonly used functional keys such as Backspace, Enter Keys.

*/

import QtQuick 2.0
import QtGraphicalEffects 1.0

import "Core_Part"

Rectangle {
    id: rectMenu2

    width: 830; height: 550
    color: "transparent"

    property bool trigger: false
    property bool trigger_enter: false
    property bool trigger_over: false

    property int courseClear : 0
    property int essential_index: 0
    property int lv_currentindex: 1

    property string keyboard_char // Change image of imgKeyboard, Whenever key presses
    property string selectedLanguage
    property string split1


    ///*--------------------------------------------
    property variant essential_explanation_en : [
        "A key that moves the cursor or insertion point backward one character space.\nIn addition to moving the cursor backward,\nthe Backspace key usually deletes the character to the left of the cursor or insertion point.",
        "A toggle key that, when activated, causes all subsequent alphabetic characters to be uppercase,\nbut has no effect on other keys.",
        "A key gives the other keys an alternate meaning.\nWhen combined with alphabetic keys, the Shift key causes the system to output a capital letter.",
        "When the spacebar key is pressed it creates an empty space,\nalso known as a space character that helps separate words and other characters in a sentences.",
        "A key that moves the cursor (or insertion point) to the beginning of the next line."
    ]

    property variant essential_explanation_rw : [
        "Touche ituma cursor yimuka cg",
        "A toggle key that, when activated, causes all subsequent alphabetic characters to be uppercase,\nbut has no effect on other keys.",
        "A key gives the other keys an alternate meaning.\nWhen combined with alphabetic keys, the Shift key causes the system to output a capital letter.",
        "Touche ituma cursor yimuka mu kwandika umurongo ukurikiyeho.",
        "Iyo ukanze spacebar hagati y'ijambo n'irindi hasigaramo umwanya."
    ]

    property variant essential_explanation
    //*/--------------------------------------------

    ///*--------------------------------------------
    property variant instruction_backspace: ["Erase all the Letters.", "Make the same word."]
    property variant instruction_capslock: ["Press the Caps Lock, and then Make the same word.", "Press the Caps Lock, and then Make the same word."]
    property variant instruction_shift: ["Make the same word with Shift", "Make the same word with Shift"]
    property variant instruction_space: ["Make the same word with Space", "Make the same word with Space"]
    property variant instruction_enter: ["Make the same word with Enter", "Make the same word with Enter"]

    property variant essential_instructions: instruction_backspace
    //*/--------------------------------------------

    ///*--------------------------------------------
    property variant example_backspace: ["", "back"]
    property variant example_capslock: ["RWANDA", "rwanda"]
    property variant example_shift: ["KoreA", "koRea"]
    property variant example_space: ["korea computer", "world friends korea"]
    property variant example_enter: ["rwanda\nnziza", "rwanda\ncoffee"]

    property variant essential_examples: example_backspace
    //*/--------------------------------------------


    signal btnBack_Instruction()

    signal errorEffect()

    signal setRedText()
    signal start()
    signal startAfterAnimation()

    Component.onCompleted: {
        SndEffect.setSourcePath("./qml/atpVer1_0/sounds/correct.wav")
        l1.currentIndex = 0
        start()

        selectedLanguage = rectMenu2.parent.selectedLanguage
        if(selectedLanguage == "en"){
            essential_explanation = essential_explanation_en
        }else if(selectedLanguage == "rw"){
            essential_explanation = essential_explanation_rw
        }

    }

    onBtnBack_Instruction: {
        rectMenu2.parent.backMenus = "./Core/Instruction/Inst_Menu2.qml"
    }

    onEssential_instructionsChanged: {
        textInstruction.text = essential_instructions[0]

        essential_index = 0
    }

    onEssential_examplesChanged: {
        textExample.text = essential_examples[0]
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false


            textInstruction.color = "#80000000"
            textInstruction.state = ""


            if(textInstruction.text == "Good, Wait"){
                startAfterAnimation()
            }
            else{
                l1.currentItem.colorValue = "yellow"
                l1.currentItem.imgVisible = true
                courseClear++

                if(l1.currentIndex == 4){
                    l1.currentIndex = 0
                }else{
                    l1.currentIndex++
                }

                start()
            }
        }

    }

    onTrigger_overChanged: {
        if(trigger_over == true){

            l1.currentItem.colorValue = "yellow"
            l1.currentItem.imgVisible = true

            textInstruction.state = ""
            l1.currentIndex = 0

            essential_index = 0

            start()

        }
    }

    onStart: { // 실행되는 교육이 다르기 때문에 공통코드가 다르다.
        textInstruction.text = essential_instructions[essential_index]
        textExample.text = essential_examples[essential_index]

        switch(l1.currentIndex){
        case 0:
            imgKeyboard.source = "../img/essential/Backspace.png"
            inputArea.text = "backspace"
            inputArea.focus = true
            inputArea.cursorPosition = inputArea.text.length

            essential_instructions = instruction_backspace
            essential_examples = example_backspace

            break;
        case 1: // Caps Lock
            inputArea.text = ""

            essential_instructions = instruction_capslock
            essential_examples = example_capslock
            console.log("example : " + essential_examples[0])

            imgKeyboard.source = "../img/essential/Caps Lock.png"
            itemKeypress.focus = true
            break;
        case 2:
            inputArea.text = ""

            essential_instructions = instruction_shift
            essential_examples = example_shift

            essential_index == 0 ? imgKeyboard.source = "../img/essential/ShiftK.png" : returnKeyImage()
            inputArea.focus = true
            break;
        case 3:
            inputArea.text = ""

            essential_instructions = instruction_space
            essential_examples = example_space

            inputArea.focus = true
            returnKeyImage()

            break;
        case 4:
            inputArea.text = ""

            essential_instructions = instruction_enter
            essential_examples = example_enter

            inputArea.focus = true
            returnKeyImage()
            break;
        }
    }

    onStartAfterAnimation: {
        essential_index = essential_index + 1

        inputArea.text  = ""
        start()
    }

    function returnKeyImage(){
        var text = essential_examples[essential_index]; // delete font tag ( color )
        var inputAreaText = inputArea.text;
        var index = inputAreaText.length;

        switch(l1.currentIndex){
        case 0: // BackSpace
            console.log("index(length) : " + index)
            if(index == text.length){ // When inputArea arrives a last letter
                // whether last letter is right or not
                if(text == inputAreaText){
                    // state 발생 Instruction에 Good을 1초 띄우고 다시 값을 되돌린다.
                    inputArea.focus = false
                    if(essential_index == 1 && courseClear == 4 && !trigger_over){
                        textInstruction.state = "Instruction_Good_Over"
                    }else{
                        essential_index == 1 ? textInstruction.state = "Instruction_Good_GoNext" : textInstruction.state = "Instruction_Good"
                    }
                }
            }else{
                imgKeyboard.source = "../img/essential/Backspace.png"
            }
            break;
        case 1: // Caps Lock

            if(index == text.length){ // When inputArea arrives a last letter
                // whether last letter is right or not
                if(text == inputAreaText){
                    // state 발생 Instruction에 Good을 1초 띄우고 다시 값을 되돌린다.
                    if(essential_index == 1 && courseClear == 4 && !trigger_over){
                        textInstruction.state = "Instruction_Good_Over"
                    }else{
                        essential_index == 1 ? textInstruction.state = "Instruction_Good_GoNext" : textInstruction.state = "Instruction_Good"
                    }
                }
            }else{
                console.log("why you are here?")
                keyboard_char = text.charAt(index);
                keyboard_char = keyboard_char.toLowerCase()

                imgKeyboard.source = "../img/word/w-level-6" + "-" + keyboard_char + ".png"
            }


            break;
        case 2: // Shift

            if(index == text.length){ // When inputArea arrives a last letter
                // whether last letter is right or not
                if(text == inputAreaText){
                    // state 발생 Instruction에 Good을 1초 띄우고 다시 값을 되돌린다.
                    if(essential_index == 1 && courseClear == 4 && !trigger_over){
                        textInstruction.state = "Instruction_Good_Over"
                    }else{
                        essential_index == 1 ? textInstruction.state = "Instruction_Good_GoNext" : textInstruction.state = "Instruction_Good"
                    }
                }
            }else{
                if(essential_index == 0 && index == 4){
                    imgKeyboard.source = "../img/essential/ShiftA.png"
                }else if(essential_index == 1 && index == 2){
                    imgKeyboard.source = "../img/essential/ShiftR.png"
                }else{
                    keyboard_char = text.charAt(index);
                    keyboard_char = keyboard_char.toLowerCase()

                    imgKeyboard.source = "../img/word/w-level-6" + "-" + keyboard_char + ".png"
                }
            }

            break;
        case 3: // Space
            if(index == text.length){ // When inputArea arrives a last letter
                // whether last letter is right or not
                if(text == inputAreaText){
                    // state 발생 Instruction에 Good을 1초 띄우고 다시 값을 되돌린다.
                    if(essential_index == 1 && courseClear == 4 && !trigger_over){
                        textInstruction.state = "Instruction_Good_Over"
                    }else{
                        essential_index == 1 ? textInstruction.state = "Instruction_Good_GoNext" : textInstruction.state = "Instruction_Good"
                    }
                }
            }else{
                if((essential_index == 0 && index == 5)||(essential_index == 1 && index == 5)||(essential_index == 1 && index == 13)){
                    imgKeyboard.source = "../img/essential/Space.png"
                }else{
                    keyboard_char = text.charAt(index);

                    imgKeyboard.source = "../img/word/w-level-6" + "-" + keyboard_char + ".png"
                }
            }

            break;
        case 4: // Enter

            var splitTexts = text.split("\n");

            textExample.text = splitTexts[0]
            textExample_Enter.text = splitTexts[1]

            // When input arrives a last letter
            if(inputArea_Enter.text.length == splitTexts[1].length){
                if(inputArea_Enter.text == splitTexts[1]){
                    itemKeypress.focus = true
                    imgKeyboard.source = "../img/essential/Enter.png"
                }else{ // 마지막 글자가 틀렸다.
                    imgKeyboard.source = "../img/essential/Backspace.png"
                }
            }else{
                if(!trigger_enter){ // enter 치기 전 첫 줄에서는
                    if((essential_index == 0 && index == 6)||(essential_index == 1 && index == 6)){
                        if(inputArea.text == splitTexts[0]){ // 첫 줄의 끝자락에서 입력된 값을 비교한다.
                            itemKeypress.focus = true // trigger_enter를 true로 주기 위해서
                            imgKeyboard.source = "../img/essential/Enter.png"
                        }else{ // 마지막 글자가 틀렸다.
                            imgKeyboard.source = "../img/essential/Backspace.png"
                        }
                    }else{ // 첫줄의 끝자락에 도착하지 않았다.
                        // 여기에서 !! 글자를 비교해, 틀리면 백스페이스 이미지를 보여주어야 한다.
                        keyboard_char = text.charAt(index);
                        imgKeyboard.source = "../img/word/w-level-6" + "-" + keyboard_char + ".png"
                    }
                }else if(trigger_enter){ // 두번째 줄 시작!
                    // 여기에서 !! 글자를 비교해, 틀리면 백스페이스 이미지를 보여주어야 한다.

                    keyboard_char = splitTexts[1].charAt(inputArea_Enter.text.length)
                    imgKeyboard.source = "../img/word/w-level-6" + "-" + keyboard_char + ".png"
                }
            }

            break;
        }
    }

    /*

      Interface

    */

    Item{
        id: itemFont

        FontLoader{
            id: fontNanum
            source: "../fonts/NanumMyeongjo.ttf"
        }
    }

    Item{
        id: itemKeypress
        anchors.fill: parent

        Keys.onPressed: {
            console.log("keys.onPressed")

            if(event.key){
                if(event.key == 16777220){ // enter
                    if(!trigger_enter){
                        console.log("key-if-if")
                        trigger_enter = true
                        inputArea.enabled = false
                        inputArea.focus = false

                        inputArea_Enter.focus = true
                        inputArea_Enter.enabled = true

                        essential_index == 0 ? imgKeyboard.source = "../img/word/w-level-6-n.png" : imgKeyboard.source = "../img/word/w-level-6-c.png"

                    }else{
                        console.log("key-if-else")
                        trigger_enter = false

                        if(essential_index == 1 && courseClear == 4 && !trigger_over){
                            textInstruction.state = "Instruction_Good_Over"
                        }else if(essential_index == 0){
                            textInstruction.state = "Instruction_Good"
                        }else{
                            textInstruction.state = "Instruction_Good_GoNext"
                        }


                        inputArea.text = ""
                        inputArea_Enter.text = ""

                        inputArea.enabled = true
                        inputArea_Enter.enabled = false
                    }

                }else if(event.key == 16777219){
                    // this part is for only enter key practice
                    inputArea.text = inputArea.text.substring(0, inputArea.text.length-1)
                    inputArea.focus = true
                }else if(l1.currentIndex == 1){
                    if(event.key == 16777252){
                        inputArea.focus = true
                        //textInstruction.text = essential_instructions[0]
                        returnKeyImage()
                    }
                }
            }
        }
    }


    Rectangle{
        id: rectRow1
        width: 830; height: 255
        color: "transparent"

        Rectangle{
            id: rectRow1Column1
            width: 615; height: parent.height

            color: "#80FFFFFF"
            radius: 10

            anchors.left: parent.left

            Item{
                id: rect_Explanation_Instruction
                width: parent.width; height: parent.height/3
                anchors.top: parent.top
                anchors.topMargin: 10

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
                    width: 8; height: parent.height

                    color: "#F5BC75"

                    anchors.left: parent.left
                }

                Text{
                    id: textExplanation

                    text: essential_explanation[l1.currentIndex]

                    color: "#90000000"
                    font.family: fontNanum.name
                    font.pixelSize: 14

                    anchors.left: rectPointLine.right
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }

                Text{
                    id: textInstruction

                    text: essential_instructions[0]

                    color: "#A0000000"
                    font.bold: true
                    font.family: fontNanum.name
                    font.pixelSize: 18

                    anchors.left: rectPointLine.right
                    anchors.leftMargin: 20
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5

                    states:[
                        State{
                            name: "Instruction_Good"
                        },
                        State{
                            name: "Instruction_Good_GoNext"
                        },
                        State{
                            name: "Instruction_Good_Over"
                        }

                    ]

                    transitions:[
                        Transition{
                            to: "Instruction_Good"

                            SequentialAnimation{
                                PropertyAction{
                                    target: textInstruction
                                    property: "text"
                                    value: "Good, Wait"
                                }
                                PropertyAction{
                                    target: textInstruction
                                    property: "color"
                                    value: "#80FF0000"
                                }

                                PropertyAnimation{
                                    duration: 2000
                                }

                                PropertyAction{
                                    target:rectMenu2; property: "trigger"; value: "true"
                                }
                            }
                        },Transition{
                            to: "Instruction_Good_GoNext"

                            SequentialAnimation{
                                PropertyAction{
                                    target: l1
                                    property: "enabled"
                                    value: false
                                }

                                PropertyAction{
                                    target: textInstruction
                                    property: "text"
                                    value: "Good, Go Next"
                                }
                                PropertyAction{
                                    target: textInstruction
                                    property: "color"
                                    value: "#80FF0000"
                                }

                                PropertyAnimation{
                                    duration: 2000
                                }

                                PropertyAction{
                                    target: l1
                                    property: "enabled"
                                    value: true
                                }

                                PropertyAction{
                                    target:rectMenu2; property: "trigger"; value: "true"
                                }
                            }
                        },Transition{
                            to: "Instruction_Good_Over"

                            SequentialAnimation{
                                PropertyAction{
                                    target: l1
                                    property: "enabled"
                                    value: false
                                }

                                PropertyAction{
                                    target: textInstruction
                                    property: "text"
                                    value: "Good, All Courses are Over!"
                                }

                                PropertyAction{
                                    target: textInstruction
                                    property: "color"
                                    value: "#80FF0000"
                                }

                                PropertyAnimation{
                                    duration: 2000
                                }

                                PropertyAction{
                                    target: textInstruction
                                    property: "text"
                                    value: "It will start over, You can choose other menus"
                                }

                                PropertyAnimation{
                                    duration: 2000
                                }

                                PropertyAction{
                                    target: l1
                                    property: "enabled"
                                    value: true
                                }

                                PropertyAction{
                                    target: rectMenu2
                                    property: "trigger_over"
                                    value: true
                                }
                            }
                        }

                    ]
                }

            }





            Text{
                id: textExample

                text: essential_examples[0]

                color: "#80000000"
                font.family: fontNanum.name
                font.pixelSize: 30
                visible: (l1.currentIndex == 0) && (essential_index == 0) ? false : true

                anchors.top: rect_Explanation_Instruction.bottom
                anchors.topMargin: l1.currentIndex == 4 ? 5 : 20
                anchors.horizontalCenter: parent.horizontalCenter


            }

            Text{
                id: textExample_Enter

                text: essential_examples[0]

                color: "#80000000"
                font.family: fontNanum.name
                font.pixelSize: 30
                visible: l1.currentIndex == 4 ? true : false

                anchors.top: textExample.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle{
                id: rectUserinput
                width: l1.currentIndex == 0 ? inputArea.width : textExample.width
                height: 35

                color: "#80777777"

                anchors.top: textExample.visible == true ? textExample.bottom : rect_Explanation_Instruction.bottom
                anchors.topMargin: textExample.visible == true ? 30 : 50
                anchors.horizontalCenter: parent.horizontalCenter

                TextInput{ // 두개를 붙여서 쓰겠습니다. Edit는 구려요
                    id: inputArea

                    text: ""

                    color: "#800000FF"
                    cursorVisible: true
                    focus: true
                    font.family: fontNanum.name
                    font.pixelSize: 30
                    maximumLength: l1.currentIndex == 0 ? 11 : textExample.text.length

                    anchors.centerIn: parent

                    Keys.onEscapePressed: {
                        btnBack_Instruction()
                    }

                    onTextChanged: {
                        SndEffect.playSnd()
                        returnKeyImage()
                    }
                }

                Rectangle{
                    id: rectUserinputLine
                    width: parent.width; height: 1

                    color: "#80555555"

                    anchors.top: inputArea.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle{
                id: rectUserinput_Enter
                width: textExample.width; height: 35

                color: "#80777777"
                visible: l1.currentIndex == 4 ? true : false

                anchors.top: rectUserinput.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                TextInput{ // 두개를 붙여서 쓰겠습니다. Edit는 구려요
                    id: inputArea_Enter

                    text: ""

                    color: "#800000FF"
                    cursorVisible: false
                    enabled: false
                    focus: true
                    font.family: fontNanum.name
                    font.pixelSize: 30
                    maximumLength: textExample.text.length

                    anchors.centerIn: parent

                    Keys.onEscapePressed: {
                        btnBack_Instruction()
                    }

                    onTextChanged: {
                        SndEffect.playSnd()
                        returnKeyImage()
                    }
                }

                Rectangle{
                    id: rectUserinputLine_Enter
                    width: parent.width; height: 1

                    color: "#80555555"

                    anchors.top: inputArea_Enter.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

        }


        Rectangle{ // row 1, column 2
            id: rectRow1Column2
            width: 210; height: parent.height

            color: "#80000000"
            radius: 10

            anchors.left: rectRow1Column1.right
            anchors.leftMargin: 10

            Rectangle{ // row 1, column 1
                id: list
                width: parent.width; height: parent.height - 55

                color: "transparent"

                anchors.verticalCenter: parent.verticalCenter

                ListModel{
                    id: levelsModel

                    ListElement{ name: "Backspace"}
                    ListElement{ name: "Caps Lock"}
                    ListElement{ name: "Shift"}
                    ListElement{ name: "Space"}
                    ListElement{ name: "Enter"}
                }

                Component{
                    id: levelDelegate
                    Item{
                        id: levelItem
                        width: parent.width; height:190/5

                        property string colorValue : "#80FFFFFF"
                        property bool imgVisible : false

                        Image{
                            id: levelImage

                            source: "../img/essential/check.png"

                            visible: imgVisible

                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text{
                            id: levelText

                            text: name;

                            color: l1.currentItem.y == levelItem.y ? "white" : parent.colorValue
                            font.family: fontNanum.name
                            font.pixelSize: 22

                            anchors.centerIn: parent
                        }

                        MouseArea{
                            anchors.fill: parent

                            // 리스트를 클릭하면 아래의 것이 실행된다.
                            onClicked: { // 위의 start() 시그널과 차이점 : enter를 눌렸을 때 start()가 실행되므로 교육 중 변하지 않는 것은 여기에 코딩
                                switch(index){
                                case 0:
                                    essential_instructions = instruction_backspace
                                    essential_examples = example_backspace

                                    break;
                                case 1:
                                    essential_instructions = instruction_capslock
                                    essential_examples = example_capslock
                                    break;

                                case 2:
                                    essential_instructions = instruction_shift
                                    essential_examples = example_shift

                                    break;
                                case 3:
                                    essential_instructions = instruction_space
                                    essential_examples = example_space

                                    break;
                                case 4:
                                    essential_instructions = instruction_enter
                                    essential_examples = example_enter
                                    break;
                                }

                                // for Enter practice
                                inputArea.enabled = true
                                inputArea.text = ""
                                inputArea_Enter.text = ""
                                inputArea_Enter.enabled = false
                                trigger_enter = 0

                                essential_index = 0
                                l1.currentIndex = index

                                start()
                            }
                        }
                    }
                }

                ListView{
                    id: l1

                    model: levelsModel
                    delegate: levelDelegate
                    highlight: Rectangle{
                        color: "#80FFFFFF";
                        y: l1.currentItem.y;

                        Behavior on y { SpringAnimation{ damping: 0.25 } }
                    }

                    focus: true

                    anchors.fill: parent

                    currentIndex: 0
                    onCurrentIndexChanged: {
                        lv_currentindex = currentIndex + 1
                    }
                }
            }


        } // Rectangle(row 1, column 3)
    } // Rectangle ( id : rectRow1 )


    Image{
        id: imgKeyboard

        width: 830; height: 308

        anchors.left: rectRow1.left
        anchors.top: rectRow1.bottom
        anchors.topMargin: 10
        anchors.right: rectRow1.right
    }

    BackButton{
        anchors.right: imgKeyboard.right
        anchors.bottom: imgKeyboard.bottom
        anchors.bottomMargin: 32

        onButtonClicked: {
            btnBack_Instruction()
        }
    }
}
