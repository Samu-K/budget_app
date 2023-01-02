import QtQuick 2.15
import QtQuick.Controls

import "qrc:/."

HorizontalHeaderView {
    id: expHorizontalHeader

    anchors.left: syncView.left
    anchors.bottom: syncView.top

    property var titles

    model: titles

    delegate: Rectangle {
        implicitWidth: 100
        implicitHeight: 30

        color: "transparent"
        Text {
            text: modelData
            font.pointSize: Styling.title3
            color: Styling.txtColor
            anchors.centerIn: parent
        }
    }
}
