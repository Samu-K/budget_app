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

    TrsBar {
        id: trsBar
    }

    // rec picker
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

        property int buttonWidth: 200
        property int buttonHeight: 30

        // all transaction tab
        Button {
            id: trsTabButton
            width: topBar.buttonWidth
            height: topBar.buttonHeight
            anchors.bottom: topBar.bottom
            anchors.left: topBar.left

            Text {
                text: "All transactions"
                color: textColor
                font.pointSize: title3
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

        // recurring transactions tab
        Button {
            id: recTabButton
            width: topBar.buttonWidth
            height: topBar.buttonHeight
            anchors.bottom: topBar.bottom
            anchors.left: trsTabButton.right
            anchors.leftMargin: 10

            Text {
                text: "Recurring"
                color: textColor
                font.pointSize: title3
                horizontalAlignment: Text.Center
                verticalAlignment: Text.Center
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            background: Rectangle {
                color: slcColor
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = slcColor
                    onExited: parent.color = slcColor
                }
            }
        }

        // categories tab
        Button {
            id: catTabButton
            width: topBar.buttonWidth
            height: topBar.buttonHeight
            anchors.bottom: topBar.bottom
            anchors.left: recTabButton.right
            anchors.leftMargin: 10

            Text {
                text: "Categories"
                color: textColor
                font.pointSize: title3
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

        // account tab
        Button {
            id: accTabButton
            width: topBar.buttonWidth
            height: topBar.buttonHeight
            anchors.bottom: topBar.bottom
            anchors.left: catTabButton.right
            anchors.leftMargin: 10

            Text {
                text: "Accounts"
                color: textColor
                font.pointSize: title3
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

    property int headerMargin: 30

    // headers
    Text {
        id: recHeader
        text: "Once every"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: expTable.left
        anchors.leftMargin: 0
        anchors.bottom: expTable.top
        anchors.bottomMargin: headerMargin
    }
    Text {
        id: dateHeader
        text: "Next charge"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: recHeader.right
        anchors.leftMargin: 5
        anchors.bottom: expTable.top
        anchors.bottomMargin: headerMargin
    }

    Text {
        id: amountHeader
        text: "Amount"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: dateHeader.right
        anchors.leftMargin: 20
        anchors.bottom: expTable.top
        anchors.bottomMargin: headerMargin
    }
    Text {
        id: vendorHeader
        text: "Vendor"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: amountHeader.right
        anchors.leftMargin: 75
        anchors.bottom: expTable.top
        anchors.bottomMargin: headerMargin
    }
    Text {
        id: catHeader
        text: "Category"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: vendorHeader.right
        anchors.leftMargin: 50
        anchors.bottom: expTable.top
        anchors.bottomMargin: headerMargin
    }

    // expense table
    TableView {
        id: expTable
        height: 180

        anchors.left: sideTab.right
        anchors.leftMargin: 60

        anchors.right: trsBar.left
        anchors.rightMargin: 60

        anchors.top: expTableTitle.bottom
        anchors.topMargin: 80

        //columnSpacing: topBar.width * (1/4.5)
        //rowSpacing: 5

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

        delegate: Rectangle {
            color: boxBgLight
            implicitWidth: 180
            implicitHeight: 40
            border.width: 1

            Text {
                text: display
                font.pointSize: title2
                color: textColor
                anchors.centerIn: parent
            }
        }
    }

    // headers
    Text {
        id: incRecHeader
        text: "Once every"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incTable.left
        anchors.leftMargin: 0
        anchors.bottom: incTable.top
        anchors.bottomMargin: headerMargin
    }
    Text {
        id: incDateHeader
        text: "Next charge"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incRecHeader.right
        anchors.leftMargin: 5
        anchors.bottom: incTable.top
        anchors.bottomMargin: headerMargin
    }
    Text {
        id: incAmountHeader
        text: "Amount"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incDateHeader.right
        anchors.leftMargin: 20
        anchors.bottom: incTable.top
        anchors.bottomMargin: headerMargin
    }
    Text {
        id: incVendorHeader
        text: "Vendor"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incAmountHeader.right
        anchors.leftMargin: 75
        anchors.bottom: incTable.top
        anchors.bottomMargin: headerMargin
    }

    Text {
        id: incCatHeader
        text: "Category"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incVendorHeader.right
        anchors.leftMargin: 50
        anchors.bottom: incTable.top
        anchors.bottomMargin: headerMargin
    }

    // income table
    TableView {
        id: incTable
        height: 180

        anchors.left: sideTab.right
        anchors.leftMargin: 60

        anchors.right: trsBar.left
        anchors.rightMargin: 60

        anchors.top: incTableTitle.bottom
        anchors.topMargin: 80

        //columnSpacing: topBar.width * (1/4.5)
        //rowSpacing: 5

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

        delegate: Rectangle {
            color: boxBgLight
            implicitWidth: 180
            implicitHeight: 40
            border.width: 1

            Text {
                text: display
                font.pointSize: title2
                color: textColor
                anchors.centerIn: parent
            }
        }
    }

}
