import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts

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
                        text: qsTr("Dashboard")
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

        model: [qsTr("Credit card"), qsTr("Investments"), qsTr("Savings")]

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

    // settings for quick links
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

        model: [qsTr("Add transaction"), qsTr("Add account"), qsTr("Export data")]

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

        // bars
        ChartView {
            width: parent.width
            height: parent.height
            margins.bottom: 0
            anchors.fill: parent.fill

            antialiasing: true
            legend.visible: false

            backgroundColor: sumBg.color
            BarSeries {
                id: mySeries
                barWidth: 1

                axisX: BarCategoryAxis {
                    color: sumBg.color
                    gridVisible: false
                    labelsVisible: false
                }
                axisY: BarCategoryAxis {
                    color: sumBg.color
                    gridVisible: false
                }

                BarSet { label: "Spending"; values: [5, 12, 32, 21, 15, 6,12,30,2,17]; color:"green" }
            }
        }

        // date axis
        Rectangle {
            id: sumDateBg
            width: parent.width
            height: 25
            color: sideTab.color

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            RowLayout {
                id: sumDates
                spacing: 100
                height: parent.height

                anchors.left: parent.left
                anchors.right: parent.right

                anchors.leftMargin: spacing
                anchors.rightMargin: spacing

                Repeater {
                    model: ["1/22", "2/22", "3/22"]

                    Text {
                        text: modelData
                        font.pointSize: 20
                        color: "white"
                    }
                }

            }
        }
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
            spacing: 30
            anchors.left: parent.left
            anchors.leftMargin: spacing
            anchors.right: parent.right
            anchors.rightMargin: spacing

            height: dateSelectBg.height
            Repeater {
                model: ["3M","6M", "1Y", "3Y", "5Y", "Max"]

                Button {
                    text: modelData
                    font.pointSize: 26
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: dateSelectBg.height

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

    // current  text
    Rectangle {
        id: crMonthText
        width: (root.width-sideTab.width)/2 -80
        height: 50
        color: sideTab.color
        anchors.top: dateSelectBg.bottom
        anchors.topMargin: 25
        anchors.right: sumBg.right

        Text {
            text: qsTr("Current month")
            font.pointSize: 36
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // current month info
    Rectangle {
        id: crMonthBg
        width: crMonthText.width
        height: 165
        color: sideTab.color

        anchors.top: crMonthText.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: crMonthText.horizontalCenter

        // expenses
        Rectangle {
            id: expBox
            width: 200
            height: 50
            color: sumBg.color

            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 30

            Text {
                text: qsTr("Expenses")
                font.pointSize: 24
                color: "white"

                anchors.bottom: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // amount
            Text {
                text: "100€"
                font.pointSize: 32
                color: "white"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // income
        Rectangle {
            id: incBox
            width: 200
            height: 50
            color: sumBg.color

            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.top: parent.top
            anchors.topMargin: 30

            // title
            Text {
                text: qsTr("Income")
                font.pointSize: 24
                color: "white"

                anchors.bottom: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // amount
            Text {
                text: "456€"
                font.pointSize: 32
                color: "white"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // savings
        Rectangle {
            id: svsBox
            width: 250
            height: 50
            color: sumBg.color

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter

            // title
            Text {
                text: qsTr("Total")
                font.pointSize: 24
                color: "white"

                anchors.bottom: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
            // amount
            Text {
                text: "+ 356€"
                font.pointSize: 32
                color: "white"

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    // recent transactions text
    Rectangle {
        id: trsText
        width: crMonthText.width
        height: crMonthText.height
        color: sideTab.color
        anchors.top: dateSelectBg.bottom
        anchors.topMargin: 25
        anchors.left: qckList.left

        Text {
            text: qsTr("Recent transactions")
            font.pointSize: 36
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // recent transactions bg
    Rectangle {
        id: trsBox
        width: trsText.width
        height: 165
        color: sideTab.color

        anchors.top: trsText.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: trsText.horizontalCenter

        // expense table
        GridLayout {
            id: expGrid
            columns: 4
            columnSpacing: 60

            anchors.horizontalCenter: trsBox.horizontalCenter
            anchors.top: trsBox.top
            anchors.topMargin: 10

            Text { text: "13.3.2022"; font.pointSize:20; color: "white" }
            Text { text: "- 350€"; font.pointSize:20; color: "white" }
            Text { text: "KSM"; font.pointSize:20; color: "white" }
            Text { text: "Groceries"; font.pointSize: 20; color: "white" }

            Text { text: "14.3.2022"; font.pointSize:20; color: "white" }
            Text { text: "- 3.20€"; font.pointSize:20; color: "white" }
            Text { text: "Sodexo"; font.pointSize:20; color: "white" }
            Text { text: "School food"; font.pointSize: 20; color: "white" }

            Text { text: "15.3.2022"; font.pointSize:20; color: "white" }
            Text { text: "- 20€"; font.pointSize:20; color: "white" }
            Text { text: "Poro"; font.pointSize:20; color: "white" }
            Text { text: "Going out"; font.pointSize: 20; color: "white" }

            Text { text: "16.3.2022"; font.pointSize:20; color: "white" }
            Text { text: "+ 124€"; font.pointSize:20; color: "white" }
            Text { text: "Kela"; font.pointSize:20; color: "white" }
            Text { text: "Social support"; font.pointSize: 20; color: "white" }
        }


    }

}
