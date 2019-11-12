import QtQuick 2.0
import QtGraphicalEffects 1.0

import "Core_Part"
//import FileIO 1.0

/*



  signal btnBack_Instruction()

  체크 어게


  */

Item {
    id: itemMenu5

    width: 830; height: 550

    property bool showOn : false

    property int accuracy: 0

    property int currentSpeed: 0
    property int highestSpeed: 0
    property int currentTime_in_Speed: 0

    property int currentTime: 0
    property string currentTime_str: "00:00"
    property string strZero1
    property string strZero2

    property int rectFocus_Y: itemSentence1.y

    property int statements_count: 0
    property int c_letters_count: 0
    property int totalStatements

    property int total_textSize: 0 // for estimating accuracy
    property int total_c_letters_count: 0

    property string menu5_blueText: ""
    property string menu5_redText: ""

    property string menu5_content

    property string menu5_text
    property string menu5_text1//: "Once upon a time..."
    property string menu5_text2//: "a dog managed to steal a large steak from a butcher's shop,"
    property string menu5_text3//: "and ran into the woods to eat it in peace."

    property variant inputSentences : [
        inputSentence1,
        inputSentence2,
        inputSentence3
    ]

    property TextInput inputArea

    signal backgroundEffect()
    signal btnBack_Instruction()
    signal resultEffect()
    signal setRedText()
    signal start() // Component.onCompleted()로 텍스트를 불러와야 할 듯
    signal showEffect()

    states: [
        State{
            name: "resultState"
        }
    ]

    transitions: [
        Transition{
            to: "resultState"

            SequentialAnimation{
                ParallelAnimation{
                    PropertyAction{
                        target: rectRow2
                        property: "color"
                        value: "transparent"
                    }
                    PropertyAction{
                        target: rectRow2
                        property: "border.width"
                        value: 2
                    }
                    PropertyAction{
                        target: rectRow2
                        property: "border.color"
                        value: "white"
                    }
                    PropertyAction{
                        target: itemSentence1
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: itemSentence2
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: itemSentence3
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: rectFocus
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: rectRow1
                        property: "color"
                        value: "transparent"
                    }

                    PropertyAction{
                        target: textLabel_time
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textTime
                        property: "color"
                        value: "yellow"
                    }
                    PropertyAction{
                        target: textLabel_progress
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textProgress
                        property: "color"
                        value: "yellow"
                    }
                    PropertyAction{
                        target: textLabel_progresspercent
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textLabel_accuracy
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textAccuracy
                        property: "color"
                        value: "yellow"
                    }
                    PropertyAction{
                        target: textLabel_accuracypercent
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textLabel_speed
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textSpeed
                        property: "color"
                        value: "yellow"
                    }
                    PropertyAction{
                        target: textLabel_speeddimension
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textLabel_max
                        property: "font.bold"
                        value: true
                    }
                    PropertyAction{
                        target: textMax
                        property: "color"
                        value: "yellow"
                    }
                    PropertyAction{
                        target: textLabel_maxdimension
                        property: "font.bold"
                        value: true
                    }


                    // now appear something

                    PropertyAction{
                        target: itemResult
                        property: "visible"
                        value: true
                    }
                }
            }

        }
    ]


    Component.onCompleted: {

       FileIO.setSource("/Users/Abel/Documents/Projects/Nyaruka Typing Practice/build-atpVer1_0-Desktop_Qt_5_4_1_clang_64bit-Release/atpVer1_0.app/Contents/Resources/qml/atpVer1_0/txts/" + itemMenu5.parent.longField + "/" + itemMenu5.parent.longTitle +".txt")
        // edit by KH
        //FileIO.setSource("./qml/atpVer1_0/txts/" + itemMenu5.parent.longField + "/" + itemMenu5.parent.longTitle +".txt")

        menu5_content = FileIO.read()
        totalStatements = FileIO.totalStatement

        start()

        menu5_text = menu5_text1
        inputArea = inputSentence1

        timer.start()
        timer.running = true

        inputSentence1.focus = true
    }

    onBtnBack_Instruction: {
        itemMenu5.parent.backMenus = "./Core/Instruction/Inst_Menu5.qml"
    }

    onEnabledChanged: {
        if(!timer.running) timer.start()
    }

    onStart: {

        var content = []

        for(var i=0;i<3;i++){
            inputSentences[i].effectPoint = false
            inputSentences[i].endPoint = false

            content[i] = menu5_content.substring(0, menu5_content.indexOf("*"));
            menu5_content = menu5_content.substring(menu5_content.indexOf("*")+1, menu5_content.length)
        }

        for(var k=0 in content){
            if(content[k].indexOf("#") != -1){
                content[k] = content[k].substring(0, content[k].indexOf("#"))
                inputSentences[k].effectPoint = true
            }

            if(content[k].indexOf("&") != -1){
                content[k] = content[k].substring(0, content[k].indexOf("&"))
                inputSentences[k].endPoint = true
            }
        }

        for(var a=0 in inputSentences){
            inputSentences[a].maximumLength = content[a].length
            inputSentences[a].text = ""
        }

        menu5_text1 = content[0]
        menu5_text = menu5_text1
        inputArea = inputSentence1

        menu5_text2 = content[1]
        menu5_text3 = content[2]

        rectSentence2.color = "transparent"
        rectSentence3.color = "transparent"
    }

    onSetRedText: {
        var inputAreaSize = inputArea.text.length;
        var textSize = menu5_text.length;

        if(inputAreaSize <= textSize){

            var text_cmp = menu5_text;
            var text_new = inputArea.text;

            /*
            if(text_new.substring(0, inputAreaSize) == text_cmp.substring(0, inputAreaSize)){
                menu5_blueText = '<font color="blue">' + text_cmp.substring(0, inputAreaSize) + '</font>';
                menu5_redText = ""
                c_letters_count = inputAreaSize
            }else{
                menu5_redText = '<font color="red">' + text_cmp.substring(menu5_blueText.length - 26, inputAreaSize) + '</font>';
            }
            */

            if(text_new.substring(0, inputArea.cursorPosition) == text_cmp.substring(0,inputArea.cursorPosition)){
                menu5_blueText = '<font color="blue">' + text_cmp.substring(0, inputArea.cursorPosition) + '</font>';
                menu5_redText = ""
                c_letters_count = inputAreaSize
            }else{
                menu5_redText = '<font color="red">' + text_cmp.substring(menu5_blueText.length - 26, inputAreaSize) + '</font>';
            }

            if(inputSentence1.focus == true){
                menu5_text1 = menu5_blueText + menu5_redText + text_cmp.substring(inputAreaSize, textSize);
            }else if(inputSentence2.focus == true){
                menu5_text2 = menu5_blueText + menu5_redText + text_cmp.substring(inputAreaSize, textSize);
            }else if(inputSentence3.focus == true){
                menu5_text3 = menu5_blueText + menu5_redText + text_cmp.substring(inputAreaSize, textSize);
            }

            accuracy = Math.round((total_c_letters_count + c_letters_count) / (total_textSize + inputArea.text.length) * 100);
        }
    }


    /*

      Interface

    */

    Item{
        anchors.fill: parent

        Item{
            id: itemFont

            FontLoader{
                id: fontNanum
                source: "../fonts/NanumMyeongjo.ttf"
            }
        }

        Timer{
            id: timer
            interval: 1000; running: false; repeat: true
            onTriggered: {
                currentTime = currentTime + interval
                if(currentTime == 3600000){
                    timer.stop()
                }

                strZero1 = Math.floor(currentTime/60000) < 10 ? "0" : ""
                strZero2 = Math.floor((currentTime%60000)/1000) < 10 ? "0" : ""
                currentTime_str = strZero1 + Math.floor(currentTime/60000) + ":" + strZero2 + Math.floor((currentTime%60000)/1000)
            }
        }

        Timer{
            id: timer_in_speed
            interval: 500; running: false; repeat: true
            onTriggered: {
                currentTime_in_Speed = currentTime_in_Speed + 500
                currentSpeed = (60000 * c_letters_count)/currentTime_in_Speed
            }
        }
    }

    Rectangle{
        id: rectRow1
        width: parent.width; height: 65

        color: "#80000000"
        radius: 10

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 20

        Item{
            id: rectRow1Column1
            width: 150; height: parent.height

            Text{
                id: textLabel_time

                text: "Time"

                color: "white"
                scale: 1

                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
            }

            Text{
                id: textTime

                text: currentTime_str

                color: "white"
                scale: 2.5

                anchors.top: textLabel_time.bottom
                anchors.topMargin: 15
                anchors.left: textLabel_time.left
                anchors.leftMargin: 30
            }

        }

        Item{
            id: rectRow1Column2
            width: 115; height: parent.height

            anchors.left: rectRow1Column1.right

            Text{
                id: textLabel_progress

                text: "Progress"

                color: "white"
                scale: 1

                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Text{
                id: textProgress

                text: statements_count == 0 ? 0 : Math.floor(statements_count / totalStatements * 100)

                color: "white"
                scale: 2.5

                anchors.top: textLabel_progress.bottom
                anchors.topMargin: 15
                anchors.left: textLabel_progress.left
                anchors.leftMargin: 13
            }

            Text{
                id: textLabel_progresspercent

                text: "%"

                color: "white"
                scale: 1

                anchors.left: textProgress.right
                anchors.leftMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
            }
        }

        Item{
            id: rectRow1Column3
            width: 110; height: parent.height

            anchors.left: rectRow1Column2.right

            Text{
                id: textLabel_accuracy

                text: "Accuracy"

                color: "white"
                scale: 1

                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Text{
                id: textAccuracy

                text: accuracy

                color: "white"
                scale: 2.5

                anchors.top: textLabel_accuracy.bottom
                anchors.topMargin: 15
                anchors.left: textLabel_accuracy.left
                anchors.leftMargin: 13
            }

            Text{
                id: textLabel_accuracypercent

                text: "%"

                color: "white"
                scale: 1

                anchors.left: textAccuracy.right
                anchors.leftMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
            }
        }

        Item{
            id: rectRow1Column4
            width: 160; height: parent.height

            anchors.left: rectRow1Column3.right

            Text{
                id: textLabel_speed

                text: "Speed"

                color: "white"
                scale: 1

                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Text{
                id: textSpeed

                text: currentSpeed > 999 ? 999 : currentSpeed

                color: "white"
                scale: 2.5

                anchors.top: textLabel_speed.bottom
                anchors.topMargin: 15
                anchors.left: textLabel_speed.left
                anchors.leftMargin: 13
            }

            Text{
                id: textLabel_speeddimension

                text: "letters/min"

                color: "white"
                scale: 1

                anchors.left: textSpeed.right
                anchors.leftMargin: 30
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
            }
        }

        Item{
            id: rectRow1Column5
            width: 200; height: parent.height

            anchors.right: parent.right
            anchors.rightMargin: 20

            Text{
                id: textLabel_max

                text: "Max"

                color: "white"
                scale: 1

                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.right: parent.right
            }

            Text{
                id: textMax

                text: highestSpeed

                color: "#F7D93D"
                font.bold: true
                font.pixelSize: 50

                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.right: textLabel_maxdimension.left
                anchors.rightMargin: 20                
            }

            Text{
                id: textLabel_maxdimension

                text: "letters/min"

                color: "white"
                scale: 1

                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 13
            }
        }
    }

    Rectangle{
        id: rectRow2
        width: parent.width; height: 370

        color: "#B2FFFFFF"
        radius: 10

        anchors.left: parent.left
        anchors.top: rectRow1.bottom
        anchors.topMargin: 20

        Item{
            id: itemSentence1
            width: parent.width; height: 75
            y: 70; z: 100

            Text{
                id: textSentence1

                text: menu5_text1

                font.family: fontNanum.name
                font.letterSpacing: 1
                font.pixelSize: inputSentence1.maximumLength > 70 ? 21 : 23

                anchors.left: parent.left
                anchors.leftMargin: 38
                anchors.top: parent.top
                anchors.topMargin: 10
            }

            Rectangle{
                id: rectSentence1
                width: textSentence1.width + 10; height: 30
                color: "#80999999"

                anchors.top: textSentence1.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 33

                TextInput{
                    id: inputSentence1

                    text: ""

                    font.family: fontNanum.name
                    font.letterSpacing: 1
                    font.pixelSize: inputSentence1.maximumLength > 70 ? 21 : 23

                    focus: false

                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    property bool effectPoint : false
                    property bool endPoint : false

                    onFocusChanged: {
                        if(inputSentence1.focus == true){
                            rectFocus_Y = itemSentence1.y

                            rectSentence1.color = "#80999999"
                        }else{
                            if(menu5_redText.length == 0 && inputSentence1.length == inputSentence1.maximumLength){
                                rectSentence1.color = "#80005500"
                            }else{
                                rectSentence1.color = "#80550000"
                            }
                        }
                    }

                    Keys.onEscapePressed: {
                        btnBack_Instruction()
                    }

                    Keys.onPressed: {
                        if(event.key == 16777220){ // enter
                            if(!endPoint){
                                menu5_blueText = ""
                                menu5_redText = ""

                                currentSpeed = (60000 * c_letters_count)/currentTime_in_Speed //
                                if(highestSpeed < currentSpeed){
                                    highestSpeed = currentSpeed
                                }

                                total_textSize += menu5_text.length
                                total_c_letters_count += c_letters_count

                                c_letters_count = 0

                                inputSentence1.focus = false
                                inputSentence2.focus = true

                                accuracy = Math.round((total_c_letters_count + c_letters_count) / (total_textSize + inputArea.text.length) * 100);

                                statements_count++

                                timer_in_speed.stop()

                                if(effectPoint)
                                    backgroundEffect()

                            }else if(endPoint){
                                resultEffect()
                                itemMenu5.state = "resultState"
                            }
                        }
                    }

                    Keys.onLeftPressed: {
                        console.log("left")
                    }

                    onTextChanged: {
                        if(c_letters_count == 1) {
                            currentTime_in_Speed = 0
                            timer_in_speed.restart()
                        }
                        setRedText()
                    }

                    MouseArea{ // disable mouse-click
                        anchors.fill: parent
                    }
                }
            }
        }

        Item{
            id: itemSentence2
            width: parent.width; height: 75
            y: 160; z: 100

            Text{
                id: textSentence2

                text: menu5_text2

                font.family: fontNanum.name
                font.letterSpacing: 1
                font.pixelSize: inputSentence2.maximumLength > 70 ? 21 : 23

                anchors.left: parent.left
                anchors.leftMargin: 38
                anchors.top: parent.top
                anchors.topMargin: 10
            }

            Rectangle{
                id: rectSentence2
                width: textSentence2.width + 10; height: 30
                color: "transparent"

                anchors.top: textSentence2.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 33

                TextInput{
                    id: inputSentence2

                    text: ""

                    font.family: fontNanum.name
                    font.letterSpacing: 1
                    font.pixelSize: inputSentence2.maximumLength > 70 ? 21 : 23

                    focus: false

                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    property bool effectPoint : false
                    property bool endPoint : false

                    onFocusChanged: {
                        if(inputSentence2.focus == true){
                            inputArea = inputSentence2
                            menu5_text = menu5_text2

                            rectFocus_Y = itemSentence2.y

                            rectSentence2.color = "#80999999"
                        }else{
                            if(menu5_redText.length == 0 && inputSentence2.length == inputSentence2.maximumLength){
                                rectSentence2.color = "#80005500"
                            }else{
                                rectSentence2.color = "#80550000"
                            }
                        }
                    }

                    Keys.onEscapePressed: {
                        btnBack_Instruction()
                    }

                    Keys.onPressed: {
                        if(event.key == 16777220){ // enter
                            if(!endPoint){

                                menu5_blueText = ""
                                menu5_redText = ""

                                currentSpeed = (60000 * c_letters_count)/currentTime_in_Speed //
                                if(highestSpeed < currentSpeed){
                                    highestSpeed = currentSpeed
                                }

                                total_textSize += menu5_text.length
                                total_c_letters_count += c_letters_count

                                c_letters_count = 0

                                inputSentence2.focus = false
                                inputSentence3.focus = true

                                statements_count++

                                accuracy = Math.round((total_c_letters_count + c_letters_count) / (total_textSize + inputArea.text.length) * 100);

                                timer_in_speed.stop()

                                if(effectPoint)
                                    backgroundEffect()

                            }else if(endPoint){
                                resultEffect()
                                itemMenu5.state = "resultState"
                            }
                        }
                    }

                    Keys.onLeftPressed: {
                        console.log("left")
                    }

                    onTextChanged: {
                        if(c_letters_count == 1) {
                            currentTime_in_Speed = 0
                            timer_in_speed.restart()
                        }

                        setRedText()
                    }

                    MouseArea{
                        anchors.fill: parent
                    }
                }
            }


        }

        Item{
            id: itemSentence3
            width: parent.width; height: 75
            y: 250; z: 100

            Text{
                id: textSentence3

                text: menu5_text3

                font.family: fontNanum.name
                font.letterSpacing: 1
                font.pixelSize: inputSentence3.maximumLength > 70 ? 21 : 23

                anchors.left: parent.left
                anchors.leftMargin: 38
                anchors.top: parent.top
                anchors.topMargin: 10                
            }

            Rectangle{
                id: rectSentence3
                width: textSentence3.width + 10; height: 30

                color: "transparent"

                anchors.top: textSentence3.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 33

                TextInput{
                    id: inputSentence3

                    text: ""

                    font.family: fontNanum.name
                    font.letterSpacing: 1
                    font.pixelSize: inputSentence3.maximumLength > 70 ? 21 : 23

                    focus: false

                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    property bool effectPoint : false
                    property bool endPoint : false

                    onFocusChanged: {
                        if(inputSentence3.focus == true){
                            inputArea = inputSentence3
                            menu5_text = menu5_text3

                            rectFocus_Y = itemSentence3.y

                            rectSentence3.color = "#80999999"
                        }else{
                            if(menu5_redText.length == 0 && inputSentence3.length == inputSentence3.maximumLength){
                                rectSentence3.color = "#80005500"
                            }else{
                                rectSentence3.color = "#80550000"
                            }
                        }
                    }

                    Keys.onEscapePressed: {
                        btnBack_Instruction()
                    }

                    Keys.onPressed: {
                        if(event.key == 16777220){ // enter
                            if(!endPoint){
                                menu5_blueText = ""

                                currentSpeed = (60000 * c_letters_count)/currentTime_in_Speed //
                                if(highestSpeed < currentSpeed){
                                    highestSpeed = currentSpeed
                                }

                                total_textSize += menu5_text.length
                                total_c_letters_count += c_letters_count

                                c_letters_count = 0

                                inputSentence3.focus = false
                                inputSentence1.focus = true


                                statements_count++

                                accuracy = Math.round((total_c_letters_count + c_letters_count) / (total_textSize + inputArea.text.length) * 100);

                                timer_in_speed.stop()

                                if(effectPoint)
                                    backgroundEffect()

                                start()



                            }else if(endPoint){
                                resultEffect()
                                itemMenu5.state = "resultState"
                            }
                        }
                    }

                    Keys.onLeftPressed: {
                        console.log("left")
                    }

                    onTextChanged: {
                        if(c_letters_count == 1) {
                            currentTime_in_Speed = 0
                            timer_in_speed.restart()
                        }

                        setRedText()
                    }

                    MouseArea{
                        anchors.fill: parent
                    }
                }
            }
        }

        Item{
            id: rectFocus
            width: parent.width; height: 85
            y: rectFocus_Y-5

            Behavior on y { SpringAnimation { spring: 5; damping: 0.25 } }

            LinearGradient{
                start : Qt.point(0,0)
                end : Qt.point(750,0)
                gradient : Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 1.0; color: "transparent" }
                }
                anchors.fill: parent
            }

            Rectangle{
                id: rectPointLine
                width: 8; height: parent.height

                color: "#800000FF"

                anchors.left: parent.left
            }
        }

        Item{
            id: itemResult
            width: parent.width - 50; height: parent.height - 30

            visible: false

            anchors.centerIn: parent

            onVisibleChanged: {
                if(visible == true){
                    textProgress.text = "100"

                    itemResult.focus = true
                    timer.stop()

                    if(accuracy < 50){ // practicemore
                        itemPracticeMore.visible = true
                    }else if(accuracy < 80){ // accuracy
                        itemGreat2.visible = true
                    }else if((accuracy >= 80) && highestSpeed < 200){ // speed
                        itemGreat1.visible = true
                    }else{ // excellent
                        itemExcellent.visible = true
                    }
                }else{
                    itemPracticeMore.visible = false
                    itemGreat1.visible = false
                    itemGreat2.visible = false
                    itemExcellent.visible = false
                }
            }

            Item{
                id: itemResultRow1
                width: parent.width; height: 50

                anchors.top: parent.top

                Text{
                    id: textTitle

                    text: "Long Paragraphs Completed!"

                    color: "yellow"
                    font.pixelSize: 30

                    anchors.left: parent.left
                }

                Rectangle{
                    id: rectResultLine1
                    width: parent.width; height: 1

                    color: "black"
                    opacity: 0.2

                    anchors.top: textTitle.bottom
                    anchors.topMargin: 10
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
                width: parent.width; height: 290

                anchors.top: itemResultRow1.bottom

                Item{
                    id: itemExcellent
                    width: parent.width

                    visible: false

                    anchors.top: parent.top
                    anchors.topMargin: 50

                    Text{
                        id: text1_1

                        text: "Excellent!"

                        color: "white"
                        font.pixelSize: 50

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text{
                        id: text1_2

                        text: "You seem to mastered this practice."

                        color: "white"
                        font.pixelSize: 35

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: text1_1.bottom
                        anchors.topMargin: 40
                    }
                }

                Item{
                    id: itemGreat1
                    width: parent.width

                    visible: false

                    anchors.top: parent.top
                    anchors.topMargin: 50

                    Text{
                        id: text2_1

                        text: "Great!"

                        color: "white"
                        font.pixelSize: 50

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text{
                        id: text2_2

                        text: "This time, Practice with focusing Speed."

                        color: "white"
                        font.pixelSize: 35

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: text2_1.bottom
                        anchors.topMargin: 40
                    }
                }

                Item{
                    id: itemGreat2
                    width: parent.width

                    visible: false

                    anchors.top: parent.top
                    anchors.topMargin: 50

                    Text{
                        id: text3_1

                        text: "Good!"

                        color: "white"
                        font.pixelSize: 50

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text{
                        id: text3_2

                        text: "This time, Practice with focusing Accuracy."

                        color: "white"
                        font.pixelSize: 35

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: text3_1.bottom
                        anchors.topMargin: 40
                    }
                }

                Item{
                    id: itemPracticeMore
                    width: parent.width

                    visible: false

                    anchors.top: parent.top
                    anchors.topMargin: 50

                    Text{
                        id: text4_1

                        text: "Hmm..."

                        color: "white"
                        font.pixelSize: 50

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text{
                        id: text4_2

                        text: "Let's practice more."

                        color: "white"
                        font.pixelSize: 35

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: text4_1.bottom
                        anchors.topMargin: 40
                    }
                }
            }

        }
    }

    BackButton{
        id: btnBack

        anchors.right: parent.right
        anchors.top: rectRow2.bottom
        anchors.topMargin: 20

        onButtonClicked: {
            if(itemMenu5.state == "resultState"){
                resultEffect()
                itemMenu5.state = ""
            }

            if(showOn){
                showEffect()
                showOn = false
            }

            btnBack_Instruction()
        }
    }

    ShowButton{
        id: btnHide

        anchors.right: btnBack.left
        anchors.rightMargin: 5
        anchors.bottom: btnBack.bottom

        onButtonClicked: {
            if(showOn) showOn = false
            else showOn = true

            if(showOn){
                strState = "TEXT"
                showEffect()
                rectRow1.visible = false
                rectRow2.visible = false
            }else{
                strState = "IMAGE"
                showEffect()
                rectRow1.visible = true
                rectRow2.visible = true
            }
        }
    }
}
