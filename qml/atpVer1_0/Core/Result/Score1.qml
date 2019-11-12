import QtQuick 2.0

Item {
    width: 615; height: 185

    property int numMistakes

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

            Text{ // You need to ~ on!
                id: text3
                anchors.left: parent.left
                anchors.top: text1.bottom
                anchors.topMargin: 30
                font.pixelSize: 15

                color: "white"
                text: "You need to practice this level again before you move on!"
            }

            Text{
                id: text4
                anchors.left: parent.left
                anchors.top: text3.bottom
                anchors.topMargin: 5
                font.pixelSize: 15

                color: "white"
                text: "(Please Check whether You had pressed other keys during practice)"
            }
        }
    }

    Result_Buttons{

        score: 1

        anchors.bottom : parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: score > 3 ? 95 : 0

        onAgainButtonClicked: {
            parent.parent.isAgainButtonClicked = true
        }

        onNextButtonClicked: {
            console.log("next!")
        }

        onGameButtonClicked: {
            console.log("game!")
        }

    }
}
