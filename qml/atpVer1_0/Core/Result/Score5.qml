import QtQuick 2.0

Item {
    width: 615; height: 185

    property int numMistakes : 24

    property int lv

    property bool isMenu3Check : false

    Item{
        id: itemScore1Row1
        width: parent.width; height: 100//135

        Item{
            id: itemTextContainer
            width: parent.width

            anchors.verticalCenter: parent.verticalCenter

            Text{
                id: text1
                anchors.left: parent.left
                font.pixelSize: 15

                color: "white"
                text: "Excellent! You seem to have mastered this level."
            }

            Text{
                id: text3
                anchors.left: parent.left
                anchors.top: text1.bottom
                anchors.topMargin: 30
                font.pixelSize: 15

                color: "white"
                text: "Move on to next level!"
            }
        }
    }

    Result_Buttons{

        score: 5

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
