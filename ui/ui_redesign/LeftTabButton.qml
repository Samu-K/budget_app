import QtQuick 2.15
import QtQuick.Layouts

Rectangle {
    // component vars
    property alias iconSource: icon.source
    property alias text: text.text
    property int iconSize


    Layout.preferredWidth:  parent.width
    Layout.preferredHeight: iconColumn.bgHeight
    Layout.alignment: Qt.AlignCenter

    color: "#2C3139"

    Image {
        id: icon
        width: iconSize
        height: iconSize

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5

        Text {
            id: text
            font.pointSize: 24
            color: "white"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 10
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.color = "#5E5E5E"
        }
        onExited: {
            parent.color = "#2C3139"
            }
        }
    }
}
