/**

  // 최고 기록 (개인 데이터베이스)
  @프로그램 이름 : 안녕 타자 연습
  @작 성 일 : 2012-12-38
  @작 성 자 : 배경환
  @변경 이력 : 0
  @프로그램 설명 :
    안녕 타자 연습은 르완다어로 된 타자연습 프로그램이며
    직관적인 인터페이스와 재미있는 게임을 포함한 교육용 프로그램입니다.

  @Program Name : Nyaruka Typing Practice
  @Date : 2012-12-38
  @Writer : Kyunghwan Bae
  @Modify : 0
  @Program Description :

  // Comment Form( QML File, Function )

  @QML 파일 이름 :
  @작 성 일 :
  @작 성 자 :
  @변경 이력 :
  @QML 파일 설명 :

  @QML FileName :
  @Date :
  @Writer :
  @Modified :
  @QML Description :

  @시그널 이름 :
  @작 성 일 :
  @작 성 자 :
  @변경 이력 :
  @시그널 설명 :

  @Signal Name :
  @Date :
  @Writer :
  @Modified :
  @Signal Description :


  @함수 이름 :
  @작 성 일 :
  @작 성 자 :
  @변경 이력 :
  @함수 설명 :

  @Function Name :
  @Date :
  @Writer :
  @Modified :
  @Function Description :

*/

/**

  @QML 파일 이름 : main.qml
  @작 성 일 : 2013-10-20
  @작 성 자 : 배경환
  @변경 이력 :
  프로그램 다 완성하고 난 뒤에 이력을 적습니다. 다 적읍시다.
  @QML 파일 설명 :
  프로그램의 메인 화면입니다.

  @QML FileName : main.qml
  @Date : 2012-12-28
  @Writer : Kyunghwan Bae
  @Modified :
  After completion, gonna write mofication.

  Menu1, Menu2 복습을 시작할 때 불러오는 것이 이상하게 불러온다.



  *

  @QML Description :
  This is Main Menu part,

*/

import QtQuick 2.0
import "Core"

Rectangle {
    id: rectBackground
    width: 1024; height: 600
    color: "black"

    property bool isVeryDark : false
    property bool isImage : true

    property int numTime : 0

    property Loader mainLoader : loader

    // 긴 글 연습에서 오랫동안 화면을 보여준다.
    NumberAnimation on z{
        id: animMaintain
        running: false
        from: 100; to: 1; duration: 2000

        onStopped: {
            animAppearLoader.start()
            animDark.start()
        }
    }

    /*

      Interface

    */

    Cover{
        id: cover

        z: 500

        opacity: 1

        anchors.fill: parent

        NumberAnimation on opacity{
            id: coverAnimation

            running: false

            from: 1; to: 0
            duration: 2000

            onStopped: {
                loader.source = "./Core/MainMenu.qml"
                animFirst.start()
            }
        }

        NumberAnimation on opacity{
            id: coverMaintainAnimation

            from: 1; to: 1
            duration: 1000

            onStopped: {
                coverAnimation.start()
            }
        }
    }

    Image{
        id: imgBackground

        source: "./img/mainBackground.png"

        asynchronous: true

        anchors.centerIn: parent

        NumberAnimation on opacity{
            id: animImageFadeIn
            from: 0; to: 1
            running: false; duration: 500
        }

        // Graphical Effect
        Rectangle{
            id: rectImgcover
            color: "transparent"

            anchors.fill: parent

            ColorAnimation on color {
                id: animFirst
                running: false
                to: "#80000000"; duration: 2000//duration: 2000

                onStopped: {
                    //loader.source = "./Core/MainMenu.qml"
                    animAppearLoader.start()
                }
            }

            ColorAnimation on color{
                id: animError
                running: false
                from: "#80FF0000"; to: "#80000000"; duration: 300
            }

            ColorAnimation on color{
                id: animNormal
                running: false
                to: "transparent"; duration: 500
            }

            ColorAnimation on color{
                id: animDark
                running: false
                to: "#80000000"; duration: 500

                onStopped: {
                    loader.focus = true
                }
            }

            ColorAnimation on color{
                id: animVeryDark
                running: false
                to: "#CF000000"; duration: 500
            }
        }
    }


    Item{
        id: itemLoader
        width: 830; height: 550

        opacity: 0

        anchors.centerIn: parent

        NumberAnimation on opacity{
            id: animAppearLoader
            running: false
            to: 1; duration: 1000
            onStopped: {
                loader.enabled = true
            }
        }

        NumberAnimation on opacity{
            id: animDisappearLoader
            running: false
            to: 0; duration: 500

            onStopped: {
                animMaintain.start()
            }
        }



        Loader{
            id: loader

            focus: true

            anchors.centerIn: parent

            property bool menu5selectedBefore : false

            property int page : 1
            property int positionLevel : 1
            property int wordLevel : 1

            property string backMenus
            property string longField : ""
            property string longTitle : ""
            property string selectedLanguage : "rw"
        }

        Connections{
            id: conMenu
            target: loader.item
            ignoreUnknownSignals: true

            // When User select a menu.
            // MainMenu.qml's signal
            onMenu1: {
                console.log("menu1")
                loader.source = "./Core/Instruction/Inst_Menu1.qml"
            }

            onMenu2: {
                console.log("menu2")
                loader.source = "./Core/Instruction/Inst_Menu2.qml"
            }

            onMenu3: {
                console.log("menu3")
                loader.source = "./Core/Instruction/Inst_Menu3.qml"
            }

            onMenu4: {
                console.log("menu4")
                loader.source = "./Core/Instruction/Inst_Menu4.qml"
            }

            onMenu5: {
                console.log("menu5")
                loader.menu5selectedBefore = true
                loader.page = 0
                loader.source = "./Core/Instruction/Inst_Menu5.qml"
            }

            /////////////////////////////////////////////////////////
            // Common Qml signal

            // Menu -> Instruction
            onBtnBack: { // Menu1.qml, Menu2.qml, Menu3.qml, Menu4.qml
                loader.positionLevel = 1
                loader.wordLevel = 1
                loader.menu5selectedBefore = false
                loader.focus = true
                loader.source = "./Core/MainMenu.qml"
            }

            // Instruction -> main
            onBtnBack_Instruction: {
                loader.source = loader.backMenus
                loader.page = 0

                if(loader.menu5selectedBefore == true){
                    imgBackground.source = "./img/mainBackground.png"
                    animImageFadeIn.start()
                }
            }

            // Menu1, Menu3
            // When User occurs an error.
            onErrorEffect: {
                animError.start()
            }

            // Menu5
            // For showing the image
            onBackgroundEffect: {
                loader.enabled = false

                loader.page++

                imgBackground.source = "./img/long/" + loader.longField + "/" + loader.longTitle + "/"+ loader.page + ".png"

                animImageFadeIn.start()

                animNormal.start()
                animDisappearLoader.start()
            }

            // Menu1~Menu5
            // for showing the result of practice
            onResultEffect: {
                if(isVeryDark){
                    animDark.start()
                    isVeryDark = false
                }else{
                    animVeryDark.start()
                    isVeryDark = true
                }
            }

            // Menu5
            // for showing the image by User
            onShowEffect: {
                if(isImage){
                    animNormal.start()
                    isImage = false
                }else{
                    animDark.start()
                    isImage = true
                }
            }
        }
    }

    Timer{
        id: timerMaintain
        running: true; repeat: true
        interval: 1000

        onTriggered: {
            numTime++
        }
    }
    Text{
        id: textMaintain
        z: 500

        text: numTime

        color: "white"
        visible: false

        anchors.top: itemLoader.bottom
        anchors.right: itemLoader.right
    }
}
