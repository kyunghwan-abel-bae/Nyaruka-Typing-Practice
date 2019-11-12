/**

  @QML 파일 이름 : MainMenu.qml
  @작 성 일 : 2013-07-05
  @작 성 자 : 배경환
  @변경 이력 :
  @QML 파일 설명 :
  메인메뉴입니다.

  @QML FileName : MainMenu.qml
  @Date : 2013-07-05
  @Writer : Kyunghwan Bae
  @Modified :
  @QML Description :
  a Main Menu.

*/

import QtQuick 2.0

import "Core_Part"

Rectangle {
    id: rectMainmenu
    width: 830; height: 550
    color: "transparent"

    signal menu1() // Postion Practice
    signal menu2() // Essential Keys
    signal menu3() // Word Practice
    signal menu4() // Short Sentence
    signal menu5() // Long Paragraphs

    property string selectedLanguage

    property string langPosition
    property string langPosition_en : "Position Practice"
    property string langPosition_rw : "Kumenyereza intoki"

    property string langEssential
    property string langEssential_en : "Essential Keys"
    property string langEssential_rw : "Touches zangombwa"

    property string langWord
    property string langWord_en : "Word Practice"
    property string langWord_rw : "Kwimenyereza\nkwandika amagambo"

    property string langShort
    property string langShort_en : "Short Sentences"
    property string langShort_rw : "Interuro ngufi"

    property string langLong
    property string langLong_en : "Long Paragraphs"
    property string langLong_rw : "Interuro ndende"

    Component.onCompleted: {
        selectedLanguage = rectMainmenu.parent.selectedLanguage
        if(selectedLanguage == "en"){
            langPosition = langPosition_en
            langEssential = langEssential_en
            langWord = langWord_en
            langShort = langShort_en
            langLong = langLong_en
            imgLanguage.source = "../img/lang_en.png"
        }else{
            langPosition = langPosition_rw
            langEssential = langEssential_rw
            langWord = langWord_rw
            langShort = langShort_rw
            langLong = langLong_rw
            imgLanguage.source = "../img/lang_rw.png"
        }
    }

    onSelectedLanguageChanged: {
        if(selectedLanguage == "en"){
            langPosition = langPosition_en
            langEssential = langEssential_en
            langWord = langWord_en
            langShort = langShort_en
            langLong = langLong_en
        }else{
            langPosition = langPosition_rw
            langEssential = langEssential_rw
            langWord = langWord_rw
            langShort = langShort_rw
            langLong = langLong_rw

        }
    }

    /*

      Interface

    */

    Image{
        id: imgTitle
        scale: 0.8

        source: "../img/title.png"

        asynchronous: true

        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image{
        id: imgLogo

        z: 100

        source: "../img/main_logo.png"

        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
    }

    Item {
        id: itemLanguage
        width: imgLanguage.width; height: imgLanguage.height
        z: 100

        anchors.right: btnQuit.left
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        Image{
            id: imgLanguage

            asynchronous: true
            source: "../img/lang_en.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(selectedLanguage == "en"){
                    imgLanguage.source = "../img/lang_rw.png"
                    selectedLanguage = "rw"
                }else{
                    imgLanguage.source = "../img/lang_en.png"
                    selectedLanguage = "en"
                }

                rectMainmenu.parent.selectedLanguage = selectedLanguage

            }
        }
    }

    Rectangle{
        id: btnQuit
        width: 64; height: 64; z: 100

        color: mrQuit.pressed ? Qt.darker("#80FF0000", 1.5) : "#80FF0000"
        border.color: "white"
        radius: 60

        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        Text{
            id: textQuit

            text: "EXIT"

            font.pixelSize: 20
            color: "white"

            anchors.centerIn: parent
        }

        MouseArea{
            id: mrQuit
            anchors.fill: parent
            onClicked: {
                Qt.quit()
            }
        }
    }

    Rectangle{
        width: parent.width; height: 495


        color: "#B2FFFFFF"
        radius: 10

        anchors.top : imgTitle.bottom
        anchors.topMargin: 10
    }

    MainButton{
        id: btnPosition

        y: 120

        number: 1
        label: langPosition
        strColor: "43AFD3"


        anchors.horizontalCenter: parent.horizontalCenter

        onButtonClicked: {
            menu1()
        }
    }

    MainButton{
        id: btnEssential

        number: 2
        label: langEssential
        strColor: "F5BC75"

        anchors.left: btnPosition.left
        anchors.top: btnPosition.bottom
        anchors.right: btnPosition.right
        anchors.topMargin: 20

        onButtonClicked: {
            menu2()
        }
    }

    MainButton{
        id: btnWord

        number: 3
        label: langWord
        strColor: "DB91C4"

        anchors.left: btnEssential.left
        anchors.top: btnEssential.bottom
        anchors.right: btnEssential.right
        anchors.topMargin: 20

        onButtonClicked: {
            menu3()
        }
    }

    MainButton{
        id: btnShort

        number: 4
        label: langShort
        strColor: "90DC82"

        anchors.left: btnWord.left
        anchors.top: btnWord.bottom
        anchors.right: btnWord.right
        anchors.topMargin: 20

        onButtonClicked: {
            menu4()
        }
    }

    MainButton{
        id: btnLong

        number: 5
        label: langLong
        strColor: "F27F62"

        anchors.left: btnShort.left
        anchors.top: btnShort.bottom
        anchors.right: btnShort.right
        anchors.topMargin: 20

        onButtonClicked: {
            menu5()
        }
    }
}
