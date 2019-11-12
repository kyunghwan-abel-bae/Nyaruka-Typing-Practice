import QtQuick 2.0

Item {
    height: 50

    property int score
    property bool isLast
    property bool isMenu3

    signal againButtonClicked()
    signal nextButtonClicked()
    signal gameButtonClicked()

    Rectangle{
        id: rectNextButton

        width: 95; height: 45

        color: mrNextClick.pressed ? Qt.darker("#00AE8B", 1.5) : "#00AE8B"

        radius: 5
        border.color: "white"
        border.width: 2

        enabled: isLast
        visible: score > 1 ? true : false

        anchors.right: parent.right

        Text{
            id: txtNextButtonLabel
            anchors.centerIn: parent
            color: "white"
            text: "Next Level"
        }

        MouseArea{
            id: mrNextClick
            anchors.fill: parent
            onClicked: {
                nextButtonClicked()
            }
        }
    }

    Rectangle{
        id: rectAgainButton

        width: 95; height: 45

        color: mrAgainClick.pressed ? Qt.darker("#FF7175", 1.5) : "#FF7175"

        radius: 5
        border.color: "white"
        border.width: 2

        anchors.right: score > 1  ? rectNextButton.left : parent.right
        anchors.rightMargin: score > 1 ? 15 : 0

        Text{
            id: txtAgainButtonLabel
            anchors.centerIn: parent
            color: "white"
            text: "Practice Again"
        }

        MouseArea{
            id: mrAgainClick
            anchors.fill: parent
            onClicked: {
                againButtonClicked()
            }
        }
    }
}
