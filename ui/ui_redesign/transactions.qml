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
            height: 350
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

            // expense category list
            ListView {
                id: expCatList
                width: parent.width / 2
                height: parent.height

                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 30

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
                anchors.top: parent.top
                anchors.topMargin: 30

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

            // category list titles
            Text {
                text: qsTr("Expense")
                font.pixelSize: title2
                color: textColor

                anchors.bottom: expCatList.top
                anchors.horizontalCenter: expCatList.horizontalCenter
            }
            Text {
                text: qsTr("Income")
                font.pixelSize: title2
                color: textColor

                anchors.bottom: incCatList.top
                anchors.horizontalCenter: incCatList.horizontalCenter
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
    }
}
