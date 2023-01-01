import QtQuick 2.15
import Qt.labs.qmlmodels
import QtQuick.Controls

// expense table
TableView {
    id: tableView
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

    model: ["Once every", "Next charge", "Amount", "Vendor", "Category"]

    HorizontalHeaderView {
        id: horizontalHeader
        syncView: tableView
        anchors.left: parent.left
    }
}

