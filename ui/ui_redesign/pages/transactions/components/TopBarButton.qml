import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/."

Button {
    id: root
    Layout.preferredWidth: 250
    Layout.preferredHeight: 40

    property alias buttonText: text.text

    signal trsButtonClicked(buttonName: string)

    Text {
        id: text
        color: Styling.txtColor

        font.pointSize: Styling.title3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    onClicked: trsButtonClicked(text.text)

    background: Rectangle {
        id: bg
        color: Styling.lightBg
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.color = Styling.slcColor
            }
            onExited: {
                parent.color = Styling.lightBg
            }
        }
    }
}

