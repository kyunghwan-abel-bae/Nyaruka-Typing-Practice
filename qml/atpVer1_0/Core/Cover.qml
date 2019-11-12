import QtQuick 2.0

Rectangle {
    id: rectCover
    width: 1024
    height: 600

    color: "white"

    states: [
        State{
            name: "fadeIn"
        }
    ]

    transitions: [
        Transition{
            to: "fadeIn"

            SequentialAnimation{
                NumberAnimation{
                    target: imgCover
                    property: "opacity"
                    from: 0; to: 1
                    duration: 1000
                }
            }
        }
    ]

    Component.onCompleted: {
        rectCover.state = "fadeIn"
    }

    Image{
        id: imgCover

        source: "../img/cover.png"

        opacity: 0

        anchors.centerIn: parent
    }
}
