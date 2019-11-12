import QtQuick 2.0

Item {
    width: 615; height: 185

    property int stars : 3

    property int numMistakes : 9

    property variant charMistakes : new Array(4)

    property int lv

    property bool isMenu3Check : false

    Component.onCompleted: {
        //console.log("lv ?? : " + lv)

        if(charMistakes[1]=='@'){
            text4.visible = false
            textWrongCharacter2.visible = false
            text5.visible = false
            textWrongCharacter3.visible = false
            text6.visible = false
            textWrongCharacter4.visible = false
        }

        if(charMistakes[2]=='@'){
            text5.visible = false
            textWrongCharacter3.visible = false
            text6.visible = false
            textWrongCharacter4.visible = false
        }

        if(charMistakes[3]=='@'){
            text6.visible = false
            textWrongCharacter4.visible = false
        }
    }

    Item{
        id: itemScore1Row1
        width: parent.width; height: 100//135

        Item{
            id: itemTextContainer
            width: parent.width

            anchors.verticalCenter: parent.verticalCenter

            Text{ // "You made "
                id: text1
                anchors.left: parent.left
                font.pixelSize: 15

                color: "white"
                text: "You made "
            }
            Text{ // mistakes(number)
                id: textMistakes
                anchors.left: text1.right
                anchors.bottom: text1.bottom
                anchors.bottomMargin: -5
                font.pixelSize: 40

                color: "#D0EC3C50"
                text: numMistakes
            }

            Text{ // "mistakes"
                id: text2
                anchors.left: textMistakes.right
                anchors.leftMargin: 5
                font.pixelSize: 15

                color: "white"
                text: "mistakes"
            }

            Text{ // You should try to memories
                id: text3
                anchors.left: parent.left
                anchors.top: text1.bottom
                anchors.topMargin: 30
                font.pixelSize: 15

                color: "white"
                text: "You should try to memories   "
            }

            Text{
                id: textWrongCharacter1
                anchors.left: text3.right
                anchors.bottom: text3.bottom
                anchors.bottomMargin: -5
                font.pixelSize: 40

                color: "yellow"

                text: charMistakes[0]
            }

            Text{ // ,
                id: text4
                anchors.left: textWrongCharacter1.right
                anchors.bottom: text3.bottom
                font.pixelSize: 15

                color: "white"
                text: ",  "
            }

            Text{
                id: textWrongCharacter2
                anchors.left: text4.right
                anchors.bottom: text3.bottom
                anchors.bottomMargin: -5
                font.pixelSize: 40

                color: "yellow"

                text: charMistakes[1]
            }

            Text{ // ,
                id: text5
                anchors.left: textWrongCharacter2.right
                anchors.bottom: text3.bottom
                font.pixelSize: 15

                color: "white"
                text: ",  "
            }

            Text{
                id: textWrongCharacter3
                anchors.left: text5.right
                anchors.bottom: text3.bottom
                anchors.bottomMargin: -5
                font.pixelSize: 40

                color: "yellow"

                text: charMistakes[2]
            }

            Text{ // ,
                id: text6
                anchors.left: textWrongCharacter3.right
                anchors.bottom: text3.bottom
                font.pixelSize: 15

                color: "white"
                text: ",  and "
            }

            Text{
                id: textWrongCharacter4
                anchors.left: text6.right
                anchors.bottom: text3.bottom
                anchors.bottomMargin: -5
                font.pixelSize: 40

                color: "yellow"

                text: charMistakes[3]
            }


        }
    }

    Result_Buttons{

        score: stars

        isLast: lv == 6 ? false : true
        isMenu3: isMenu3Check

        anchors.bottom : parent.bottom
        anchors.right: parent.right
        //anchors.rightMargin: (score > 3) && isMenu3Check ? 95 : 0

        onAgainButtonClicked: {
            parent.parent.isAgainButtonClicked = true
        }

        onNextButtonClicked: {
            parent.parent.isNextButtonClicked = true
        }

        onGameButtonClicked: {
            parent.parent.isGameButtonClicked = true
        }

    }
}
