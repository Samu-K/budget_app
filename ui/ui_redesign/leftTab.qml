import QtQuick 2.15
import QtQuick.Layouts

// left side tab
Rectangle {
    width: parent.width*(1/5)
    height: parent.height

    // background color of entire app
    property color appBg: "#236BAE"
    // color of text
    property color textColor: "white"
    // color of area backgrounds (e.g side tab, boxes)
    property color boxBg: "#2C3139"
    // ligther version of box bg (e.g summary)
    property color boxBgLight: "#8E9EB8"
    // color when hovering a button
    property color slcColor: "#5E5E5E"

    // component vars
    property string selected

    color: boxBg

    anchors.left: root.left
    anchors.top: root.top

    // sidetab icons
    ColumnLayout {
        id: iconColumn

        width: parent.width
        spacing: 40

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 35

        // variables for sidetab icons
        property int bgHeight: 120
        property int iconSize: 80

        // dashboard
        LeftTabButton {
            iconSource: "qrc:/design/dash.png"
            text: "Dashboard"
            iconSize: iconSize
        }

        // Transactions
        LeftTabButton {
            iconSource: "qrc:/design/transaction.png"
            text: "Transactions"
            iconSize: iconSize
        }

        // Analytics
        LeftTabButton {
            iconSource: "qrc:/design/analytics.png"
            text: "Analytics"
            iconSize: iconSize
        }

    }

    // options and account
    ColumnLayout {
        id: optionsTabIcons
        width: parent.width
        spacing: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25

        // vars to keep things consistent
        property int bgHeight: 85

        // user button
        Rectangle {
            id: userButton
            Layout.preferredWidth:  parent.width
            Layout.preferredHeight: optionsTabIcons.bgHeight
            Layout.alignment: Qt.AlignCenter

            color: boxBg

            Image {
                width: 85
                height: 85
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                source: "qrc:/design/user_icon_colored.png"

            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    userButton.color = slcColor
                }
                onExited: {
                    userButton.color = boxBg
                }
            }
        }

        // settings button
        Rectangle {
            id: settingsButton
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: optionsTabIcons.bgHeight
            Layout.alignment: Qt.AlignCenter

            color: boxBg

            Image {
                width: 70
                height: 70
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                source: "qrc:/design/settings_white.png"

            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    settingsButton.color = slcColor
                }
                onExited: {
                    settingsButton.color = boxBg
                }
            }
        }
    }
}
