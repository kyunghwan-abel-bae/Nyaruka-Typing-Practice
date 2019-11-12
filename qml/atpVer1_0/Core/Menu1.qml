/**

  @QML 파일 이름 : Menu1.qml
  @작 성 일 : 2013-07-12
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  이 레벨은 키보드 위에서의 손가락 위치를 익히게 한다.

  @QML FileName : Menu1.qml
  @Date : 2013-07-12
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  This level helps learners to get used to finger position on the Keyboard.

*/

import QtQuick 2.0

import "Core_Part"

Rectangle {
    id: rectMenu1

    width: 830; height: 550
    color: "transparent"

    property bool trigger: false
    property bool trigger_state: false
    property bool hideOn : false

    // trans variables to result
    property int numMistakes : 0
    property int stars : 0

    property int lv_currentLevel

    property int lv_progress: 0

    property int lv_index // coming number of letter
    property int lv_index_coming1: 0
    property int lv_index_coming2: 0

    property int lv_review: 0

    property int currentTime

    property string currentTime_str: "00:00"
    property string strZero1
    property string strZero2

    property string lv_text
    property string lv_textcoming1
    property string lv_textcoming2
    property string lv_key

    // for statistics
    property variant allCharacters : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    property variant lv : []
    property variant lv1: [65, 83, 68, 70, 74, 75, 76, 59] // asdfjkl;
    property variant lv2: [81, 87, 69, 82] // qwer
    property variant lv3: [84, 89, 71, 72, 66, 78] // tyghbn
    property variant lv4: [85, 73, 79, 80] // uiop
    property variant lv5: [90, 88, 67, 86] // zxcv
    property variant lv6: [77, 44, 46] // m,.
    property variant lv7: [65, 83, 68, 70, 74, 75, 76, 59, 81, 87, 69, 82, 84, 89, 71, 72, 66, 78,
                            85, 73, 79, 80, 90, 88, 67, 86, 77, 44, 46]

    // 위의 것이 아스키 코드 대문자 값.
    // 아스키 코드
    // ; : 59 // , : 44 // . : 46

    property Item itemDestroy

    signal btnBack_Instruction() // button for Going MainMenu
    signal start()
    signal startAfterAnimation()

    signal errorEffect()
    signal resultEffect()

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
                        target: rectLetter
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: rectProgresss
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
                        target: rectLetter
                        property: "visible"
                        value: true
                    }
                    PropertyAction{
                        target: rectProgresss
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
                    target: rectMenu1
                    property: "trigger_state"
                    value: true
                }


            }

        }
    ]

    Component.onCompleted: {
        SndEffect.setSourcePath("./qml/atpVer1_0/sounds/correct.wav")
        SndEffect_Error.setSourcePath("./qml/atpVer1_0/sounds/incorrect.wav")

        hideOn = false

        lv_currentLevel = rectMenu1.parent.positionLevel

        switch(lv_currentLevel){
        case 1:
            lv = lv1
            break;
        case 2:
            lv = lv2
            break;
        case 3:
            lv = lv3
            break;
        case 4:
            lv = lv4
            break;
        case 5:
            lv = lv5
            break;
        case 6:
            lv = lv6
            break;
        }

        lv_review = 0

        timer.start()

        start()
    }

    onBtnBack_Instruction: {
        rectMenu1.parent.backMenus = "./Core/Instruction/Inst_Menu1.qml"
    }

    onStart: {
        var arrSize = lv.length;

        if(lv_review == 0){ // for checking this is first start() or not
            hideOn = false

           var num1 = Math.ceil(Math.random()*100) % arrSize;
           var num2 = Math.ceil(Math.random()*100) % arrSize;
           var num3 = Math.ceil(Math.random()*100) % arrSize;

           lv_index = num1;
           lv_index_coming1 = num2;
           lv_index_coming2 = num3;

        }else{
            console.log("lv_index_coming1 : " + lv_index_coming1)
            console.log("lv_index_coming2 : " + lv_index_coming2)

            var num = Math.ceil(Math.random()*100) % arrSize;

            lv_index = lv_index_coming1;
            lv_index_coming1 = lv_index_coming2;
            lv_index_coming2 = num;
        }

        lv_text = rectMenu1.numTotext(lv_index);
        lv_textcoming1 = rectMenu1.numTotext(lv_index_coming1);
        lv_textcoming2 = rectMenu1.numTotext(lv_index_coming2);

        console.log("lv_review : " + lv_review)

        if(lv_text == ";"){
            lv_key = "semicolon"
        }else if(lv_text == ","){
            lv_key = "comma"
        }else if(lv_text == "."){
            lv_key = "period"
        }else{
            lv_key = lv_text.toLowerCase()
        }

        if(hideOn){
            imgKeyboard.source = "../img/keyboardSubstitution.png"
        }else if(itemResult.visible){
            imgKeyboard.source = "../img/keyboardSubstitution.png"
        }else{
            imgKeyboard.source = "../img/word/w-level-" + lv_currentLevel + "-" + lv_key + ".png"
        }
    }

    onStartAfterAnimation: {
        lv_review++

        if(lv_review == 15){
            lv = rectMenu1.arrMerge()
        }else if(lv_review == 30 && !hideOn){
            //btnHide.color = "#80FF0000"
            //blink 효과
        }

        start()
    }

    onTriggerChanged: {
        if(trigger == true){
            trigger = false

            rectLetter.state = ""
            startAfterAnimation()
        }
    }

    onTrigger_stateChanged: {
        if(trigger_state){
            trigger_state = false

            itemDestroy.destroy()// destroy

            console.log("trigger_state is emitted")
            numMistakes = 0
            lv_progress = 0
            lv_review = 0

            txtMain.visible = true

            timer.start()
            start()

            itemKeypress.focus = true
        }
    }

    function numTotext(index){
        var num = lv[index];
        var text = String.fromCharCode(num);

        // 참고 : 문자를 아스키로
        // var test = text.charCodeAt()
        return text;
    }

    function arrMerge(){ // for reviewing previous levels
        var nowLevel = lv_currentLevel
        var arr = lv1;
        var now = arr

        // 복습을 위해 이전 단계의 키들을 설정한다.
        switch(nowLevel){
        case 2:
            now = lv2
            now = now.concat(arr)
            break;
        case 3:
            arr = arr.concat(lv2)
            now = lv3
            now = now.concat(arr)
            break;
        case 4:
            arr = arr.concat(lv2)
            arr = arr.concat(lv3)
            now = lv4
            now = now.concat(arr)
            break;
        case 5:
            arr = arr.concat(lv2)
            arr = arr.concat(lv3)
            arr = arr.concat(lv4)
            now = lv5
            now = now.concat(arr)
            break;
        case 6:
            arr = arr.concat(lv2)
            arr = arr.concat(lv3)
            arr = arr.concat(lv4)
            arr = arr.concat(lv5)
            now = lv6
            now = now.concat(arr)
            break;
        }
        return now;
    }

    function statistics(ch){
        var num = ch.charCodeAt();

        console.log("num : " + num);

        var arr = new Array(29);

        arr = allCharacters;

        if(num == 59){
            arr[26] += 1;
        }else if(num == 44){
            arr[27] += 1;
        }else if(num == 46){
            arr[28] += 1;
        }else{ //
            arr[num-69] += 1;
        }

        allCharacters = arr;

        numMistakes++;
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

        FontLoader{
            id: fontRegular
            source: "../fonts/SourceSansPro-Regular.otf"
        }
    }

    Item{
        id: itemKeypress

        focus: true

        anchors.fill: parent

        Keys.onEscapePressed: {
            btnBack_Instruction()
        }

        Keys.onPressed: {
            console.log("key Pressed")

            if(event.key){
                if(event.key == lv[lv_index]){
                    SndEffect.playSnd()

                    lv_progress += 5
                    rectLetter.state = "moveTotxtMain"
                }else{
                    SndEffect_Error.playSnd()
                    statistics(lv_text)
                    errorEffect()
                    console.log("bad input :" + event.key)
                }
            }
        }
    } // Item

    Item{
        id: items

        Timer{
            id: timer
            interval: 1000; running: false; repeat: true
            onTriggered: {
                currentTime = currentTime + interval
                if(currentTime >= 3600000){
                    console.log("1 hour is passed. Modal Window!")
                    timer.running = false
                }

                strZero1 = Math.floor(currentTime/60000) < 10 ? "0" : ""
                strZero2 = Math.floor((currentTime%60000)/1000) < 10 ? "0" : ""
                currentTime_str = strZero1 + Math.floor(currentTime/60000) + ":" + strZero2 + Math.floor((currentTime%60000)/1000)
            }
        }
    }


    Item{
        id: rectRow1
        width: 830; height: 250

        Rectangle{ // row 1, column 1
            id: rectRow1Column1
            width: 665; height: parent.height
            radius: 10
            color: "#80FFFFFF"

            anchors.left: parent.left


            Item{
                id: rectLetter
                width: parent.width; height: parent.height

                states: [
                    State{
                        name: "moveTotxtMain"

                        PropertyChanges{
                            target: txtMain; visible: false
                        }

                        AnchorChanges{
                            target: txtComing1; anchors.horizontalCenter: rectLetter.horizontalCenter
                        }

                        PropertyChanges{
                            target: txtComing1; color: "#333333"; font.pixelSize: 200; y: 0
                        }
                        PropertyChanges{
                            target: txtComing2; color: "#888888"; font.pixelSize: 100; x: 480; y: 130
                        }

                    }
                ]

                transitions: [
                    Transition{
                        to: "moveTotxtMain"

                        SequentialAnimation{

                            ParallelAnimation{
                                ParallelAnimation{
                                    NumberAnimation{
                                        target: txtComing1
                                        properties: "font.pixelSize, y";
                                        duration: 100
                                    }

                                    AnchorAnimation{
                                        duration: 100
                                    }
                                }

                                ParallelAnimation{
                                    NumberAnimation{
                                        target: txtMain
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
                                    duration: 50
                                }

                                ColorAnimation{
                                    target: txtComing2
                                    duration: 50
                                }
                            }

                            PropertyAction{
                                target:rectMenu1; property:"trigger"; value: "true"
                            }
                        }

                    }
                ]

                Text{
                    id: txtMain

                    y: 0

                    anchors.horizontalCenter: parent.horizontalCenter

                    font.pixelSize: 200
                    font.family: fontExtraLight.name
                    color: "#333333"

                    text: lv_text
                }

                Text{
                    id: txtComing1
                    x: 480; y: 130

                    font.pixelSize: 100
                    font.family: fontExtraLight.name
                    color: "#888888"

                    text: lv_textcoming1
                }

                Text{
                    id: txtComing2
                    x: 600; y: 170

                    font.pixelSize: 70
                    font.family: fontExtraLight.name
                    color: "#AAAAAA"

                    text: lv_textcoming2
                }
            } // Rectangle(row 1, column 1)

            Item{
                id: itemResult

                width: parent.width - 50; height: parent.height - 30

                visible: false

                anchors.centerIn: parent

                onVisibleChanged: { // 결과창이 등장할 때
                    if(itemResult.visible){
                        itemKeypress.focus = false

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
                                    charArr[index] = String.fromCharCode(parseInt(i) + 69)
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
                                                                        "lv" : lv_currentLevel,
                                                                   })
                            itemDestroy = ret2
                        }else if(numMistakes > 10){
                            stars = 3
                            var score3Component = Qt.createComponent("./Result/Score2_4.qml")
                            var ret3 = score3Component.createObject(itemResultRow2, {
                                                                        "numMistakes" : numMistakes,
                                                                        "stars" : stars,
                                                                        "charMistakes" : charArr,
                                                                        "lv" : lv_currentLevel
                                                                   })
                            itemDestroy = ret3
                        }else if(numMistakes > 5){
                            stars = 4
                            var score4Component = Qt.createComponent("./Result/Score2_4.qml")
                            var ret4 = score4Component.createObject(itemResultRow2, {
                                                                        "numMistakes" : numMistakes,
                                                                        "stars" : stars,
                                                                        "charMistakes" : charArr,
                                                                        "lv" : lv_currentLevel,
                                                                        "isMenu3Check" : 0
                                                                   })
                            itemDestroy = ret4
                        }else if(numMistakes >= 0){
                            stars = 5
                            var score5Component = Qt.createComponent("./Result/Score5.qml")
                            var ret5 = score5Component.createObject(itemResultRow2, {
                                                                       "numMistakes" : numMistakes,
                                                                        "isMenu3Check" : 0,
                                                                        "lv" : lv_currentLevel
                                                                   })
                            itemDestroy = ret5
                        }

                        imgKeyboard.source = "../img/keyboardSubstitution.png"
                    }
                }

                Item{
                    id: itemResultRow1

                    width: parent.width; height: 35

                    anchors.top: parent.top

                    Text{
                        id: textTitle

                        font.pixelSize: 23
                        color: "yellow"

                        anchors.left: parent.left

                        text: "Level " + lv_currentLevel + " Complete!"
                    }

                    Row{
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        spacing: 5
                        Repeater{
                            id: rep
                            model: stars
                            delegate: Image { scale: 0.7 ;source: "../img/star.png" }
                        }
                    }

                    Rectangle{
                        id: rectResultLine1
                        anchors.top: textTitle.bottom
                        anchors.topMargin: 4

                        width: parent.width; height: 1
                        color: "black"
                        opacity: 0.2
                    }

                    Rectangle{
                        id: rectResultLine2
                        anchors.top: rectResultLine1.bottom
                        anchors.topMargin: 1

                        width: parent.width; height: 1
                        color: "white"
                        opacity: 0.1
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

                            hideOn = false
                            btnHide.strState = "HIDE"

                            resultEffect()
                            rectMenu1.state = "normalState"
                        }else{
                            console.log("what?? Does it make sense?!")
                        }
                    }

                    onIsNextButtonClickedChanged: {
                        if(isNextButtonClicked){
                            isNextButtonClicked = false

                            lv_currentLevel++

                            switch(lv_currentLevel){
                            case 2:
                                lv = lv2
                                break;
                            case 3:
                                lv = lv3
                                break;
                            case 4:
                                lv = lv4
                                break;
                            case 5:
                                lv = lv5
                                break;
                            case 6:
                                lv = lv6
                                break;
                            }

                            lv_review = 0

                            currentTime = 0
                            currentTime_str = "00:00"

                            hideOn = false
                            btnHide.strState = "HIDE"

                            resultEffect()
                            rectMenu1.state = "normalState"
                        }
                    }

                    onIsGameButtonClickedChanged: {
                        if(isGameButtonClicked){
                            isGameButtonClicked = false
                        }
                    }
                }
            }
        }

        Rectangle{
            id: rectProgresss
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
                    anchors.left: parent.left

                    scale: 1.7
                    color: lv_currentLevel == 1 ? "#80555555" : "#80FFFFFF"

                    text: "<"

                    MouseArea{
                        id: mrLeft
                        anchors.fill: parent
                        hoverEnabled: lv_currentLevel == 1 ? false : true

                        onEntered: {
                            parent.scale = parent.scale + 0.5
                        }
                        onExited: {
                            parent.scale = parent.scale - 0.5
                        }

                        onClicked: {

                            if(lv_currentLevel != 1){ // don't response when user click left button more

                                lv_review = 0
                                imgKeyboard.opacity = 1
                                imgKeyboard.state = ""

                                lv_currentLevel--

                                switch(lv_currentLevel){
                                case 1:
                                    lv = lv1
                                    break;
                                case 2:
                                    lv = lv2
                                    break;
                                case 3:
                                    lv = lv3
                                    break;
                                case 4:
                                    lv = lv4
                                    break;
                                case 5:
                                    lv = lv5
                                    break;
                                }

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

                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter

                    scale: 1.7
                    color: "#80FFFFFF"

                    text: "Level " + lv_currentLevel
                }

                Text{
                    id: txtBtnright
                    anchors.right: parent.right

                    scale: 1.7
                    color: lv_currentLevel == 6 ? "#80555555" : "#80FFFFFF"

                    text: ">"

                    MouseArea{
                        id: mrRight
                        anchors.fill: parent
                        hoverEnabled: lv_currentLevel == 6 ? false : true

                        onEntered: {
                            parent.scale = parent.scale + 0.5
                            parent.style = Text.Outline
                            parent.styleColor = "#805555CC"

                        }

                        onExited: {
                            parent.scale = parent.scale - 0.5
                            parent.style = Text.Normal
                        }

                        onClicked: {

                            if(lv_currentLevel != 6){ // don't response when user click right button more

                                lv_review = 0
                                imgKeyboard.opacity = 1
                                imgKeyboard.state = ""

                                lv_currentLevel++

                                switch(lv_currentLevel){
                                case 2:
                                    lv = lv2
                                    break;
                                case 3:
                                    lv = lv3
                                    break;
                                case 4:
                                    lv = lv4
                                    break;
                                case 5:
                                    lv = lv5
                                    break;
                                case 6:
                                    lv = lv6
                                    break;
                                }

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
                anchors.top: rectLevelchoice.bottom
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter

                width: parent.width-10; height: 1
                color: "black"
                opacity: 0.2
            }

            Rectangle{
                id: rectLine2
                anchors.top: rectLine1.bottom
                anchors.topMargin: 1
                anchors.horizontalCenter: parent.horizontalCenter

                width: parent.width-10; height: 1
                color: "white"
                opacity: 0.1
            }

            Text{
                id: textTime
                anchors.top: rectLine2.bottom
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                color: "white"

                scale: 1.5
                text: "Time"
            }

            Item{
                id: rectTimeNum
                width: parent.width
                height: 27
                anchors.top: textTime.bottom
                anchors.topMargin: 40

                Text{
                    id: textTimeNum
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 60
                    color: "white"

                    scale: 3
                    text: currentTime_str
                }
            }

            Text{
                id: textProgress
                anchors.top: rectTimeNum.bottom
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                color: "white"

                scale: 1.5
                text: "Progress"
            }

            Item{
                id: rectProgressNum
                width: parent.width
                height: 27
                anchors.top: textProgress.bottom
                anchors.topMargin: 35

                Text{
                    id: textProgressNum
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 30
                    anchors.right: parent.right
                    anchors.rightMargin: 60
                    color: "white"

                    scale: 3
                    text: lv_progress >= 100 ? 100 : lv_progress

                    onTextChanged: {
                        if(lv_progress == 100){
                            resultEffect()
                            rectMenu1.state = "resultState"
                        }
                    }
                }

                Text{
                    id: textProgressPercent
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    color: "#80FFFFFF"

                    scale: 1.5
                    text: "%"
                }
            }

        } // Rectangle ( row 1, column2 )

    }

    Image{
        id: imgKeyboard
        anchors.left: rectRow1.left
        anchors.top: rectRow1.bottom
        anchors.topMargin: 25
        anchors.right: rectRow1.right

        width: 830; height: 308
    }

    BackButton{
        id: btnBack
        anchors.right: imgKeyboard.right
        anchors.bottom: imgKeyboard.bottom
        anchors.bottomMargin: 32
        onButtonClicked: {
            if(rectMenu1.state == "resultState"){
                resultEffect()
                rectMenu1.states = "normalState"
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
                imgKeyboard.source = "../img/word/w-level-" + lv_currentLevel + "-" + lv_key + ".png"
            }

        }
    }
}
