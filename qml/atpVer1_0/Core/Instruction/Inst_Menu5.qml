/**
  @QML 파일 이름 : Inst_Menu5.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu5을 위한 인스트럭션 페이지.

  @QML FileName : Inst_Menu5.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Instruction Page for Menu5
*/

import QtQuick 2.0

import QtGraphicalEffects 1.0


Item {
    id: itemInst_Menu5

    width: 830; height: 550

    property bool trigger_y : false

    property int numContents : 3
    property int numContentIndex : 0

    property string langExplanation
    property string langExplanation_en : "Improve your typing skills by continuoulsy practicing with long paragraphs.\nIf you want to read the paragraph without typing, just press enter.\nChoose an article and press go to continue."
    property string langExplanation_rw : "Ihatire kongera ubumenyi mu myandikire wimenyerezakwandika ukoresheje interuro\nndende. Niba ushaka gusoma igika cyose utandika, kanda enter.\nHitamo ingingo ubundi ukande continue."

    property string selectedLanguage

    // Selected Field
    property string field
    property variant fields : [
        "biography",
        "geography",
        "rwandan culture",
        "world literature"
    ]

    // Selected Content
    property variant strTitle : new Array();
    property variant strWriter : new Array();
    property variant strInstruction : new Array();

    // Array of Contents
    property variant strTitles : [
        strTitle_Biography,
        strTitle_Geography,
        strTitle_Rwandan_Culture,
        strTitle_World_Literature
    ]

    property variant strWriters : [
        strWriter_Biography,
        strWriter_Geography,
        strWriter_Rwandan_Culture,
        strWriter_World_Literature
    ]

    property variant strInstructions : [
        strInstruction_Biography,
        strInstruction_Geography,
        strInstruction_Rwandan_Culture,
        strInstruction_World_Literature
    ]


    // BIOGRAPHY
    property variant strTitle_Biography : [
        "Albert Einstein",
        "Albert Schweitzer",
        "Alfred Bernhard Nobel",
        "Anna Eleanor Roosevelt",
        "Gabrielle 'Coco' Bonheur Chanel",
        "Helen Adams Keller",
        "Isaac Newton",
        "Jack Roosevelt",
        "Leonardo di ser Piero da Vinci",
        "Ludwig van Beethoven",
        "Marie Curie",
        "Martin Luther",
        "Michael Jeffrey Jordan",
        "Mother Teresa",
        "Pearl Sydenstricker Buck",
        "Stephen William Hawking",
        "Stevie Wonder",
        "Thomas Alva Edison",
    ]
    property variant strWriter_Biography : [
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA",
        "WIKIPEDIA"
    ]
    property variant strInstruction_Biography : [
        //"He is the best physician in the world.\nHe is 56 years old. newnew",
        "Theoretical physicist who developed the\ngeneral theory of relativity,\none of the two pillars of modern physics",
        "German and later French theologian,\nmusician, philosopher, physician,\nand medical missionary in Africa",
        "Swedish chemist, engineer, innovator,\nand armaments manufacturer",
        "The longest-serving First Lady of the\nUnited States",
        "French fashion designer and\nfounder of the Chanel brand",
        "The first deaf blind person to earn\na Bachelor of Arts degree",
        "English physicist and mathematician\nwho is widely regarded as one of the most\ninfluential scientists of all time",
        "American baseball player who became\nthe first African American to play\nin Major League Baseball(MLB)",
        "Italian Renaissance polymath: painter,\nsculptor, architect, musician,\nmathematician, engineer, inventor,\nanatomist, geologist, cartographer,\nbotanist, and writer",
        "German composer and pianist",
        "Polish physicist and chemist",
        "American clergyman, activist,\nand leader in the African-American\nCivil Rights Movement",
        "American former professional\nbasketball player",
        "Albanian born,\nIndian Roman Catholic Religious Sister",
        "American writer and novelist",
        "Theoretical physicist, cosmologist, author\nand Director of Research at the Centre\nfor Theoretical Cosmology",
        "American musician, singer and songwriter",
        "American inventor and businessman"
    ]

    //////////////////////////////////////////////////

    // CULTURE
    property variant strTitle_Culture : [
        "DATA IS COMING",
        "DATA IS COMING",
        "DATA IS COMING"
    ]
    property variant strWriter_Culture : [
        "",
        "",
        ""
    ]
    property variant strInstruction_Culture : [
        "",
        "",
        ""
    ]
    ////////////////////////////////////////////

    // ESSAY
    property variant strTitle_Essay : [
        "e1",
        "e2",
        "e3",
    ]
    property variant strWriter_Essay : [
        "",
        "",
        ""
    ]
    property variant strInstruction_Essay : [
        "",
        "",
        ""
    ]
    ////////////////////////////////////////////

    // GEOGRAPHY
    property variant strTitle_Geography : [
        "Africa",
        "Antarctica",
        "Asia",
        "Australia",
        "Europe",
        "North America",
        "South America"
    ]
    property variant strWriter_Geography : [
        "WIKIPEDIA, National Geographic Education",
        "WIKIPEDIA, National Geographic Education",
        "WIKIPEDIA, National Geographic Education",
        "WIKIPEDIA, National Geographic Education",
        "WIKIPEDIA, National Geographic Education",
        "WIKIPEDIA, National Geographic Education",
        "WIKIPEDIA, National Geographic Education"
    ]
    property variant strInstruction_Geography : [
        "",
        "",
        "",
        "",
        "",
        "",
        ""
    ]
    ////////////////////////////////////////////

    // RWANDAN LITERATURE
    property variant strTitle_Rwandan_Culture : [
        "GENOCIDE(RW)",
        "GENOCIDE(EN)",
        "GEOGRAPHICAL UNIQUENESS(RW)",
        "GEOGRAPHICAL UNIQUENESS(EN)",
        "GORILA(RW)",
        "GORILA(EN)",
        "PEOPLE(RW)",
        "PEOPLE(EN)"
    ]
    property variant strWriter_Rwandan_Culture : [
        "REB",
        "REB",
        "REB",
        "REB",
        "REB",
        "REB",
        "REB",
        "REB"
    ]
    property variant strInstruction_Rwandan_Culture : [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
    ]
    ////////////////////////////////////////////

    // WORLD LITERATURE
    property variant strTitle_World_Literature : [
        "THE COCK, THE CAT, AND THE MOUSE",
        "THE CRAB AND THE HERON",
        "THE FOX AND THE CROW",
        "THE GREEDY DOG",
        "THE HARE AND THE TORTOISE",
        "THE HORSE AND THE WOLF",
        "WOLF AND CRANE"
    ]
    property variant strWriter_World_Literature : [
        "Aesop, KOICA",
        "Aesop, KOICA",
        "Aesop, KOICA",
        "Aesop, KOICA",
        "Aesop, KOICA",
        "Aesop, KOICA",
        "Aesop, KOICA"
    ]
    property variant strInstruction_World_Literature : [
        "",
        "",
        "",
        "",
        "",
        "",
        ""
    ]
    ////////////////////////////////////////////

    property var parts : new Array();

    signal btnBack()
    signal backgroundEffect()
    signal startMenu5()

    Component.onCompleted: {
        itemKeypress.focus = true

        selectMenu(1)

        selectedLanguage = itemInst_Menu5.parent.selectedLanguage
        if(selectedLanguage == "en"){
            langExplanation = langExplanation_en
        }else if(selectedLanguage == "rw"){
            langExplanation = langExplanation_rw
        }
    }

    onStartMenu5: {
        itemInst_Menu5.parent.longTitle = rowContents.selectedTitle
        itemInst_Menu5.parent.longField = field

        backgroundEffect()

        itemInst_Menu5.parent.source = "../Menu5.qml"
    }

    function selectMenu(index){
        //numContentIndex = 0

        field = fields[index-1]
        strTitle = strTitles[index-1]
        strWriter = strWriters[index-1]
        strInstruction = strInstructions[index-1]

        if(parts.length){
            for(var j in parts){
                parts[j].destroy()
            }
        }

        parts = new Array();

        numContents = strTitle.length

        for(var i=0;i<numContents;i++){
            var menu5ContentComponent = Qt.createComponent("./Inst_Menu5_Part.qml")
            var ret = menu5ContentComponent.createObject(rowContents, {
                                                             //"strImgPath" : imgPath_Biography[i],
                                                             "strImgPath" : "../../img/long/" + field + "/" + strTitle[i] + "/1.png",
                                                             "strTitle" : strTitle[i],
                                                             "strWriter" : strWriter[i],
                                                             "strInstruction" : strInstruction[i]
                                                         })
            parts.push(ret)
        }
    }

    /*

      Interface

    */

    Item{
        id: itemFont

        FontLoader{
            id: fontNanum
            source: "../../fonts/NanumMyeongjo.ttf"
        }
    }

    Item{
        id: itemKeypress
        focus: true

        anchors.fill: parent

        Keys.onEscapePressed: {
            btnBack()
        }

        MouseArea{
            anchors.fill: parent

            onWheel: {
                if(wheel.angleDelta.y>0){
                    trigger_y = false

                    if(itemContents.y + 210 >= 40){
                        itemContents.y = 40
                    }else{
                        itemContents.y += 210
                    }

                    if(rectScroll.y - rectScroll.height <= itemBtnUp.y + itemBtnUp.height){
                        rectScroll.y = itemBtnUp.y + itemBtnUp.height
                    }else{
                        rectScroll.y -= rectScroll.height
                    }
                }else{
                    trigger_y = false

                    if(itemContents.y-210 <= (40 - (210 * (numContents-1)))){
                        itemContents.y = (40 - (210 * (numContents-1)))
                    }else{
                        itemContents.y -= 210
                    }

                    if(rectScroll.y + rectScroll.height >= itemBtnDown.y - rectScroll.height){
                        rectScroll.y = itemBtnDown.y - rectScroll.height
                    }else{
                        rectScroll.y += rectScroll.height
                    }
                }
            }
        }
    }

    Image{
        id: imgTitle
        scale: 0.8

        source: "../../img/title.png"

        asynchronous: true

        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle{
        id: rectInst_Menu5
        width: parent.width; height: 495

        clip: true
        color: "#B2FFFFFF"
        radius: 10

        anchors.top: imgTitle.bottom
        anchors.topMargin: 20

        Item{
            id: itemInstruction
            width: parent.width; height: 100

            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left

            Text{
                id: textLabel

                text: "Long Paragraphs"

                color: "#F27F62"
                font.bold: true
                //font.family: fontTitle.name
                font.pixelSize: 22

                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 20
            }

            Item{
                id: rectContainer
                width: parent.width; height: 80

                anchors.top: textLabel.bottom
                anchors.topMargin: 10
                anchors.left: parent.left

                LinearGradient{
                    anchors.fill: parent
                    start : Qt.point(0,0)
                    end : Qt.point(600,0)
                    gradient : Gradient {
                        GradientStop { position: 0.0; color: "white" }
                        GradientStop { position: 1.0; color: "transparent" }
                    }
                }

                Rectangle{
                    id: rectPointLine
                    width: 8; height: 80

                    color: "#F27F62"

                    anchors.left: parent.left
                }

                Text{
                    id: textExplanation

                    text: langExplanation

                    color: "black"
                    font.family: fontNanum.name
                    font.pixelSize: 15

                    anchors.left: rectPointLine.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Item{
                id: itemLongMenus
                width: 750; height: 280

                anchors.top: rectContainer.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Item{
                    id: rectRow1Column1
                    width: 200; height: parent.height

                    anchors.left: parent.left

                    ListModel{
                        id: menuModel

                        ListElement{ name: "BIOGRAPHY" }
                        ListElement{ name: "GEOGRAPHY" }
                        ListElement{ name: "RWANDAN CULTURE" }
                        ListElement{ name: "WORLD LITERATURE" }
                    }

                    Component{
                        id: menuDelegate

                        Rectangle{ // color: focus == true ? "#F27F62" : "#80FFFFFF"
                            id: rectTitle
                            width: 200; height: 64

                            color: focus == true ? "#F27F62" : "transparent"

                            focus: false

                            LinearGradient{
                                id: linearGradient

                                start : Qt.point(0,0)
                                end : Qt.point(140,0)
                                gradient : Gradient {
                                    GradientStop { position: 0.0; color: "white" }
                                    GradientStop { position: 1.0; color: "transparent" }
                                }

                                visible: parent.focus == true ? false : true

                                anchors.fill: parent
                            }

                            Text{
                                id: textTitle

                                text: name

                                color: parent.focus == true ? "white" : "#80333333"
                                //font.family: fontLight.name
                                font.pixelSize: 15

                                anchors.centerIn: parent
                            }

                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    itemContents.y = 40
                                    rectScroll.y = itemBtnUp.y + itemBtnUp.height


                                    selectMenu((index + 1))
                                    parent.focus = true
                                }
                            }
                        }
                    }

                    ListView{
                        id: l1
                        model: menuModel
                        delegate: menuDelegate

                        currentIndex: 0
                        spacing: 8

                        focus: true

                        anchors.fill: parent
                    }
                }

                Rectangle{
                    id: rectRow1Column2
                    width: 5; height: parent.height

                    color: "#F27F62"

                    anchors.left: rectRow1Column1.right
                }

                Rectangle{
                    id: rectRow1Column3
                    width: 545; height: parent.height

                    clip: true
                    color: "#B2FFFFFF"

                    anchors.left: rectRow1Column2.right

                    Rectangle{
                        id: itemContents
                        width: 520; height: parent.height * numContents
                        y: 40

                        color: "transparent"

                        anchors.left: parent.left

                        Behavior on y{
                            NumberAnimation{
                                duration: 200
                            }
                        }

                        Column{
                            id: rowContents

                            width: parent.width;

                            spacing: 10

                            property string selectedTitle

                            signal menuSelected()
                            signal menuDoubleClicked()

                            onMenuSelected: {
                                for(var i in parts){
                                    if(parts[i].colorOn){
                                        parts[i].colorNextOn = false
                                        parts[i].colorOn = false
                                    }
                                }

                                for(var j in parts){
                                    if(parts[j].colorNextOn){
                                        parts[j].colorOn = true
                                        selectedTitle = parts[j].strTitle
                                    }
                                }

                                console.log("selectedTitle : " + selectedTitle)
                            }

                            onMenuDoubleClicked: {
                                if(rowContents.selectedTitle == "DATA IS COMING"){
                                }else{
                                    startMenu5()
                                }
                            }
                        }


                    }

                    Rectangle{
                        id: rectScrollBar
                        width: 25; height: parent.height

                        color: "#B2FFFFFF"

                        anchors.left: itemContents.right

                        Item{
                            id: itemBtnUp
                            width: parent.width; height: parent.width

                            enabled: itemContents.y >= 40 ? false : true

                            anchors.top: parent.top

                            Image{
                                id: imgBtnUp
                                source: "../../img/long/up.png"
                                asynchronous: true
                                anchors.centerIn: parent
                            }

                            MouseArea{
                                id: mrBtnUp
                                anchors.fill: parent
                                onClicked: {
                                    trigger_y = false

                                    if(itemContents.y + 210 >= 40){
                                        itemContents.y = 40
                                    }else{
                                        itemContents.y += 210
                                    }

                                    if(rectScroll.y - rectScroll.height <= itemBtnUp.y + itemBtnUp.height){
                                        rectScroll.y = itemBtnUp.y + itemBtnUp.height
                                    }else{
                                        rectScroll.y -= rectScroll.height
                                    }
                                }
                            }
                        }

                        Rectangle{
                            id: rectScroll
                            width: parent.width; height: (itemLongMenus.height - (itemBtnUp.height * 2)) / numContents
                            y : itemBtnUp.y + itemBtnUp.height

                            color: "#F27F62"

                            property int y_previous : y

                            Behavior on y{
                                NumberAnimation{
                                    duration: 200
                                }
                            }

                            onYChanged: { // y 값에 따라서 itemContents의 위치를 조정한다.

                                if(trigger_y){
                                    if(y > y_previous){ // down // click 을 한 경우에는 움직이지 말고 드래그할때만 움직여
                                        itemContents.y = rectScroll.y * ((40 - (210 * (numContents-1)))/(itemBtnDown.y - rectScroll.height))
                                    }else if(y < y_previous){ // up
                                        // 40 : itemCotents.y init Y
                                        // 210 : itemContents.y spacing
                                        // 25 : rectScroll.y init Y
                                        itemContents.y = ((40 - (210 * (numContents-1))) - 40) * (rectScroll.y - 25) / (mrScroll.drag.maximumY - mrScroll.drag.minimumY) + 40
                                    }

                                    y_previous = y
                                }
                            }

                            MouseArea{
                                id: mrScroll
                                drag.target: parent
                                drag.axis: Drag.YAxis
                                drag.maximumY: itemBtnDown.y - parent.height
                                drag.minimumY: itemBtnUp.y + itemBtnUp.height

                                anchors.fill: parent

                                onClicked: {
                                    itemBtnUp.enabled = true
                                    itemBtnDown.enabled = true
                                }

                                onPressed: {
                                    trigger_y = true
                                }
                            }
                        }

                        Item{
                            id: itemBtnDown

                            width: parent.width; height: parent.width

                            enabled: itemContents.y <= 40 - (210 * (numContents-1)) ? false : true

                            anchors.bottom: parent.bottom

                            Image{
                                id: imgBtnDown
                                source: "../../img/long/down.png"
                                asynchronous: true
                                anchors.centerIn: parent
                            }
                            MouseArea{
                                id: mrBtnDown
                                anchors.fill: parent
                                onClicked: {
                                    trigger_y = false

                                    if(itemContents.y-210 <= (40 - (210 * (numContents-1)))){
                                        itemContents.y = (40 - (210 * (numContents-1)))
                                    }else{
                                        itemContents.y -= 210
                                    }

                                    if(rectScroll.y + rectScroll.height >= itemBtnDown.y - rectScroll.height){
                                        rectScroll.y = itemBtnDown.y - rectScroll.height
                                    }else{
                                        rectScroll.y += rectScroll.height
                                    }
                                }
                            }
                        }
                    }
                }// Item
            }
        }


        Inst_Buttons{
            id: itemButtons

            anchors.bottom : parent.bottom
            anchors.bottomMargin : 20
            anchors.right: parent.right
            anchors.rightMargin: 10

            onBtnGo: {
                if(rowContents.selectedTitle != ""){

                    // TAS
                    if(rowContents.selectedTitle == "DATA IS COMING"){

                    }else{
                        startMenu5()
                    }
                }
            }
        }
    }
}
