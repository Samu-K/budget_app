import QtQuick 2.15
import QtQuick.Layouts

// label
Text {
    id: text

    color: "white"
    font.pointSize: 24

    Layout.alignment: Qt.AlignHCenter

    property alias bgWidth: background.width
    property int sideMargin

    Rectangle {
        id: background

        color: "#8E9EB8"
        height: 35
        clip: true

        anchors.top: parent.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter

        // input
        TextInput {
            id: input
            width: parent.width
            Component.onCompleted: input.ensureVisible(0)

            font.pointSize: 26
            color: text.color

            horizontalAlignment: Text.Center
            verticalAlignment: Text.Center

            anchors.fill: parent
        }
    }
}



