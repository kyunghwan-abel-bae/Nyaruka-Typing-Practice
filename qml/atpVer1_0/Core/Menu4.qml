/**

  @QML 파일 이름 : Menu4.qml
  @작 성 일 : 2013-11-09
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  사용자에게는 영/르 속담이 제공이 되어진다.
  사용자는 가장 실용적인 타자연습을 할 수 있다.

  @QML FileName : Menu4.qml
  @Date : 2013-11-09
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Learners are provided En/Rw Proverbs.
  Learners can practice the most practical typing skills

*/

import QtQuick 2.0
import QtGraphicalEffects 1.0

import "Core_Part"

Item {
    id: rectMenu4

    width: 830; height: 550


    property bool trigger_state

    property int accuracy: 100

    property int currentTime: 0
    property string currentTime_str: "00:00"
    property string strZero1
    property string strZero2

    property int currentSpeed: 0
    property int highestSpeed: 0
    property int currentTime_in_Speed: 0

    property int statements_count: 0
    property int c_letters_count: 0

    property int statements_index: 0
    property int statements_index_coming1: 0

    property int total_textSize: 0 // for estimating accuracy
    property int total_c_letters_count: 0

    property string menu4_text: ""
    property string menu4_textcoming1: ""

    property string menu4_blueText: ""
    property string menu4_redText: ""

    property string selectedLanguage

    property variant statements

    property variant statements_en: [
        "A man is not good or bad for one action",
        "He must be pure who blames another",
        "To be awake is to be alive",
        "Procrastination is the thief of time",
        "Love truth, but pardon error",
        "The eternal silence of these infinite spaces terrifies me",
        "A poet looks at the world as a man looks at a woman",
        "Good luck does not always repeat itself",
        "Nature is the best physician",
        "Man proposes, God disposes"
    ]

    property variant statements_rw: [
        "akimuhana kaza imvura ihise",
        "ako utazaha inshuti ntuyikaraga",
        "bucya bwitwa ejo",
        "buhoro buhoro ni rwo rugendo",
        "inshuti uyibona mu byago",
        "intimba ntiyica hica akazirikano",
        "inzira ntibwira umugenzi",
        "kugenda cyane bitera kubona",
        "ugaburira uwijuse bararwana",
        "ugaya ubuto ibuye arirya urwara",
        "ujya kwica ubukombe arabwagaza",
        "ukiranutse na bene amasaka yubaka ikigega",
        "umubumbyi arira ku rujyo",
        "umunyabwira asiga icyamuzanye ",
        "umwiza si uwisize",
        "utaribwa ntarinda",
        "uwanze guhingira inyoni yiyicisha inzara",
        "uzarama aritonda",
        "agapfundikiye gatera amatsiko",
        "aho ujishe igisabo ntuhatera ibuye",
        "ihene mbi ntuyizirikaho iyawe",
        "ingoma irahaka ntihora",
        "insina ngufi niyo icibwaho urukoma",
        "iteme umugabo azambuka aritinda agitunze",
        "kuyavuga siko kuyamara",
        "nyir'ubwenge aruta nyir'uburyo",
        "sabukuru ntinywerwa umuti",
        "ubucya bukira buheza ikinyoma",
        "ubumwe butariho bucibwa n'inyama",
        "urya urw'undi ntarwara inzoka",
        "umuhini mushya utera amabavu",
        "nta mwiza wabuze inenge",
        "umwana muto asumba ukuboko",
        "uruvuga undi ntirugorama",
        "ushyingura amurika aba yereka imbeba",
        "uvoma yanga avoma ibirohwa"
    ]

    signal btnBack_Instruction()

    signal resultEffect()
    signal start()
    signal setRedText()

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
                        target: itemShortSentence
                        property: "visible"
                        value: false
                    }
                    PropertyAction{
                        target: itemShortSentence_coming
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

                    PropertyAction{
                        target: btnAgain
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
                        target: rectRow2
                        property: "color"
                        value: "#80FFFFFF"
                    }
                    PropertyAction{
                        target: rectRow2
                        property: "border.width"
                        value: 0
                    }
                    PropertyAction{
                        target: rectRow2
                        property: "border.color"
                        value: "transparent"
                    }
                    PropertyAction{
                        target: itemShortSentence
                        property: "visible"
                        value: true
                    }
                    PropertyAction{
                        target: itemShortSentence_coming
                        property: "visible"
                        value: true
                    }
                    PropertyAction{
                        target: rectRow1
                        property: "color"
                        value: "#80000000"
                    }

                    PropertyAction{
                        target: textLabel_time
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textTime
                        property: "color"
                        value: "white"
                    }
                    PropertyAction{
                        target: textLabel_progress
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textProgress
                        property: "color"
                        value: "white"
                    }
                    PropertyAction{
                        target: textLabel_progresspercent
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textLabel_accuracy
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textAccuracy
                        property: "color"
                        value: "white"
                    }
                    PropertyAction{
                        target: textLabel_accuracypercent
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textLabel_speed
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textSpeed
                        property: "color"
                        value: "white"
                    }
                    PropertyAction{
                        target: textLabel_speeddimension
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textLabel_max
                        property: "font.bold"
                        value: false
                    }
                    PropertyAction{
                        target: textMax
                        property: "color"
                        value: "#F7D93D"
                    }
                    PropertyAction{
                        target: textLabel_maxdimension
                        property: "font.bold"
                        value: false
                    }


                    // now disappear something

                    PropertyAction{
                        target: itemResult
                        property: "visible"
                        value: false
                    }

                    PropertyAction{
                        target: btnAgain
                        property: "visible"
                        value: false
                    }
                }

                PropertyAction{
                    target: rectMenu4
                    property: "trigger_state"
                    value: true
                }
            }

        }
    ]

    Component.onCompleted: {
        selectedLanguage = rectMenu4.parent.selectedLanguage
        if(selectedLanguage == "en"){
            statements = statements_en
        }else if(selectedLanguage == "rw"){
            statements = statements_rw
        }

        timer.start()
        start()
    }

    onBtnBack_Instruction: {
        rectMenu4.parent.backMenus = "./Core/Instruction/Inst_Menu4.qml"
    }

    onSetRedText: {
        var inputAreaSize = inputArea.text.length;
        var textSize = menu4_text.length;

        if(inputAreaSize <= textSize){
            var text_cmp = statements[statements_index];
            var text_new = inputArea.text;

            if(text_new.substring(0, inputAreaSize) == text_cmp.substring(0, inputAreaSize)){
                menu4_blueText = '<font color="blue">' + text_cmp.substring(0, inputAreaSize) + '</font>';
                menu4_redText = ""
                c_letters_count = inputAreaSize
            }else{
                menu4_redText = '<font color="red">' + text_cmp.substring(menu4_blueText.length - 26, inputAreaSize) + '</font>';
            }

            menu4_text = menu4_blueText + menu4_redText + text_cmp.substring(inputAreaSize, textSize);

            accuracy = Math.round((total_c_letters_count + c_letters_count) / (total_textSize + inputArea.text.length) * 100);
        }
    }

    onStart: {
        var arrSize = statements.length

        if(statements_count == 0){
            var num1 = Math.ceil(Math.random()*100) % arrSize;
            var num2 = Math.ceil(Math.random()*100) % arrSize;

            statements_index = num1;
            statements_index_coming1 = num2;
        }else{
            var num = Math.ceil(Math.random()*100) % arrSize;

            statements_index = statements_index_coming1
            statements_index_coming1 = num
        }

        menu4_text = statements[statements_index]
        menu4_textcoming1 = statements[statements_index_coming1]
    }


    onTrigger_stateChanged: {
        if(trigger_state){
            trigger_state = false

            currentTime = 0
            currentTime_str = "00:00"

            statements_count = 0
            c_letters_count = 0
            total_textSize = 0
            total_c_letters_count = 0
            accuracy = 100

            currentSpeed = 0

            timer.start()
            start()
            inputArea.text = ""
            inputArea.focus = true
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
        anchors.fill: parent
        Timer{  // Thread 로 처리할 수는 없는가?
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
            width: 140; height: parent.height

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
            width: 110; height: parent.height

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

                text: statements_count * 10

                color: "white"
                scale: 2.5

                anchors.top: textLabel_progress.bottom
                anchors.topMargin: 15
                anchors.left: textLabel_progress.left
                anchors.leftMargin: 13


                onTextChanged: {
                    if(textProgress.text == "100"){
                        resultEffect()
                        rectMenu4.state = "resultState"
                    }
                }
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
                font.pixelSize: 50
                font.bold: true

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

        color: "#80FFFFFF"
        radius: 10

        anchors.left: parent.left
        anchors.top: rectRow1.bottom
        anchors.topMargin: 30

        Item{
            id: itemShortSentence
            width: parent.width; height: 138

            anchors.top: parent.top
            anchors.topMargin: 60

            Rectangle{
                id: rectPointLine
                width: 8; height: parent.height

                color: "#800000FF"

                anchors.left: parent.left
            }

            Item{
                id: rectShortSentence
                width: parent.width - 8; height: parent.height

                anchors.left: rectPointLine.right

                LinearGradient{
                    anchors.fill: parent
                    start : Qt.point(0,0)
                    end : Qt.point(600,0)
                    gradient : Gradient {
                        GradientStop { position: 0.0; color: "white" }
                        GradientStop { position: 1.0; color: "transparent" }
                    }
                }

                Text{
                    id: textShortSentence

                    text: menu4_text

                    font.bold: true
                    font.family: fontNanum.name
                    font.pixelSize: 28
                    font.letterSpacing: 1

                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.top: parent.top
                    anchors.topMargin: 50
                }

                Rectangle{
                    id: rectBackground_textinput
                    width: textShortSentence.width + 10; height: 30

                    color: "#80999999"

                    anchors.top: textShortSentence.bottom
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 25


                    TextInput{
                        id: inputArea

                        text: ""

                        font.bold: true
                        font.family: fontNanum.name
                        font.pixelSize: 28
                        font.letterSpacing: 1
                        maximumLength: statements[statements_index].length

                        focus: true

                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 5

                        Keys.onEscapePressed: {
                            btnBack_Instruction()
                        }

                        Keys.onPressed: {
                            if(event.key == 16777220){ // enter
                                accuracy = Math.round((total_c_letters_count + c_letters_count) / (total_textSize + inputArea.text.length) * 100);

                                currentSpeed = (60000 * c_letters_count)/currentTime_in_Speed //
                                if(highestSpeed < currentSpeed){
                                    highestSpeed = currentSpeed
                                }

                                total_textSize += statements[statements_index].length
                                total_c_letters_count += c_letters_count

                                c_letters_count = 0

                                inputArea.text = ""
                                inputArea.focus = true

                                statements_count++

                                timer_in_speed.stop()

                                start()
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
        }

        Item{
            id: itemShortSentence_coming
            width: parent.width; height: 138

            anchors.top: itemShortSentence.bottom
            anchors.topMargin: 30

            Text{
                id: textShortSentence_coming

                text: menu4_textcoming1

                color: "#80333333"
                font.pixelSize: 23
                font.family: fontNanum.name

                anchors.left: parent.left
                anchors.leftMargin: 38
            }
        }

        Item{
            id: itemResult
            width: parent.width - 50; height: parent.height - 30

            visible: false

            anchors.centerIn: parent

            onVisibleChanged: {
                if(visible == true){
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

                    text: "Short Sentences Completed!"

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

                        text: "This time, Practice with focusing a Speed."

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

                        text: "This time, Practice with focusing a Accuracy."

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
            if(rectMenu4.state == "resultState"){
                resultEffect()
                rectMenu4.state = "normalState"
            }

            btnBack_Instruction()
        }
    }

    AgainButton{
        id: btnAgain

        visible: false

        anchors.right: btnBack.left
        anchors.rightMargin: 10
        anchors.bottom: btnBack.bottom

        onButtonClicked: {
            resultEffect()
            rectMenu4.state = "normalState"
        }
    }
}
