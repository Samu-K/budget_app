import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/."

// transaction bar
Rectangle {
    id: trsBar
    width: parent.width*(1/5)
    height: parent.height
    color: Styling.darkBg

    anchors.right: parent.right

    // vars for type buttons
    property int buttonHeight: 45

    // expense button
    Button {
        id: expToggle
        width: parent.width/2
        height: trsBar.buttonHeight

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 50

        Text {
            text: "Expense"
            color: Styling.txtColor
            font.pointSize: Styling.title2

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        background: Rectangle {
            id: expButtonBg
            color: Styling.expColor
            border.width: 3
            border.color: Styling.lightBg

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = Styling.expColor.darker(1.5)
                onExited: parent.color = Styling.expColor

            }
        }
    }

    // income button
    Button {
        id: incToggle
        width: parent.width/2
        height: trsBar.buttonHeight

        anchors.left: expToggle.right
        anchors.verticalCenter: expToggle.verticalCenter

        Text {
            text: "Income"
            color: Styling.txtColor
            font.pointSize: Styling.title2

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        background: Rectangle {
            id: incToggleBg
            color: Styling.incColor
            border.width: 0
            border.color: Styling.lightBg

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = Styling.incColor.darker(1.5)
                onExited: parent.color = Styling.incColor
            }
        }
    }

    // vars for input fields
    property int bgHeight: 35
    property int sideMargin: 20

    // input fields
    ColumnLayout {
        id: trsInput
        height: 300
        width: trsBar.width-40

        spacing: 5

        anchors.top: expToggle.bottom

        anchors.left: parent.left
        anchors.leftMargin: 20

        Repeater {
            model: ["Date", "Amount", "Vendor"]

            Layout.alignment: Qt.AlignTop

            TrsInputField {
                text: modelData
                bgWidth: trsBar.width-(40)
            }
        }
    }

    // category picker
    ComboBox {
        id: catBox
        width: trsBar.width-(trsBar.sideMargin*2)
        height: trsBar.bgHeight

        anchors.top: trsInput.bottom
        anchors.topMargin: 70
        anchors.horizontalCenter: trsBar.horizontalCenter

        font.pointSize: Styling.title3


        model: [ "School food", "Groceries", "Going out" ]

        background:
            Rectangle {
                id: catBg
                color: Styling.lightBg
                width: parent.width
                height: parent.height+10

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
        }

        // label
        Text {
            text: qsTr("Category")
            font.pointSize: Styling.title3
            color: Styling.txtColor

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: 10
        }
    }

    // submit button
    Button {
        width: trsBar.width
        height: 45
        anchors.bottom: trsBar.bottom
        anchors.bottomMargin: 50

        Text {
            text: "Add transaction"
            color: Styling.txtColor
            font.pointSize: Styling.title2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        background: Rectangle {
            color: Styling.lightBg
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = Styling.slcColor
                onExited: parent.color = Styling.lightBg
            }
        }
    }
}

