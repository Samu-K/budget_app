import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

import "qrc:/pages/transactions/components/table"
import "qrc:/pages/shared"

ApplicationWindow {
    id: root
    visible: true
    title: qsTr("Budgetor")

    property var incomeData
    property var expenseData
    property var columnTitles

    // colors
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

    // sizes
        // title sizes
        property int title1: 32
        property int title2: 26
        property int title3: 24
        // normal text size
        property int norm: 20

    width: screen.width
    height: screen.height
    color: appBg

    // left tab
    LeftTab {
        id: sideTab
    }

    // top bar
    Rectangle {
        id: topBar
        width: parent.width - sideTab.width - trsBar.width
        height: 50
        color: boxBg

        anchors.left: sideTab.right
        anchors.top: parent.top

        RowLayout {
            id: topButtons
            height: parent.height

            spacing: 5
            anchors.left: parent.left
            anchors.bottom: parent.bottom

            Repeater {
                model:["All transactions", "Recurring", "Accounts", "Categories"]

                TopBarButton {
                    buttonText: modelData
                    Layout.alignment: Qt.AlignBottom
                }
            }
        }


    }

    // transactions screen divider
    Rectangle {
        id: trsDiv
        width: topBar.width
        height: 10
        color: boxBgLight

        anchors.verticalCenter: sideTab.verticalCenter
        anchors.verticalCenterOffset: topBar.height/2
        anchors.left: topBar.left
    }

    // titles
    Text {
        id: expTableTitle
        text: qsTr("Expenses")
        font.pointSize: 38
        font.bold: true
        color: "black"

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 10
    }
    Text {
        id: incTableTitle
        text: qsTr("Income")
        font.pointSize: 38
        font.bold: true
        color: "black"

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.top: trsDiv.bottom
        anchors.topMargin: 10
    }

    // expenses table
    TableHeader {
        id: expTableHeaders
        syncView: expTable

        titles: columnTitles
    }
    TrsTable {
        id: expTable
        anchors.left: sideTab.right
        anchors.leftMargin: 60

        anchors.right: trsBar.left
        anchors.rightMargin: 60

        anchors.top: expTableTitle.bottom
        anchors.topMargin: 40

        model: expenseData
    }

    // income table
    TableHeader {
        id: incTableHeaders
        syncView: incTable

        titles: columnTitles
    }
    TrsTable {
        id: incTable

        anchors.left: sideTab.right
        anchors.leftMargin: 60

        anchors.right: trsBar.left
        anchors.rightMargin: 60

        anchors.top: incTableTitle.bottom
        anchors.topMargin: 40

        model: incomeData
    }
}
