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
        // "#236BAE"
        property color appBg: "#236BAE"
        // color of text
        // white
        property color textColor: "white"
        // color of area backgrounds (e.g side tab, boxes)
        // "#2C3139"
        property color boxBg: "#2C3139"
        // ligther version of box bg (e.g summary)
        // "#8E9EB8"
        property color boxBgLight: "#8E9EB8"
        // color when hovering a button
        // "#5E5E5E"
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

    // side tab
    Rectangle {
        id: sideTab
        width: 148
        height: root.height
        color: boxBg

        anchors.left: root.left

        // sidetab icons
        ColumnLayout {
            width: sideTab.width
            spacing: 40
            anchors.horizontalCenter: sideTab.horizontalCenter
            anchors.top: sideTab.top
            anchors.topMargin: 35

            // dashboard
            Rectangle {
                id: dshButton
                Layout.preferredWidth:  parent.width
                Layout.preferredHeight: 120
                Layout.alignment: Qt.AlignCenter

                color: boxBg

                Image {
                    width: 80
                    height: 75
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5

                    source: "qrc:/design/dash.png"

                    Text {
                        text: qsTr("Dashboard")
                        font.pointSize: title3
                        color: textColor
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = slcColor
                    }
                    onExited: {
                        parent.color = boxBg
                    }
                }
            }

            // transaction
            Rectangle {
                id: trsButton
                Layout.preferredWidth:  parent.width
                Layout.preferredHeight: 120
                Layout.alignment: Qt.AlignCenter

                color: slcColor

                Image {
                    width: 80
                    height: 75
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5

                    source: "qrc:/design/transaction.png"

                    Text {
                        text: qsTr("Transactions")
                        font.pointSize: title3
                        color: textColor
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = slcColor
                    }
                    onExited: {
                        parent.color = slcColor
                    }
                }
            }

            // analytics
            Rectangle {
                id: anlButton
                Layout.preferredWidth:  parent.width
                Layout.preferredHeight: 120
                Layout.alignment: Qt.AlignCenter

                color: boxBg

                Image {
                    width: 80
                    height: 75
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5


                    source: "qrc:/design/analytics.png"

                    Text {
                        text: qsTr("Analytics")
                        font.pointSize: title3
                        color: textColor
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = slcColor
                    }
                    onExited: {
                        parent.color = boxBg
                    }
                }
            }
        }

        // options and account
        ColumnLayout {
            width: sideTab.width
            spacing: 25
            anchors.horizontalCenter: sideTab.horizontalCenter
            anchors.bottom: sideTab.bottom
            anchors.bottomMargin: 25


            // user button
            Rectangle {
                id: userButton
                Layout.preferredWidth:  sideTab.width
                Layout.preferredHeight: 85
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
                Layout.preferredWidth: sideTab.width
                Layout.preferredHeight: 85
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

    // transaction bar
    Rectangle {
        id: trsBar
        width: 325
        height: parent.height
        color: boxBg

        anchors.right: parent.right

        // expense button
        Button {
            id: expToggle
            width: parent.width/2
            height: 45

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
                color: "darkRed"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "darkRed"
                    onExited: parent.color = "darkRed"
                }
            }
        }

        // income button
        Button {
            id: incToggle
            width: parent.width/2
            height: 45

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
                id: ingToggleBg
                color: "green"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "darkGreen"
                    onExited: parent.color = "green"
                }
            }
        }

        // date box
        Rectangle {
            id: dateBox
            width: parent.width-40
            height: 35
            color: boxBgLight

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: incToggle.bottom
            anchors.topMargin: 80

            // label
            Text {
                text: qsTr("Date")
                font.pointSize: title3
                color: textColor

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.top
                anchors.bottomMargin: 5
            }

            TextInput {
                id: amountInput
                font.pointSize: title2
                height: parent.height
                width: parent.width
                color: textColor

                horizontalAlignment: Text.Center
                verticalAlignment: Text.Center

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // amount box
        Rectangle {
            id: amountBox
            width: parent.width-40
            height: 35
            color: boxBgLight

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: dateBox.bottom
            anchors.topMargin: 80

            // label
            Text {
                text: qsTr("Amount")
                font.pointSize: title3
                color: textColor

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.top
                anchors.bottomMargin: 5
            }

            TextInput {
                id: dateInput
                font.pointSize: title2
                height: parent.height
                width: parent.width
                color: textColor

                horizontalAlignment: Text.Center
                verticalAlignment: Text.Center

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // vendor box
        Rectangle {
            id: vendorBox
            width: parent.width-40
            height: 35
            color: boxBgLight

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: amountBox.bottom
            anchors.topMargin: 80

            // label
            Text {
                text: qsTr("Vendor")
                font.pointSize: title3
                color: textColor

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.top
                anchors.bottomMargin: 5
            }

            TextInput {
                id: vendorInput
                font.pointSize: title2
                height: parent.height
                width: parent.width
                color: textColor

                horizontalAlignment: Text.Center
                verticalAlignment: Text.Center

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // category picker
        ComboBox {
            id: catBox
            width: trsBar.width-40
            height: 35

            anchors.top: vendorBox.bottom
            anchors.topMargin: 80
            anchors.horizontalCenter: trsBar.horizontalCenter

            font.pointSize: 24


            model: [ "Banana", "Apple", "Coconut" ]

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
            anchors.bottomMargin: 40

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

    // top bar
    Rectangle {
        id: topBar
        width: parent.width - sideTab.width - trsBar.width
        height: 50
        color: boxBg

        anchors.left: sideTab.right
        anchors.top: parent.top

        // all transaction tab
        Button {
            id: trsTabButton
            width: 200
            height: 30
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
                color: slcColor
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = slcColor
                    onExited: parent.color = slcColor
                }
            }
        }

        // recurring transactions tab
        Button {
            id: recTabButton
            width: 200
            height: 30
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
                color: boxBgLight
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = slcColor
                    onExited: parent.color = boxBgLight
                }
            }
        }

        // categories tab
        Button {
            id: catTabButton
            width: 200
            height: 30
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
            width: 200
            height: 30
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
        anchors.topMargin: 20
    }

    // headers
    Text {
        id: dateHeader
        text: "Date"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: expTable.left
        anchors.leftMargin: 65
        anchors.bottom: expTable.top
        anchors.bottomMargin: 10
    }
    Text {
        id: amountHeader
        text: "Amount"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: dateHeader.right
        anchors.leftMargin: 115
        anchors.bottom: expTable.top
        anchors.bottomMargin: 10
    }
    Text {
        id: vendorHeader
        text: "Vendor"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: amountHeader.right
        anchors.leftMargin: 95
        anchors.bottom: expTable.top
        anchors.bottomMargin: 10
    }
    Text {
        id: catHeader
        text: "Category"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: vendorHeader.right
        anchors.leftMargin: 85
        anchors.bottom: expTable.top
        anchors.bottomMargin: 10
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

        ScrollBar.vertical: ScrollBar.AlwaysOn

        model: TableModel {
            TableModelColumn { display: "Date" }
            TableModelColumn { display: "Amount" }
            TableModelColumn { display: "Vendor" }
            TableModelColumn { display: "Category" }

            rows: [
                {
                    "Date": "13.2.2022",
                    "Amount": "250€",
                    "Vendor": "KSM",
                    "Category": "Groceries"
                },
                {
                    "Date": "14.2.2022",
                    "Amount": "25€",
                    "Vendor": "Sodexo",
                    "Category": "School food"
                },
                {
                    "Date": "15.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "16.2.2022",
                    "Amount": "40€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
            ]
        }

        delegate: Rectangle {
            color: boxBgLight
            implicitWidth: 210
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
        id: incDateHeader
        text: "Date"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incTable.left
        anchors.leftMargin: 65
        anchors.bottom: incTable.top
        anchors.bottomMargin: 10
    }
    Text {
        id: incAmountHeader
        text: "Amount"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incDateHeader.right
        anchors.leftMargin: 115
        anchors.bottom: incTable.top
        anchors.bottomMargin: 10
    }
    Text {
        id: incVendorHeader
        text: "Vendor"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incAmountHeader.right
        anchors.leftMargin: 95
        anchors.bottom: incTable.top
        anchors.bottomMargin: 10
    }
    Text {
        id: incCatHeader
        text: "Category"
        font.pointSize: title1
        color: textColor
        font.bold: true

        anchors.left: incVendorHeader.right
        anchors.leftMargin: 85
        anchors.bottom: incTable.top
        anchors.bottomMargin: 10
    }

    // expense table
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

        ScrollBar.vertical: ScrollBar.AlwaysOn

        model: TableModel {
            TableModelColumn { display: "Date" }
            TableModelColumn { display: "Amount" }
            TableModelColumn { display: "Vendor" }
            TableModelColumn { display: "Category" }

            rows: [
                {
                    "Date": "13.2.2022",
                    "Amount": "250€",
                    "Vendor": "KSM",
                    "Category": "Groceries"
                },
                {
                    "Date": "14.2.2022",
                    "Amount": "25€",
                    "Vendor": "Sodexo",
                    "Category": "School food"
                },
                {
                    "Date": "15.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "16.2.2022",
                    "Amount": "40€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
                {
                    "Date": "17.2.2022",
                    "Amount": "20€",
                    "Vendor": "Ranta",
                    "Category": "Going out"
                },
            ]
        }

        delegate: Rectangle {
            color: boxBgLight
            implicitWidth: 210
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
