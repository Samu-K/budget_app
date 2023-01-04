import QtQuick 2.15
import Qt.labs.qmlmodels
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/."
import "qrc:/pages/shared"
import "qrc:/pages/transactions/components"
import "qrc:/pages/transactions/components/table"
import "qrc:/pages/transactions/components/trsbar"

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
        width: parent.width - sideTab.width
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
                model:["All transactions", "Recurring", "Categories", "Accounts"]

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
        text: qsTr("Expense categories")
        font.pointSize: Styling.title
        font.bold: true
        color: "black"

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 10
    }
    Text {
        id: incTableTitle
        text: qsTr("Income categories")
        font.pointSize: Styling.title
        font.bold: true
        color: "black"

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.top: trsDiv.bottom
        anchors.topMargin: 10
    }

    // categories
    Component {
        id: catTable
        GridLayout {
            id: grid
            columns: 4
            columnSpacing: 60

            Repeater {
                model: cats

                Text {
                    text: modelData
                    font.pixelSize: Styling.title3
                    color: Styling.txtColor
                }

                Button {
                    id: remove
                    // TODO: remove button here
                }

                Rectangle {
                    id: bg
                    // background for cells here
                }
            }
        }
    }

    Loader {
        id: incTable
        sourceComponent: catTable
        property var cats: ["Social benefits","Salary","Loans","Payback"]

        anchors.top: incTableTitle.bottom
        anchors.topMargin: 25
        anchors.horizontalCenter: incTableTitle.horizontalCenter
    }

    Loader {
        id: expTable
        sourceComponent: catTable
        property var cats: ["Groceries","Going out","Shopping","Rent","Books","Subscriptions"]

        anchors.top: expTableTitle.bottom
        anchors.topMargin: 25
        anchors.horizontalCenter: expTableTitle.horizontalCenter
    }

}

/*
TableModel {
        TableModelColumn {display: "c1"}
        TableModelColumn {display: "c2"}
        TableModelColumn {display: "c3"}
        TableModelColumn {display: "c4"}

        rows: [
            {
                "c1": "Groceries",
                "c2": "Going out",
                "c3": "Shopping",
                "c4": "Rent"
            },
            {
                "c1": "Books",
                "c2": "Subscriptions",
                "c3": "",
                "c4": ""
            },
        ]
}
TableModel {
        TableModelColumn {display: "c1"}
        TableModelColumn {display: "c2"}
        TableModelColumn {display: "c3"}
        TableModelColumn {display: "c4"}

        rows: [
            {
                "c1": "Social benefits",
                "c2": "Salary",
                "c3": "Loans",
                "c4": "Payback"
            },
            {
                "c1": "Other",
                "c2": "",
                "c3": "",
                "c4": ""
            },
        ]
    }
    expenseData: TableModel {
        TableModelColumn {display: "c1"}
        TableModelColumn {display: "c2"}
        TableModelColumn {display: "c3"}
        TableModelColumn {display: "c4"}

        rows: [
            {
                "c1": "Groceries",
                "c2": "Going out",
                "c3": "Shopping",
                "c4": "Rent"
            },
            {
                "c1": "Books",
                "c2": "Subscriptions",
                "c3": "",
                "c4": ""
            },
        ]
}
*/
