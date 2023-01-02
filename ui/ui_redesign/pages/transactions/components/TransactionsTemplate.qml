import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

import "qrc:/pages/transactions/components/table"
import "qrc:/pages/shared"
import "qrc:/."

ApplicationWindow {
    id: root
    visible: true
    title: qsTr("Budgetor")

    property var incomeData
    property var expenseData
    property var columnTitles

    width: screen.width
    height: screen.height
    color: Styling.app

    // left tab
    LeftTab {
        id: sideTab
    }

    // top bar
    Rectangle {
        id: topBar
        width: parent.width - sideTab.width - trsBar.width
        height: 50
        color: Styling.darkBg

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
        color: Styling.lightBg

        anchors.verticalCenter: sideTab.verticalCenter
        anchors.verticalCenterOffset: topBar.height/2
        anchors.left: topBar.left
    }

    // titles
    Text {
        id: expTableTitle
        text: qsTr("Expenses")
        font.pointSize: Styling.title
        font.bold: true
        color: "black"

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 10
    }
    Text {
        id: incTableTitle
        text: qsTr("Income")
        font.pointSize: Styling.title
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
