import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

ApplicationWindow {
    id: root
    visible: true
    title: qsTr("Budgetor")

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

    // right side tab
    TrsBar {
        id: trsBar
    }

    // recurring picker
    ComboBox {
        id: recBox
        width: trsBar.width-(trsBar.sideMargin*2)
        height: trsBar.bgHeight

        anchors.bottom: trsBar.bottom
        anchors.bottomMargin: 150
        anchors.horizontalCenter: trsBar.horizontalCenter

        font.pointSize: title3

        model: [ "Day", "Week", "Month" ]

        background:
            Rectangle {
                id: recBg
                color: boxBgLight
                width: parent.width
                height: parent.height+10

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
        }

        // label
        Text {
            text: qsTr("Once every ")
            font.pointSize: title3
            color: textColor

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: 10
        }
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
        text: qsTr("Recurring expenses")
        font.pointSize: 38
        font.bold: true
        color: "black"

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.top: topBar.bottom
        anchors.topMargin: 10
    }
    Text {
        id: incTableTitle
        text: qsTr("Recurring income")
        font.pointSize: 38
        font.bold: true
        color: "black"

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.top: trsDiv.bottom
        anchors.topMargin: 10
    }

    TrsTable {
        id: expTable
        anchors.left: sideTab.right
        anchors.leftMargin: 60

        anchors.right: trsBar.left
        anchors.rightMargin: 60

        anchors.top: expTableTitle.bottom
        anchors.topMargin: 40

        model: TableModel {
            TableModelColumn { display: "Once every" }
            TableModelColumn { display: "Next charge" }
            TableModelColumn { display: "Amount" }
            TableModelColumn { display: "Vendor" }
            TableModelColumn { display: "Category" }

            rows: [
                {
                    "Once every": "month",
                    "Next charge": "13.2.2022",
                    "Amount": "124€",
                    "Vendor": "Isabel",
                    "Category": "rent"
                },
                {
                    "Once every": "year",
                    "Next charge": "13.4.2022",
                    "Amount": "20€",
                    "Vendor": "Pocket Casts",
                    "Category": "subscriptions"
                },

            ]
        }
    }

    HorizontalHeaderView {
        id: expHorizontalHeader
        syncView: expTable

        anchors.left: expTable.left
        anchors.bottom: expTable.top

        model: [
            "Once every",
            "Next charge",
            "Amount",
            "Vendor",
            "Category"
        ]

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 30

            color: "transparent"
            Text {
                text: modelData
                font.pointSize: 24
                color: "white"
                anchors.centerIn: parent
            }
        }
    }

    TrsTable {
        id: incTable

        anchors.left: sideTab.right
        anchors.leftMargin: 60

        anchors.right: trsBar.left
        anchors.rightMargin: 60

        anchors.top: incTableTitle.bottom
        anchors.topMargin: 40

        model: TableModel {
            TableModelColumn { display: "Once every" }
            TableModelColumn { display: "Next charge" }
            TableModelColumn { display: "Amount" }
            TableModelColumn { display: "Vendor" }
            TableModelColumn { display: "Category" }

            rows: [
                {
                    "Once every": "month",
                    "Next charge": "31.1.2022",
                    "Amount": "300€",
                    "Vendor": "Uniter Retail",
                    "Category": "salary"
                },
                {
                    "Once every": "month",
                    "Next charge": "1.1.2022",
                    "Amount": "280€",
                    "Vendor": "Kela",
                    "Category": "social benefits"
                },

            ]
        }
    }
    HorizontalHeaderView {
        id: incHorizontalHeader
        syncView: incTable

        anchors.left: incTable.left
        anchors.bottom: incTable.top

        model: [
            "Once every",
            "Next charge",
            "Amount",
            "Vendor",
            "Category"
        ]

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 30

            color: "transparent"
            Text {
                text: modelData
                font.pointSize: 24
                color: "white"
                anchors.centerIn: parent
            }
        }
    }
}
