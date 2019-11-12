/**

  @QML 파일 이름 : Menu3.qml
  @작 성 일 : 2013-11-09
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  사용자는 영/르 단어로 좀 더 실용적인 타이핑 기술을 연습할 수 있다.

  @QML FileName : Menu3.qml
  @Date : 2013-11-09
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Learners can practice more practical typing skills with En/Rw Words.

*/

import QtQuick 2.0
import QtMultimedia 5.0

import "Core_Part"
import "Result"

Item {
    id: rectMenu3

    width: 830; height: 550

    property bool hideOn : false

    property bool trigger: false
    property bool trigger_backspace: false
    property bool trigger_state: false

    property int currentTime
    property string currentTime_str: "00:00"
    property string strZero1
    property string strZero2

    property int lv_currentindex
    property int lv_currentLevel

    property int lv_index: 0
    property int lv_index_coming1: 0
    property int lv_index_coming2: 0

    property int lv_progress: 0
    property int lv_review: 0

    // trans variables to result
    property int numMistakes : 0
    property int stars : 0

    property string keyboard_char // Change image of imgKeyboard, Whenever key presses

    property string lv_text
    property string lv_textcoming1
    property string lv_textcoming2

    property string lv_blueText
    property string lv_redText

    property string selectedLanguage

    // for statistics
    property variant allCharacters : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    property variant lv : []

    property variant lv1_text: ["add", "faff", "all", "salad", "dad", "lad", "ask", "all"]
    property variant lv2_text: ["sell", "wear", "keek", "ear", "draw", "leak", "seal", "leadless"]
    property variant lv3_text: ["hat", "haft", "yes", "bay", "baby", "glee", "hall"]
    property variant lv4_text: ["kid", "flood", "push", "skill", "korea", "doll", "pull", "disease"]
    property variant lv5_text: ["java", "victory", "captain", "zax", "axe", "zebra", "cell", "csi"]
    property variant lv6_text: ["no", "money", "mercy", "a,b,c", "bye.", "man", "l,m,n", "rwanda"]

    property variant lv1_text_rw: ["sasa","dada","aka","sada","asa","aka","akada","fafa","jaja","lala"]
    property variant lv2_text_rw: ["wera","were","rwere","kera","kwaka","seka","kawa","waseka","rasa","kare","kajeke","fawe","kwera","kwesa","kwasa","sawa"]
    property variant lv3_text_rw: ["twese","yewe","yera","gera","tera","ewsa","data","tega","base","haha","kwenderanya","yanyweye"]
    property variant lv4_text_rw: ["ubushake","nyaruka","nyabarongo","akanyaru","inyota","indabo","bisoke","urwego","sabyinyo","bisesero","isogisi","sogokuru","ubwiyunge"]
    property variant lv5_text_rw: ["vino","imvugo","icyiciro","zeru","ceceka","rusizi","icyenda","igiceri","icumi","icumu","icebe","zacu","abacukuzi","ivata","zaza"]
    property variant lv6_text_rw: ["muhabura","karisimbi","icyunamo","imvuvu","impamvu","impumu","impombo","umukororombya","umukambwe","imyembe","imyambaro"]

    property Item itemDestroy

    signal btnBack_Instruction()

    signal errorEffect()
    signal resultEffect()

    signal setRedText()
    signal start()
    signal startAfterAnimation()

    states: [
        State{
            name: "resultState"
        },
        State{
            name: "normalState"
        }
    ]

    transitions: [
        Transition{
            to: "resultState"

            SequentialAnimation{
                ParallelAnimation{
                    PropertyAction{
                        target: rectRow1Column1
                        property: "color"
                        value: "transparent"
                    }
                    PropertyAction{
                        target: rectRow1Column1
                        property: "border.width"
                        value: 2
                    }
                    PropertyAction{
                        target: rectRow1Column1
                        property: "border.color"
                        value: "white"
                    }
                    PropertyAction{
                        target: rectText
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: rectProgress
                        property: "color"
                        value: "transparent"
                    }
                    PropertyAction{
                        target: txtBtnleft
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: txtBtnright
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: txtLevel
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textTime
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textTimeNum
                        property: "color"
                        value: "yellow"
                    }
                    PropertyAction{
                        target: textProgress
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textProgressNum
                        property: "color"
                        value: "yellow"
                    }
                    PropertyAction{
                        target: btnHide
                        property: "visible"
                        value: false
                    }


                    // now appear something

                    PropertyAction{
                        target: itemResult
                        property: "visible"
                        value: true
                    }
                }
            }

        },
        Transition{
            to: "normalState"

            SequentialAnimation{
                ParallelAnimation{
                    PropertyAction{
                        target: rectRow1Column1
                        property: "color"
                        value: "#80FFFFFF"
                    }
                    PropertyAction{
                        target: rectRow1Column1
                        property: "border.width"
                        value: 0
                    }
                    PropertyAction{
                        target: rectRow1Column1
                        property: "border.color"
                        value: "transparent"
                    }
                    PropertyAction{
                        target: rectText
                        property: "visible"
                        value: true
                    }
                    PropertyAction{
                        target: rectProgress
                        property: "color"
                        value: "#80000000"
                    }
                    PropertyAction{
                        target: txtBtnleft
                        property: "visible"
                        value: true
                    }
                    PropertyAction{
                        target: txtBtnright
                        property: "visible"
                        value: true
                    }
                    PropertyAction{
                        target: txtLevel
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textTime
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textTimeNum
                        property: "color"
                        value: "white"
                    }
                    PropertyAction{
                        target: textProgress
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textProgressNum
                        property: "color"
                        value: "white"
                    }
                    PropertyAction{
                        target: btnHide
                        property: "visible"
                        value: true
                    }


                    // now disapear

                    PropertyAction{
                        target: itemResult
                        property: "visible"
                        value: false
                    }
                }

                PropertyAction{
                    target: rectMenu3
                    property: "trigger_state"
                    value: true
                }


            }

        }
    ]

    Component.onCompleted: {
        SndEffect.setSourcePath("./qml/atpVer1_0/sounds/correct.wav")
        SndEffect_Error.setSourcePath("./qml/atpVer1_0/sounds/incorrect.wav")

        selectedLanguage = rectMenu3.parent.selectedLanguage
        lv_currentLevel = rectMenu3.parent.wordLevel

        lv_currentindex = lv_currentLevel

        switch(lv_currentindex){
        case 1:

            if(selectedLanguage == "en") lv = lv1_text
            else if(selectedLanguage == "rw") lv = lv1_text_rw

            break;
        case 2:

            if(selectedLanguage == "en") lv = lv2_text
            else if(selectedLanguage == "rw") lv = lv2_text_rw

            break;
        case 3:

            if(selectedLanguage == "en") lv = lv3_text
            else if(selectedLanguage == "rw") lv = lv3_text_rw

            break;
        case 4:

            if(selectedLanguage == "en") lv = lv4_text
            else if(selectedLanguage == "rw") lv = lv4_text_rw

            break;
        case 5:

            if(selectedLanguage == "en") lv = lv5_text
            else if(selectedLanguage == "rw") lv = lv5_text_rw

            break;
        case 6:

            if(selectedLanguage == "en") lv = lv6_text
            else if(selectedLanguage == "rw") lv = lv6_text_rw

            break;
        }

        timer.start()
        start()
    }

    onBtnBack_Instruction: {
        rectMenu3.parent.backMenus = "./Core/Instruction/Inst_Menu3.qml"
    }

    onStart: {
        var arrSize = lv.length;

        if(lv_review == 0){ // for checking this is first start() or not
            var num1 = Math.ceil(Math.random()*100) % arrSize;
            var num2 = Math.ceil(Math.random()*100) % arrSize;
            var num3 = Math.ceil(Math.random()*100) % arrSize;

            console.log(num1 + " " + num2 + " " + num3);

            lv_index = num1;
            lv_index_coming1 = num2;
            lv_index_coming2 = num3;
        }else{
            var num = Math.ceil(Math.random()*100) % arrSize;

            lv_index = lv_index_coming1;
            lv_index_coming1 = lv_index_coming2;
            lv_index_coming2 = num;
        }

        lv_text = lv[lv_index]
        lv_textcoming1 = lv[lv_index_coming1]
        lv_textcoming2 = lv[lv_index_coming2]

        returnKeyImage()
    }

    onStartAfterAnimation: {
        lv_review = lv_review + 1
        lv_progress = lv_review * 5

        if(lv_review == 10){ // 10 단어를 입력하면 이전 레벨의 단어와 함께 단어들이 출현한다.
            lv = arrMerge()
            console.log("lv : " + lv)
        }

        start()
    }

    onSetRedText: {
        var inputTextSize = inputArea.text.length
        var textSize = lv_text.length

        if(inputTextSize <= textSize){
            var text_cmp = lv[lv_index];
            var text_new = inputArea.text;

            if(text_new.substring(0, inputTextSize) == text_cmp.substring(0, inputTextSize)){
                SndEffect.playSnd()
                lv_blueText = '<font color="blue">' + text_cmp.substring(0, inputTextSize) + '</font>';
                lv_redText = ""
            }else{
                if(!trigger_backspace){
                    SndEffect_Error.playSnd()
                    statistics(text_cmp.substring(inputTextSize-1,inputTextSize))
                    errorEffect()
                }

                lv_redText = '<font color="red">' + text_cmp.substring(lv_blueText.length - 26, inputTextSize) + '</font>';

            }

            lv_text = lv_blueText + lv_redText + text_cmp.substring(inputTextSize, textSize);
            trigger_backspace = false
        }
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false

            rectText.state = ""
            startAfterAnimation()
        }
    }

    onTrigger_stateChanged: {
        if(trigger_state){
            trigger_state = false

            itemDestroy.destroy()// destroy

            numMistakes = 0
            lv_progress = 0
            lv_review = 0


            timer.start()
            start()

            inputArea.text = ""
            inputArea.enabled = true
            inputArea.focus = true            
        }
    }

    function returnKeyImage(){     

        if(lv_redText.length){
            imgKeyboard.source = "../img/word/w-level-" + lv_currentindex + "-" + "backspace.png";
        }else{
            var text = lv[lv_index]; // delete font tag ( color )
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

            if(hideOn){
                imgKeyboard.source = "../img/keyboardSubstitution.png"
            }else if(itemResult.visible){
                //console.log("the only place can provide.")
                imgKeyboard.source = "../img/keyboardSubstitution.png"
            }else{
                imgKeyboard.source = "../img/word/w-level-" + lv_currentindex + "-" + keyboard_char + ".png"
            }
        }

        inputArea.focus = true
    }
    function arrMerge(){ // for reviewing previous levels
        var nowLevel = lv_currentindex;
        var arr;

        if(selectedLanguage == "en") arr = lv1_text
        else if(selectedLanguage == "rw") arr = lv1_text_rw

        var now = arr

        // 복습을 위해 이전 단계의 키들을 설정한다.
        if(selectedLanguage == "en"){
            switch(nowLevel){
            case 2:
                now = lv2_text
                now = now.concat(arr)
                break;
            case 3:
                arr = arr.concat(lv2_text)
                now = lv3_text
                now = now.concat(arr)
                break;
            case 4:
                arr = arr.concat(lv2_text)
                arr = arr.concat(lv3_text)
                now = lv4_text
                now = now.concat(arr)
                break;
            case 5:
                arr = arr.concat(lv2_text)
                arr = arr.concat(lv3_text)
                arr = arr.concat(lv4_text)
                now = lv5_text
                now = now.concat(arr)
                break;
            case 6:
                arr = arr.concat(lv2_text)
                arr = arr.concat(lv3_text)
                arr = arr.concat(lv4_text)
                arr = arr.concat(lv5_text)
                now = lv6_text
                now = now.concat(arr)
                break;
            }
        }else if(selectedLanguage == "rw"){
            switch(nowLevel){
            case 2:
                now = lv2_text_rw
                now = now.concat(arr)
                break;
            case 3:
                arr = arr.concat(lv2_text_rw)
                now = lv3_text_rw
                now = now.concat(arr)
                break;
            case 4:
                arr = arr.concat(lv2_text_rw)
                arr = arr.concat(lv3_text_rw)
                now = lv4_text_rw
                now = now.concat(arr)
                break;
            case 5:
                arr = arr.concat(lv2_text_rw)
                arr = arr.concat(lv3_text_rw)
                arr = arr.concat(lv4_text_rw)
                now = lv5_text_rw
                now = now.concat(arr)
                break;
            case 6:
                arr = arr.concat(lv2_text_rw)
                arr = arr.concat(lv3_text_rw)
                arr = arr.concat(lv4_text_rw)
                arr = arr.concat(lv5_text_rw)
                now = lv6_text_rw
                now = now.concat(arr)
                break;
            }
        }

        return now;
    }

    function statistics(ch){
        var num = ch.charCodeAt()

        var arr = new Array(29);

        arr = allCharacters;

        if(num == 59){
            arr[26] += 1
        }else if(num == 44){
            arr[27] += 1
        }else if(num == 46){
            arr[28] += 1
        }else{ // 97을 쓴 이유는 소문자를 처리하기 위해서
            arr[num-97] += 1
        }

        allCharacters = arr

        numMistakes++
    }

    /*

      Interface

    */

    Item{
        id: itemFont

        FontLoader{
            id: fontExtraLight
            source: "../fonts/SourceSansPro-ExtraLight.otf"
        }
    }

    Item{
        id: itemKeypress

        anchors.fill: parent

        Timer{  // Thread 로 처리할 수는 없는가?
            id: timer

            interval: 1000; running: false; repeat: true

            onTriggered: {
                currentTime = currentTime + interval
                if(currentTime >= 3600000){
                    console.log("1 hour is passed. Modal Window!")
                    timer.stop()
                }

                strZero1 = Math.floor(currentTime/60000) < 10 ? "0" : ""
                strZero2 = Math.floor((currentTime%60000)/1000) < 10 ? "0" : ""
                currentTime_str = strZero1 + Math.floor(currentTime/60000) + ":" + strZero2 + Math.floor((currentTime%60000)/1000)
            }
        }
    }



    Item{
        id: itemKeypress_Continue
        focus: false

        anchors.fill: parent

        Keys.onPressed: {
            itemKeypress_Continue.focus = false
            inputArea.focus = true
            imgKeyboard.source = "../img/word/w-level-" + lv_currentindex + "-" + keyboard_char + ".png"
        }
    }

    Item{
        id: rectRow1
        width: 830; height: 250

        Rectangle{ // row 1, column 1 ( the longest row of 3 rows )
            id: rectRow1Column1

            width: 665; height: parent.height // width = parent.width / 5 + 76 ( when list got to be small )

            color: "#80FFFFFF"
            radius: 10

            anchors.left: parent.left

            Item{
                id: rectText
                width: parent.width; height: 205

                states: [
                    State{
                        name: "moveTotxtWord"

                        PropertyChanges{
                            target: txtWord; visible: false
                        }

                        AnchorChanges{
                            target: txtComing1; anchors.horizontalCenter: rectText.horizontalCenter
                        }

                        PropertyChanges{
                            target: txtComing1; color: "#333333"; font.pixelSize: 80; y: 65
                        }
                        PropertyChanges{
                            target: txtComing2; color: "#888888"; font.pixelSize: 40; x: 490; y: 160
                        }
                    }
                ]

                transitions: [
                    Transition{
                        to: "moveTotxtWord"

                        SequentialAnimation{

                            PropertyAction{
                                target: inputArea
                                property: "focus"
                                value: false
                            }

                            ParallelAnimation{
                                ParallelAnimation{
                                    NumberAnimation{
                                        target: txtComing1
                                        properties: "font.pixelSize, y";
                                        duration: 200
                                    }

                                    AnchorAnimation{
                                        duration: 200
                                    }
                                }

                                ParallelAnimation{
                                    NumberAnimation{
                                        target: txtWord
                                        properties: "visible"
                                        duration: 50
                                    }

                                    NumberAnimation{
                                        target: txtComing2
                                        properties: "font.pixelSize, x, y"
                                        duration: 50
                                    }
                                }
                            }


                            ParallelAnimation{

                                ColorAnimation{
                                    target: txtComing1
                                    duration: 100
                                }

                                ColorAnimation{
                                    target: txtComing2
                                    duration: 100
                                }
                            }

                            PropertyAction{
                                target:rectMenu3; property:"trigger"; value: "true"
                            }
                        }
                    }
                ]

                Text{
                    id: txtWord

                    y: 65

                    text: lv_text

                    color: "#333333"
                    font.family: fontExtraLight.name
                    font.pixelSize: 80

                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text{
                    id: txtComing1
                    x: 490; y: 160

                    text: lv_textcoming1

                    color: "#888888"
                    font.family: fontExtraLight.name
                    font.pixelSize: 40
                }

                Text{
                    id: txtComing2
                    x: 550; y: 210

                    text: lv_textcoming2

                    color: "#AAAAAA"
                    font.family: fontExtraLight.name
                    font.pixelSize: 25
                }

                Rectangle{
                    id: rectUserinput
                    width: txtWord.width; height: 45
                    y: 180

                    color: "#80666666"

                    anchors.horizontalCenter: parent.horizontalCenter

                    TextInput{
                        id: inputArea
                        text: ""

                        cursorVisible: true
                        focus: true
                        font.family: fontExtraLight.name
                        font.pixelSize: 40
                        maximumLength: lv[lv_index].length

                        anchors.centerIn: parent

                        Keys.onEscapePressed: {
                            btnBack_Instruction()
                        }

                        Keys.onPressed: {
                            if(event.key == 16777220 && (inputArea.text == lv[lv_index])){ // enter
                                inputArea.text = ""
                                rectText.state = "moveTotxtWord"
                            }else if(event.key == 16777219){
                                trigger_backspace = true
                            }
                        }

                        Keys.onLeftPressed: {}

                        onTextChanged: {

                            setRedText()

                            if(inputArea.text == lv[lv_index]){
                                if(lv_review<25){
                                    imgKeyboard.source = "../img/word/w-level-" + lv_currentindex + "-" + "enter.png";
                                }
                            }else{
                                returnKeyImage()
                            }

                        }

                        MouseArea{
                            anchors.fill: parent
                        }
                    }
                    Rectangle{
                        id: rectUserinputLine
                        width: txtWord.width; height: 1
                        color: "#80555555"

                        anchors.top: inputArea.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            Item{
                id: itemResult

                width: parent.width - 50; height: parent.height - 30

                visible: false

                anchors.centerIn: parent

                onVisibleChanged: { // 결과창이 등장할 때
                    if(itemResult.visible){

                        itemResult.focus = true

                        timer.stop()

                        var arr = new Array(29);
                        var arr_cmp = new Array(29);
                        var index = 0

                        arr = allCharacters
                        arr_cmp = arr
                        arr.sort()

                        var charArr = new Array(4);

                        if(arr[27] == 0){
                            arr[27] = 1000
                        }

                        if(arr[26] == 0){
                            arr[26] = 1000
                        }

                        if(arr[25] == 0){
                            arr[25] = 1000
                        }

                        for(var i in allCharacters){
                            if(allCharacters[i] == arr[28]||allCharacters[i] == arr[27]||allCharacters[i] == arr[26]||allCharacters[i] == arr[25]){

                                if(i < 26){
                                    charArr[index] = String.fromCharCode(parseInt(i) + 97)
                                }else if(i == 26){
                                    charArr[index] = String.fromCharCode(59)
                                }else if(i == 27){
                                    charArr[index] = String.fromCharCode(44)
                                }else if(i == 28){
                                    charArr[index] = String.fromCharCode(46)
                                }

                                console.log("ascii number : " + i)
                                //console.log("ascii number : " + String.fromCharCode((i + 97)))

                                index++
                                if(index == 4) break;
                            }
                        }

                        if(arr[27] == 1000){
                            charArr[1] = '@'
                        }

                        if(arr[26] == 1000){
                            charArr[2] = '@'
                        }

                        if(arr[25] == 1000){
                            charArr[3] = '@'
                        }

                        console.log("-------------------")

                        // 가독성을 위해서

                        for(var j in charArr){
                            console.log(j + ": " + charArr[j])
                        }


                        console.log("create Something->itemResultRow2")
                        // trans variable
                        // Score 1, 5 need only numMistakes
                        // Score 2_4 need variant variable(charMistakes), numMistakes, and stars
                        if(numMistakes > 20){
                            stars = 1
                            var score1Component = Qt.createComponent("./Result/Score1.qml")
                            var ret1 = score1Component.createObject(itemResultRow2, {
                                                                       "numMistakes" : numMistakes
                                                                   })
                            itemDestroy = ret1
                        }else if(numMistakes > 15){
                            stars = 2
                            var score2Component = Qt.createComponent("./Result/Score2_4.qml")
                            var ret2 = score2Component.createObject(itemResultRow2, {
                                                                        "numMistakes" : numMistakes,
                                                                        "stars" : stars,
                                                                        "charMistakes" : charArr,
                                                                        "lv" : lv_currentindex,
                                                                   })
                            itemDestroy = ret2
                        }else if(numMistakes > 10){
                            stars = 3
                            var score3Component = Qt.createComponent("./Result/Score2_4.qml")
                            var ret3 = score3Component.createObject(itemResultRow2, {
                                                                        "numMistakes" : numMistakes,
                                                                        "stars" : stars,
                                                                        "charMistakes" : charArr,
                                                                        "lv" : lv_currentindex
                                                                   })
                            itemDestroy = ret3
                        }else if(numMistakes > 5){
                            stars = 4
                            var score4Component = Qt.createComponent("./Result/Score2_4.qml")
                            var ret4 = score4Component.createObject(itemResultRow2, {
                                                                        "numMistakes" : numMistakes,
                                                                        "stars" : stars,
                                                                        "charMistakes" : charArr,
                                                                        "lv" : lv_currentindex,
                                                                        "isMenu3Check" : 1
                                                                   })
                            itemDestroy = ret4
                        }else if(numMistakes >= 0){
                            stars = 5
                            var score5Component = Qt.createComponent("./Result/Score5.qml")
                            var ret5 = score5Component.createObject(itemResultRow2, {
                                                                       "numMistakes" : numMistakes,
                                                                        "isMenu3Check" : 1
                                                                   })
                            itemDestroy = ret5
                        }
                    }
                }

                Item{
                    id: itemResultRow1
                    width: parent.width; height: 35

                    anchors.top: parent.top

                    Text{
                        id: textTitle

                        text: "Level " + lv_currentindex + " Complete!"

                        color: "yellow"
                        font.pixelSize: 23

                        anchors.left: parent.left
                    }

                    Row{
                        spacing: 5

                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        Repeater{
                            id: rep
                            model: stars
                            delegate: Image { scale: 0.7 ;source: "../img/star.png" }
                        }
                    }

                    Rectangle{
                        id: rectResultLine1
                        width: parent.width; height: 1

                        color: "black"
                        opacity: 0.2

                        anchors.top: textTitle.bottom
                        anchors.topMargin: 4
                    }

                    Rectangle{
                        id: rectResultLine2
                        width: parent.width; height: 1

                        color: "white"
                        opacity: 0.1

                        anchors.top: rectResultLine1.bottom
                        anchors.topMargin: 1
                    }
                }

                Item{
                    id: itemResultRow2
                    width: parent.width; height: 185

                    anchors.top: itemResultRow1.bottom

                    property bool isAgainButtonClicked : false
                    property bool isNextButtonClicked : false
                    property bool isGameButtonClicked : false

                    onIsAgainButtonClickedChanged: {
                        if(isAgainButtonClicked){
                            isAgainButtonClicked = false

                            resultEffect()
                            rectMenu3.state = "normalState"
                        }else{
                            console.log("what?? Does it make sense?!")
                        }
                    }

                    onIsNextButtonClickedChanged: {
                        if(isNextButtonClicked){
                            isNextButtonClicked = false

                            lv_currentindex++

                            switch(lv_currentindex){
                            case 2:

                                if(selectedLanguage == "en") lv = lv2_text
                                else if(selectedLanguage == "rw") lv = lv2_text_rw

                                break;
                            case 3:

                                if(selectedLanguage == "en") lv = lv3_text
                                else if(selectedLanguage == "rw") lv = lv3_text_rw

                                break;
                            case 4:

                                if(selectedLanguage == "en") lv = lv4_text
                                else if(selectedLanguage == "rw") lv = lv4_text_rw

                                break;
                            case 5:

                                if(selectedLanguage == "en") lv = lv5_text
                                else if(selectedLanguage == "rw") lv = lv5_text_rw

                                break;
                            case 6:

                                if(selectedLanguage == "en") lv = lv6_text
                                else if(selectedLanguage == "rw") lv = lv6_text_rw

                                break;
                            }

                            lv_review = 0

                            currentTime = 0
                            currentTime_str = "00:00"

                            resultEffect()
                            rectMenu3.state = "normalState"
                        }
                    }

                    onIsGameButtonClickedChanged: {
                        if(isGameButtonClicked){
                            isGameButtonClicked = false
                        }
                    }
                }
            }
        } // Rectangle ( row 1, column 1 )


        Rectangle{ // row 1, column 2
            id: rectProgress
            width: parent.width/5; height: parent.height

            color: "#80000000"
            radius: 10

            anchors.left: rectRow1Column1.right
            anchors.leftMargin: 10

            Item{
                id: rectLevelchoice
                width: parent.width - 18; height: 15

                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 20

                Text{
                    id: txtBtnleft

                    text: "<"

                    color: lv_currentindex == 1 ? "#80555555" : "#80FFFFFF"
                    scale: 1.7

                    anchors.left: parent.left

                    MouseArea{
                        id: mrLeft

                        hoverEnabled: lv_currentindex == 1 ? false : true

                        anchors.fill: parent

                        onEntered: {
                            parent.scale = parent.scale + 0.5
                        }
                        onExited: {
                            parent.scale = parent.scale - 0.5
                        }

                        onClicked: {
                            if(lv_currentindex != 1){ // don't response when user click left button more

                                lv_review = 0
                                imgKeyboard.opacity = 1
                                imgKeyboard.state = ""

                                lv_currentindex--

                                switch(lv_currentindex){
                                case 1:

                                    if(selectedLanguage == "en") lv = lv1_text
                                    else if(selectedLanguage == "rw") lv = lv1_text_rw

                                    break;
                                case 2:

                                    if(selectedLanguage == "en") lv = lv2_text
                                    else if(selectedLanguage == "rw") lv = lv2_text_rw

                                    break;
                                case 3:

                                    if(selectedLanguage == "en") lv = lv3_text
                                    else if(selectedLanguage == "rw") lv = lv3_text_rw

                                    break;
                                case 4:

                                    if(selectedLanguage == "en") lv = lv4_text
                                    else if(selectedLanguage == "rw") lv = lv4_text_rw

                                    break;
                                case 5:

                                    if(selectedLanguage == "en") lv = lv5_text
                                    else if(selectedLanguage == "rw") lv = lv5_text_rw

                                    break;
                                }

                                inputArea.focus = true
                                inputArea.text = ""

                                currentTime = 0
                                currentTime_str = "00:00"

                                lv_progress = 0

                                timer.start()

                                start()
                            }
                        }
                    }
                }

                Text{
                    id: txtLevel

                    text: "Level " + lv_currentindex

                    color: "#80FFFFFF"
                    scale: 1.7

                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text{
                    id: txtBtnright

                    text: ">"

                    color: lv_currentindex == 6 ? "#80555555" : "#80FFFFFF"
                    scale: 1.7

                    anchors.right: parent.right

                    MouseArea{
                        id: mrRight
                        hoverEnabled: lv_currentindex == 6 ? false : true

                        anchors.fill: parent

                        onEntered: {
                            parent.scale = parent.scale + 0.5
                        }

                        onExited: {
                            parent.scale = parent.scale - 0.5
                        }

                        onClicked: {

                            if(lv_currentindex != 6){ // don't response when user click right button more

                                lv_review = 0
                                imgKeyboard.opacity = 1
                                imgKeyboard.state = ""

                                lv_currentindex++

                                switch(lv_currentindex){
                                case 2:

                                    if(selectedLanguage == "en") lv = lv2_text
                                    else if(selectedLanguage == "rw") lv = lv2_text_rw

                                    break;
                                case 3:

                                    if(selectedLanguage == "en") lv = lv3_text
                                    else if(selectedLanguage == "rw") lv = lv3_text_rw

                                    break;
                                case 4:

                                    if(selectedLanguage == "en") lv = lv4_text
                                    else if(selectedLanguage == "rw") lv = lv4_text_rw

                                    break;
                                case 5:

                                    if(selectedLanguage == "en") lv = lv5_text
                                    else if(selectedLanguage == "rw") lv = lv5_text_rw

                                    break;
                                case 6:

                                    if(selectedLanguage == "en") lv = lv6_text
                                    else if(selectedLanguage == "rw") lv = lv6_text_rw

                                    break;
                                }

                                inputArea.focus = true
                                inputArea.text = ""

                                currentTime = 0
                                currentTime_str = "00:00"

                                lv_progress = 0

                                timer.start()

                                start()
                            }
                        }
                    }
                }
            }

            Rectangle{
                id: rectLine1
                width: parent.width-10; height: 1

                color: "black"
                opacity: 0.2

                anchors.top: rectLevelchoice.bottom
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle{
                id: rectLine2
                width: parent.width-10; height: 1

                color: "white"
                opacity: 0.1

                anchors.top: rectLine1.bottom
                anchors.topMargin: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text{
                id: textTime
                text: "Time"

                color: "white"
                scale: 1.5

                anchors.top: rectLine2.bottom
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
            }

            Item{
                id: rectTimeNum
                width: parent.width; height: 27

                anchors.top: textTime.bottom
                anchors.topMargin: 40

                Text{
                    id: textTimeNum

                    text: currentTime_str

                    color: "white"
                    scale: 3

                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 60
                }
            }

            Text{
                id: textProgress

                text: "Progress"

                color: "white"
                scale: 1.5

                anchors.top: rectTimeNum.bottom
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
            }

            Item{
                id: rectProgressNum
                width: parent.width; height: 27

                anchors.top: textProgress.bottom
                anchors.topMargin: 35

                Text{
                    id: textProgressNum

                    text: lv_progress >= 100 ? 100 : lv_progress

                    color: "white"
                    scale: 3

                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30
                    anchors.right: parent.right
                    anchors.rightMargin: 60

                    onTextChanged: {
                        if(lv_progress == 100){
                            inputArea.enabled = false
                            resultEffect()
                            rectMenu3.state = "resultState"
                        }
                    }
                }

                Text{
                    id: textProgressPercent

                    text: "%"

                    color: "#80FFFFFF"
                    scale: 1.5

                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                }
            }

        } // Rectangle(row 1, column 2)


    } // Rectangle ( id : rectRow1 )



    Image{
        id: imgKeyboard
        width: 830; height: 308

        anchors.left: rectRow1.left
        anchors.top: rectRow1.bottom
        anchors.topMargin: 25
        anchors.right: rectRow1.right

        states: [
            State{
                name : "Instruction_NowDisappear"
            }
        ]

        transitions: [
            Transition{
                to: "Instruction_NowDisappear"
                SequentialAnimation{
                    PropertyAction{
                        target: rectMenu3
                        property: "enabled"
                        value: "false"
                    }

                    PropertyAction{
                        target: imgKeyboard
                        property: "source"
                        value: "../img/keyboardInstruction.png"
                    }

                    PropertyAnimation{
                        duration: 500
                    }

                    PropertyAction{
                        target: rectMenu3
                        property: "enabled"
                        value: "true"
                    }

                    PropertyAction{
                        target: itemKeypress_Continue
                        property: "focus"
                        value: "true"
                    }
                }
            }
        ]
    }

    BackButton{
        id: btnBack

        anchors.right: imgKeyboard.right
        anchors.bottom: imgKeyboard.bottom
        anchors.bottomMargin: 32

        onButtonClicked: {
            if(rectMenu3.state == "resultState"){
                resultEffect()
                rectMenu3.state = "normalState"
            }

            btnBack_Instruction()
        }
    }

    HideButton{
        id: btnHide

        anchors.right: btnBack.left
        anchors.rightMargin: 5
        anchors.bottom: btnBack.bottom

        onButtonClicked: {
            if(hideOn) hideOn = false
            else hideOn = true

            if(hideOn){
                strState = "SHOW"
                imgKeyboard.source = "../img/keyboardSubstitution.png"
            }else{
                strState = "HIDE"
                imgKeyboard.source = "../img/word/w-level-" + lv_currentindex + "-" + keyboard_char + ".png"
            }

        }
    }
}
