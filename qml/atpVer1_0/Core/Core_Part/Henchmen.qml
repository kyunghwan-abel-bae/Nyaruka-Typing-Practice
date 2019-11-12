import QtQuick 2.0

Image{
    id: smile

    property string strImage
    property string strWord

    x: 360 * Math.random(); y: 40 * Math.random()

    source: "strImage"

    NumberAnimation on opacity{
        to: 0; duration: 1500
    }

    Component.onCompleted: {
        smile.destroy(1500)
    }
}
