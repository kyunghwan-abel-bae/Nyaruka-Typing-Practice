/**
  @QML 파일 이름 : Inst_Menu3.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  Menu3을 위한 인스트럭션 페이지.

  @QML FileName : Inst_Menu3.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  Instruction Page for Menu3
*/

import QtQuick 2.0
import QtGraphicalEffects 1.0

import "Inst_Menu3_Parts"

Item {
    id: itemInst_Menu3

    width: 830; height: 550

    property int itemLevelsX : 0
    property int level : 0

    property string selectedLanguage

    property string langExplanation
    property string langExplanation_en : "Practice more with words to get used to typing according to the positions.\nType the word provided with appropriate fingers.\nSelect level and press Start to continue."
    property string langExplanation_rw : "Imenyereze kwandika cyane amagambo wahawe ukoresha intoki bijyanye.\nAndika amagambo wahawe ukoresheje intoki bijyanye.\nHitamo icyiciro ubundi ukande start kugira ngo ubashe ukomeze."

    property variant varLevels : [itemLevel1, itemLevel2, itemLevel3, itemLevel4, itemLevel5, itemLevel6]

    signal btnBack()

    Component.onCompleted: {
        level = itemInst_Menu3.parent.wordLevel
        itemLevels.x = (level-1) * -570
        itemLevelsX = (level-1) * -570

        selectedLanguage = itemInst_Menu3.parent.selectedLanguage
        if(selectedLanguage == "en"){
            langExplanation = langExplanation_en
        }else if(selectedLanguage == "rw"){
            langExplanation = langExplanation_rw
        }
    }

    onLevelChanged: {
        varLevels[level-1].state = "startInstruction"
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
    }

    Image{
        id: imgTitle
        scale: 0.8

        source: "../../img/title.png"

        asynchronous: true

        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle{
        id: rectInst_Menu3
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

                text: "Word Practice"

                color: "#DB91C4"
                font.bold: true
                font.pixelSize: 22
                //font.family: fontTitle.name

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
                    width: 8; height: 80

                    color: "#DB91C4"

                    anchors.left: parent.left
                }

                Text{
                    id: textExplanation

                    text: langExplanation

                    color: "black"
                    font.family: fontNanum.name
                    font.pixelSize: 16

                    anchors.left: rectPointLine.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }

            }
        }

        Rectangle{
            id: rectBtnLeft

            width: 90; height: 90
            x: 0; y: 230; z: 10

            color: "transparent"

            enabled: itemLevels.x % 570 == 0 ? true : false
            visible: itemLevels.x == 0 ? false : true

            Text{
                id: textBtnLeft

                text: "<"

                color: "#80000000"
                font.bold: mrBtnLeft.pressed == true ? true : false
                font.pixelSize: 100

                anchors.centerIn: parent
            }

            MouseArea{
                id: mrBtnLeft

                anchors.fill: parent

                onClicked: {
                    itemLevels.x += 570
                    itemLevelsX += 570
                    varLevels[level-1].state = ""
                    level--
                }
            }
        }

        Rectangle{
            id: rectBtnRight

            width: 90; height: 90
            x: 740; y: 230; z: 10

            color: "transparent"

            enabled: itemLevels.x % 570 == 0 ? true : false
            visible: itemLevelsX == -570*5 ? false : true

            Text{
                id: textBtnRight

                text: ">"

                color: "#80000000"
                font.bold: mrBtnRight.pressed == true ? true : false
                font.pixelSize: 100

                anchors.centerIn: parent
            }

            MouseArea{
                id: mrBtnRight

                anchors.fill: parent

                onClicked: {
                    itemLevels.x -= 570
                    itemLevelsX -= 570
                    varLevels[level-1].state = ""
                    level++
                }
            }
        }


        Item{
            id: itemLevels

            width: 570 * 6; height: 300

            anchors.top : itemInstruction.bottom
            anchors.topMargin: 20


            Behavior on x {
                NumberAnimation{ duration: 500 }
            }

            Level1{
                id: itemLevel1
                x : 140

                focus: true
                opacity: itemLevels.x == 0 ? 1 : 0.5

                anchors.top: parent.top

                Behavior on opacity {
                    NumberAnimation{ duration: 500 }
                }

                Rectangle{
                    id: rectLabel_Level1
                    width: 100; height: 35

                    x : itemLevelsX < 0 ? 450 : 0
                    y: 10

                    color: "#80000000"
                    radius: 10

                    Behavior on x {
                        NumberAnimation{ duration: 500 }
                    }

                    Text{
                        id: textLevel1

                        text: "Level 1"

                        color: "white"
                        //font.family: fontLevelLabel.name
                        font.pixelSize: 18

                        anchors.centerIn: parent
                    }
                }
            }

            Level2{
                id: itemLevel2

                opacity: itemLevels.x == -570 ? 1 : 0.5

                anchors.top: parent.top
                anchors.left: itemLevel1.right
                anchors.leftMargin: 20

                Behavior on opacity {
                    NumberAnimation{ duration: 500 }
                }

                Rectangle{
                    id: rectLabel_Level2
                    width: 100; height: 35; y: 10

                    x : itemLevelsX < -570 ? 450 : 0

                    radius: 10

                    color: "#80000000"

                    Behavior on x {
                        NumberAnimation{ duration: 500 }
                    }

                    Text{
                        id: textLevel2

                        text: "Level 2"

                        color: "white"
                        //font.family: fontLevelLabel.name
                        font.pixelSize: 18

                        anchors.centerIn: parent
                    }
                }
            }

            Level3{
                id: itemLevel3

                opacity: itemLevels.x == -570*2 ? 1 : 0.5

                anchors.top: parent.top
                anchors.left: itemLevel2.right
                anchors.leftMargin: 20

                Behavior on opacity {
                    NumberAnimation{ duration: 500 }
                }

                Rectangle{
                    id: rectLabel_Level3
                    width: 100; height: 35; y: 10

                    x : itemLevelsX < -570*2 ? 450 : 0

                    radius: 10

                    color: "#80000000"

                    Behavior on x {
                        NumberAnimation{ duration: 500 }
                    }

                    Text{
                        id: textLevel3

                        text: "Level 3"

                        color: "white"
                        //font.family: fontLevelLabel.name
                        font.pixelSize: 18

                        anchors.centerIn: parent
                    }
                }
            }

            Level4{
                id: itemLevel4

                opacity: itemLevels.x == -570*3 ? 1 : 0.5

                anchors.top: parent.top
                anchors.left: itemLevel3.right
                anchors.leftMargin: 20

                Behavior on opacity {
                    NumberAnimation{ duration: 500 }
                }

                Rectangle{
                    id: rectLabel_Level4
                    width: 100; height: 35; y: 10

                    x : itemLevelsX < -570*3 ? 450 : 0

                    radius: 10

                    color: "#80000000"

                    Behavior on x {
                        NumberAnimation{ duration: 500 }
                    }

                    Text{
                        id: textLevel4

                        text: "Level 4"

                        color: "white"
                        //font.family: fontLevelLabel.name
                        font.pixelSize: 18

                        anchors.centerIn: parent
                    }
                }
            }

            Level5{
                id: itemLevel5

                opacity: itemLevels.x == -570*4 ? 1 : 0.5

                anchors.top: parent.top
                anchors.left: itemLevel4.right
                anchors.leftMargin: 20

                Behavior on opacity {
                    NumberAnimation{ duration: 500 }
                }

                Rectangle{
                    id: rectLabel_Level5
                    width: 100; height: 35; y: 10

                    x : itemLevelsX < -570*4 ? 450 : 0

                    radius: 10

                    color: "#80000000"

                    Behavior on x {
                        NumberAnimation{ duration: 500 }
                    }

                    Text{
                        id: textLevel5

                        text: "Level 5"

                        color: "white"
                        //font.family: fontLevelLabel.name
                        font.pixelSize: 18

                        anchors.centerIn: parent
                    }
                }
            }

            Level6{
                id: itemLevel6

                opacity: itemLevels.x == -570*5 ? 1 : 0.5

                anchors.top: parent.top
                anchors.left: itemLevel5.right
                anchors.leftMargin: 20

                Behavior on opacity {
                    NumberAnimation{ duration: 500 }
                }

                Rectangle{
                    id: rectLabel_Level6
                    width: 100; height: 35; y: 10

                    x : itemLevelsX < -570*5 ? 450 : 0

                    radius: 10

                    color: "#80000000"

                    Behavior on x {
                        NumberAnimation{ duration: 500 }
                    }

                    Text{
                        id: textLevel6

                        text: "Level 6"

                        color: "white"
                        //font.family: fontLevelLabel.name
                        font.pixelSize: 18

                        anchors.centerIn: parent
                    }
                }
            }
        }



        Inst_Buttons{
            id: itemButtons

            anchors.bottom : parent.bottom
            anchors.bottomMargin : 20
            anchors.right: parent.right
            anchors.rightMargin: 10

            onBtnGo: {
                itemInst_Menu3.parent.wordLevel = level
                itemInst_Menu3.parent.source = "../Menu3.qml"
            }
        }
    }
}
