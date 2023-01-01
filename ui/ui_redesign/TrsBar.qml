import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts


// transaction bar
Rectangle {
    id: trsBar
    width: parent.width*(1/5)
    height: parent.height
    color: "#2C3139"

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
        anchors.topMargin: topBar.height
        Text {
            text: "Expense"
            color: textColor
            font.pointSize: title1

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        background: Rectangle {
            id: expButtonBg
            color: "#FF0000"
            border.width: 3
            border.color: boxBgLight

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = "darkRed"
                onExited: parent.color = "#FF0000"

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
            color: textColor
            font.pointSize: title1

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        background: Rectangle {
            id: incToggleBg
            color: "green"
            border.width: 0
            border.color: boxBgLight

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = "darkGreen"
                onExited: parent.color = "green"
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

        spacing: 10

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

        font.pointSize: title3


        model: [ "School food", "Groceries", "Going out" ]

        background:
            Rectangle {
                id: catBg
                color: boxBgLight
                width: parent.width
                height: parent.height+10

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
        }

        // label
        Text {
            text: qsTr("Category")
            font.pointSize: title3
            color: textColor

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
            color: textColor
            font.pointSize: title2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        background: Rectangle {
            color: boxBgLight
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = slcColor
                onExited: parent.color = boxBgLight
            }
        }
    }
}

