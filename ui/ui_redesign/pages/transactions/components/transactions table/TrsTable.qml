import QtQuick 2.15
import Qt.labs.qmlmodels
import QtQuick.Controls

TableView {
    id: tableView
    height: 180
    topMargin: 5

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

