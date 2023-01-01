import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Button {
    Layout.preferredWidth: 200
    Layout.preferredHeight: 30

    property alias buttonText: text.text

    Text {
        id: text
        color: textColor

        font.pointSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    background: Rectangle {
        color: "#8E9EB8"
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = "#5E5E5E"
            onExited: parent.color = "#8E9EB8"
        }
    }
}

