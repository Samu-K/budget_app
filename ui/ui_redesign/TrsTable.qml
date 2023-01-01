import QtQuick 2.15
import Qt.labs.qmlmodels

// expense table
TableView {
    height: 180

    delegate: Rectangle {
        color: "#8E9EB8"
        implicitWidth: 180
        implicitHeight: 40
        border.width: 1

        Text {
            text: display
            font.pointSize: 26
            color: "white"
            anchors.centerIn: parent
        }
    }
}

