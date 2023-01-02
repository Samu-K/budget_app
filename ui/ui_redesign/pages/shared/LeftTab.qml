import QtQuick 2.15
import QtQuick.Layouts

import "qrc:/."

// left side tab
Rectangle {
    id: root
    width: parent.width*(1/8)
    height: parent.height
    color: Styling.darkBg

    anchors.left: parent.left
    anchors.top: parent.top

    // sidetab icons
    ColumnLayout {
        id: iconColumn

        width: root.width
        spacing: root.height*(0.075)

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: spacing*(0.5)

        // icons to show
        ListModel {
            id: iconList

            ListElement {
                text: "dashboard"
                source: "qrc:/design/dash.png"
            }
            ListElement {
                text: "transactions"
                source: "qrc:/design/transaction.png"
            }
            ListElement {
                text: "analytics"
                source: "qrc:/design/analytics.png"
            }
        }

        Repeater {
            model: iconList

            LeftTabButton {
                text: model.text
                iconSource: model.source
                iconSize: root.height*(0.09)
            }
        }
    }

    // options and account
    ColumnLayout {
        id: optionsTabIcons
        width: parent.width
        spacing: root.height*(0.015)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: root.height*(0.015)

        // user button
        LeftTabButton {
            id: userButton
            iconSource: "qrc:/design/user_icon_colored.png"
            bgHeight: root.height*(0.12)
            iconSize: bgHeight*(0.9)
        }

        // settings button
        LeftTabButton {
            id: stsButton
            iconSource: "qrc:/design/settings_white.png"
            bgHeight: root.height*(0.12)
            iconSize: bgHeight*(0.6)
        }
    }

}
