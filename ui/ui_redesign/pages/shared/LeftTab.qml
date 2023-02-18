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
        objectName: "iconModel"

        width: root.width
        spacing: root.height*(0.075)

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: spacing*(0.5)

        LeftTabButton {
            objectName: "dashButton"
            text: "dashboard"
            iconSource: "qrc:/design/dash.png"
            iconSize: root.height*(0.09)
        }

        LeftTabButton {
            objectName: "trsButton"
            text: "transactions"
            iconSource: "qrc:/design/transaction.png"
            iconSize: root.height*(0.09)
        }

        LeftTabButton {
            objectName: "anlButton"
            text: "analytics"
            iconSource: "qrc:/design/analytics.png"
            iconSize: root.height*(0.09)
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
            objectName: "rep4"
            id: userButton
            iconSource: "qrc:/design/user_icon_colored.png"
            bgHeight: root.height*(0.12)
            iconSize: bgHeight*(0.9)
        }

        // settings button
        LeftTabButton {
            objectName: "rep5"
            id: stsButton
            iconSource: "qrc:/design/settings_white.png"
            bgHeight: root.height*(0.12)
            iconSize: bgHeight*(0.6)
        }
    }

}
