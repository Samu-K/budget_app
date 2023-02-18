import QtQuick 2.15
import QtQuick.Layouts

import "qrc:/."

Rectangle {
    id: pageButtonRoot

    // component vars
    property alias text: imgLabel.text
    property alias iconSource: image.source

    property int bgHeight: parent.parent.height*(0.16)
    property int iconSize

    Layout.preferredWidth:  parent.width
    Layout.preferredHeight: bgHeight

    Layout.alignment: Qt.AlignCenter

    color: Styling.darkBg

    signal pageClicked(pageName: string)

    Image {
        id: image
        width: iconSize
        height: iconSize

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Styling.titleMargin

        Text {
            id: imgLabel

            font.pointSize: Styling.title3
            color: Styling.txtColor

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: Styling.titleMargin*2
        }


    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.color = Styling.slcColor
        }
        onExited: {
            parent.color = Styling.darkBg
        }
        onClicked: {
            pageButtonRoot.pageClicked(imgLabel.text)
        }
    }
}
