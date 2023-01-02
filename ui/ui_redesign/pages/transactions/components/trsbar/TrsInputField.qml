import QtQuick 2.15
import QtQuick.Layouts

import "qrc:/."

// label
Text {
    id: text

    color: Styling.txtColor
    font.pointSize: Styling.title3

    Layout.alignment: Qt.AlignHCenter

    property alias bgWidth: background.width
    property int sideMargin

    Rectangle {
        id: background

        color: Styling.lightBg
        height: 35
        clip: true

        anchors.top: parent.bottom
        anchors.topMargin: Styling.titleMargin
        anchors.horizontalCenter: parent.horizontalCenter

        // input
        TextInput {
            id: input
            width: parent.width
            Component.onCompleted: input.ensureVisible(0)

            font.pointSize: Styling.title3
            color: text.color

            horizontalAlignment: Text.Center
            verticalAlignment: Text.Center

            anchors.fill: parent
        }
    }
}



