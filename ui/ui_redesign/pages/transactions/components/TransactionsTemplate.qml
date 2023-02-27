import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

import "qrc:/pages/transactions/components/table"
import "qrc:/pages/shared"
import "qrc:/."

Rectangle {
    id: root
    visible: true

    property var incomeData
    property var expenseData
    property var columnTitles

    width: screen.width
    height: screen.height
    color: Styling.app

    // top bar
    Rectangle {
        id: topBar
        width: parent.width - trsBar.width
        height: Styling.topBarHeight
        color: Styling.darkBg

        anchors.top: parent.top

        RowLayout {
            objectName: "buttonLayout"
            id: topButtons
            height: parent.height

            spacing: 10
            anchors.left: parent.left
            anchors.leftMargin: Styling.loaderMargin
            anchors.bottom: parent.bottom

            TopBarButton {
                objectName: "allTrsButton"
                buttonText: "all transactions"
                Layout.alignment: Qt.AlignBottom
            }
            TopBarButton {
                objectName: "recTrsButton"
                buttonText: "recurring"
                Layout.alignment: Qt.AlignBottom
            }
            TopBarButton {
                objectName: "catButton"
                buttonText: "categories"
                Layout.alignment: Qt.AlignBottom
            }
            TopBarButton {
                objectName: "accButton"
                buttonText: "accounts"
                Layout.alignment: Qt.AlignBottom
            }
        }
    }

    // transactions screen divider
    Rectangle {
        id: trsDiv
        width: topBar.width
        height: 10
        color: Styling.lightBg

        anchors.verticalCenter: parent.verticalCenter
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

        anchors.left: parent.left
        anchors.leftMargin: 30+Styling.loaderMargin
        anchors.top: topBar.bottom
        anchors.topMargin: 10
    }
    Text {
        id: incTableTitle
        text: qsTr("Income")
        font.pointSize: Styling.title
        font.bold: true
        color: "black"

        anchors.left: parent.left
        anchors.leftMargin: 30+Styling.loaderMargin
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

        anchors.left: topBar.left
        anchors.right: topBar.right
        anchors.leftMargin: Styling.loaderMargin
        anchors.rightMargin: Styling.loaderMargin

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

        anchors.left: topBar.left
        anchors.right: topBar.right
        anchors.leftMargin: Styling.loaderMargin
        anchors.rightMargin: Styling.loaderMargin

        anchors.top: incTableTitle.bottom
        anchors.topMargin: 40

        model: incomeData
    }
}
