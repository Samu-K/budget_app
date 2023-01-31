import QtQuick 2.15
import Qt.labs.qmlmodels
import QtQuick.Controls

import "qrc:/."

TableView {
    id: tableView
    height: 180
    topMargin: Styling.titleMargin

    delegate: Rectangle {
        color: Styling.lightBg
        implicitWidth: 250
        implicitHeight: 60
        border.width: 1

        Text {
            text: display
            font.pointSize: Styling.title3
            color: Styling.txtColor
            anchors.centerIn: parent
        }
    }
}

