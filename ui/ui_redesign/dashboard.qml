import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    visible: true
    color: "#236BAE"

    title: qsTr("Budgetor")
    width: screen.width
    height: screen.height

    // side tab
    Rectangle {
        id: sideTab
        width: 148
        height: root.height
        color: "#2C3139"

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

                color: sideTab.color

                Image {
                    width: 80
                    height: 75
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5

                    source: "qrc:/design/dash.png"

                    Text {
                        text: qsTr("Analytics")
                        font.pointSize: 24
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#5E5E5E"
                    }
                    onExited: {
                        parent.color = sideTab.color
                    }
                }
            }

            // transaction
            Rectangle {
                id: trsButton
                Layout.preferredWidth:  parent.width
                Layout.preferredHeight: 120
                Layout.alignment: Qt.AlignCenter

                color: sideTab.color

                Image {
                    width: 80
                    height: 75
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5

                    source: "qrc:/design/transaction.png"

                    Text {
                        text: qsTr("Transactions")
                        font.pointSize: 24
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#5E5E5E"
                    }
                    onExited: {
                        parent.color = sideTab.color
                    }
                }
            }

            // analytics
            Rectangle {
                id: anlButton
                Layout.preferredWidth:  parent.width
                Layout.preferredHeight: 120
                Layout.alignment: Qt.AlignCenter

                color: sideTab.color

                Image {
                    width: 80
                    height: 75
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5


                    source: "qrc:/design/analytics.png"

                    Text {
                        text: qsTr("Analytics")
                        font.pointSize: 24
                        color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#5E5E5E"
                    }
                    onExited: {
                        parent.color = sideTab.color
                    }
                }
            }
        }

        // optins and account
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

                color: sideTab.color

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
                        userButton.color = "#5E5E5E"
                    }
                    onExited: {
                        userButton.color = sideTab.color
                    }
                }
            }

            // settings button
            Rectangle {
                id: settingsButton
                Layout.preferredWidth: sideTab.width
                Layout.preferredHeight: 85
                Layout.alignment: Qt.AlignCenter

                color: sideTab.color

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
                        settingsButton.color = "#5E5E5E"
                    }
                    onExited: {
                        settingsButton.color = sideTab.color
                    }
                }
            }
        }
    }

    // accounts text
    Text {
        id: actText
        text: qsTr("Accounts")
        font.pointSize: 32
        color: "white"
        anchors.left: sideTab.right
        anchors.leftMargin: 100
        anchors.top: parent.top
        anchors.topMargin: 35
    }

    // accounts
    ListView {
        id: accountList
        width: 280
        height: 190
        anchors.horizontalCenter: actText.horizontalCenter
        anchors.top: actText.bottom
        anchors.topMargin: 10

        model: ["Credit card", "Investments", "Savings"]

        delegate: Button {
            text: modelData
            width: accountList.width
            font.pointSize: 26

            background: Rectangle {
                color: sideTab.color
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "#5E5E5E"
                    onExited: parent.color = sideTab.color
                }
            }
        }
    }

    // quick links
    Text {
        id: qckText
        text: qsTr("Quick links")
        font.pointSize: 32
        color: "white"
        anchors.horizontalCenter: actText.horizontalCenter
        anchors.top: accountList.bottom
        anchors.topMargin: 5
    }

    Image {
        width: 35
        height: 35
        anchors.left: qckText.right
        anchors.leftMargin: 10
        anchors.bottom: qckText.bottom

        source: "qrc:/design/settings_white.png"

    }


    // quick links buttons
    ListView {
        id: qckList
        width: 280
        height: 190
        anchors.horizontalCenter: qckText.horizontalCenter
        anchors.top: qckText.bottom
        anchors.topMargin: 10

        model: ["Add transaction", "Add account", "Export data"]

        delegate: Button {
            text: modelData
            width: qckList.width
            font.pointSize: 26

            background: Rectangle {
                color: sideTab.color
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "#5E5E5E"
                    onExited: parent.color = sideTab.color
                }
            }
        }
    }

    // Summary screen
    Text {
        id: sumText
        text: qsTr("Summary")
        font.pointSize: 32
        color: "white"

        anchors.left: accountList.right
        anchors.leftMargin: 25
        anchors.verticalCenter: actText.verticalCenter

    }

    // Summary background
    Rectangle {
        id: sumBg
        width: 860
        color: "#8E9EB8"
        anchors.left: accountList.right
        anchors.leftMargin: 25
        anchors.top: accountList.top
        anchors.bottom: qckList.bottom
        anchors.bottomMargin: 65
    }

    // date select
    Rectangle {
        id: dateSelectBg
        width: sumBg.width
        height: 50
        color: sideTab.color
        anchors.horizontalCenter: sumBg.horizontalCenter
        anchors.bottom: qckList.bottom

        // quick links buttons
        RowLayout {
            id: dateButtons
            spacing: 80
            anchors.left: parent.left
            anchors.leftMargin: 80
            anchors.right: parent.right
            anchors.rightMargin: 80

            height: dateSelectBg.height
            Repeater {
                model: ["3M","6M", "1Y", "3Y", "5Y", "Max"]

                Button {
                    text: modelData
                    font.pointSize: 26

                    background: Rectangle {
                        color: sideTab.color
                        anchors.top: dateSelectBg.top
                        anchors.bottom: dateSelectBg.bottom

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: parent.color = "#5E5E5E"
                            onExited: parent.color = dateSelectBg.color
                        }
                    }
                }
            }
        }
    }
}
