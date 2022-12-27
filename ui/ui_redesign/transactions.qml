import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts


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

                color: boxBg

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
                        parent.color = boxBg
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
                color: "red"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "darkRed"
                    onExited: parent.color = "red"
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
                color: "green"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "darkGreen"
                    onExited: parent.color = "green"
                }
            }
        }

        // amount box
        Rectangle {
            id: amountBox
            width: parent.width-40
            height: 35
            color: boxBgLight

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: incToggle.bottom
            anchors.topMargin: 70

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

        // vendor box
        Rectangle {
            id: vendorBox
            width: parent.width-40
            height: 35
            color: boxBgLight

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: amountBox.bottom
            anchors.topMargin: 70

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
        Rectangle {
            id: catBox
            width: parent.width-40
            height: 280
            color: boxBgLight

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: vendorBox.bottom
            anchors.topMargin: 70


            // label
            Text {
                text: qsTr("Category")
                font.pointSize: title3
                color: textColor

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.top
                anchors.bottomMargin: 5
            }

            // category list titles
            Text {
                id: expText
                text: qsTr("Expense")
                font.pixelSize: title2
                font.bold: true
                color: "black"

                anchors.top: catBox.top
                anchors.right: catBox.right
                anchors.rightMargin: catBox.width/10
            }
            Text {
                id: incText
                text: qsTr("Income")
                font.pixelSize: title2
                font.bold: true
                color: "black"

                anchors.top: catBox.top
                anchors.left: catBox.left
                anchors.leftMargin: catBox.width/10
            }

            // divider
            Rectangle {
                id: catDiv
                width: catBox.width
                height: 5
                color: boxBg

                anchors.top: incText.bottom
                anchors.left: catBox.left
            }

            // expense category list
            ListView {
                id: expCatList
                width: parent.width / 2
                height: parent.height

                anchors.left: parent.left
                anchors.top: catDiv.bottom
                anchors.topMargin: 5

                model: [qsTr("Cat 1"), qsTr("Cat 2"), qsTr("Cat 3")]

                delegate: Button {
                    width: parent.width
                    height: 30
                    Text {
                        text: modelData
                        color: textColor
                        font.pointSize: norm
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

            // income category list
            ListView {
                id: incCatList
                width: parent.width / 2
                height: parent.height

                anchors.right: parent.right
                anchors.top: catDiv.bottom
                anchors.topMargin: 5

                model: [qsTr("iCat 1"), qsTr("iCat 2"), qsTr("iCat 3")]

                delegate: Button {
                    width: parent.width
                    height: 30
                    Text {
                        text: modelData
                        color: textColor
                        font.pointSize: norm
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


        }

        // submit button
        Button {
            width: trsBar.width
            height: 45
            anchors.top: catBox.bottom
            anchors.topMargin: 20

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
        height: 80
        color: boxBg

        anchors.left: sideTab.right
        anchors.top: parent.top

        // all transaction tab
        Button {
            id: trsTabButton
            width: 200
            height: 60
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
            height: 60
            anchors.bottom: topBar.bottom
            anchors.left: trsTabButton.right
            anchors.leftMargin: 10

            Text {
                text: "Recurring\ntransactions"
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
            height: 60
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
            height: 60
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
        width: 10
        height: root.height
        color: boxBgLight

        anchors.top: topBar.bottom
        anchors.horizontalCenter: topBar.horizontalCenter
    }

    // titles
    Text {
        id: expTableTitle
        text: qsTr("Expenses")
        font.pointSize: 38
        color: textColor

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.horizontalCenterOffset: -topBar.width/4
        anchors.top: topBar.bottom
        anchors.topMargin: 20
    }

    Text {
        id: incTableTitle
        text: qsTr("Income")
        font.pointSize: 38
        color: textColor

        anchors.horizontalCenter: trsDiv.horizontalCenter
        anchors.horizontalCenterOffset: topBar.width/4
        anchors.top: topBar.bottom
        anchors.topMargin: 20
    }

    // table headers
    RowLayout {
        id: expHeaders
        spacing: 35

        anchors.horizontalCenter: expTableTitle.horizontalCenter
        anchors.top: expTableTitle.bottom
        anchors.topMargin: 10

        Repeater {
            model: ["Date", "Amount", "Vendor", "Category"]

            Text {
                text: modelData
                font.pointSize: title2
                color: textColor
                horizontalAlignment: Text.Center
                verticalAlignment: Text.Center
            }
        }
    }

    // table headers
    RowLayout {
        id: incHeaders
        spacing: 35

        anchors.horizontalCenter: incTableTitle.horizontalCenter
        anchors.top: incTableTitle.bottom
        anchors.topMargin: 10

        Repeater {
            model: ["Date", "Amount", "Vendor", "Category"]

            Text {
                text: modelData
                font.pointSize: title2
                color: textColor

            }
        }
    }

    // expense table
    GridLayout {
        id: expTable
        columns: 4
        columnSpacing: expHeaders.spacing

        anchors.horizontalCenter: expHeaders.horizontalCenter
        anchors.top: expHeaders.bottom
        anchors.topMargin: 10

        Text { text: "13.3.2022"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "- 350€"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "KSM"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "Groceries"; font.pointSize: norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}

        Text { text: "14.3.2022"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "- 3.20€"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "Sodexo"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "School food"; font.pointSize: norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }

        Text { text: "15.3.2022"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "- 20€"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "Poro"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "Going out"; font.pointSize: norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}

        Text { text: "16.3.2022"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "+ 124€"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "Kela"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "Social support"; font.pointSize: norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
    }

    // income table
    GridLayout {
        id: inctable
        columns: 4
        columnSpacing: incHeaders.spacing

        anchors.left: incHeaders.left
        anchors.top: incHeaders.bottom
        anchors.topMargin: 10

        Text { text: "13.3.2022"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "124 €"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "Kela"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "Social Support"; font.pointSize: norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}

        Text { text: "14.3.2022"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center}
        Text { text: "20€"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "Sami"; font.pointSize:norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }
        Text { text: "Payback"; font.pointSize: norm; color: textColor; verticalAlignment: Text.Center; horizontalAlignment: Text.Center }

    }

}
