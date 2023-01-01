import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts

import "qrc:/pages/shared"

ApplicationWindow {
    // set global variables
    // these are treated as constant

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

    id: root
    visible: true
    color: appBg

    title: qsTr("Budgetor")
    width: screen.width
    height: screen.height

    LeftTab {
        id: sideTab
    }

    // accounts text
    Text {
        id: actText
        text: qsTr("Accounts")
        font.pointSize: title1
        color: textColor
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
            width: accountList.width
            height: 40
            Text {
                text: modelData
                color: textColor
                font.pointSize: title2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            background: Rectangle {
                color: boxBg
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = slcColor
                    onExited: parent.color = boxBg
                }
            }
        }
    }

    // quick links
    Text {
        id: qckText
        text: qsTr("Quick links")
        font.pointSize: title1
        color: textColor
        anchors.horizontalCenter: actText.horizontalCenter
        anchors.top: accountList.bottom
        anchors.topMargin: 5

        // settings for quick links
        LeftTabButton {
            iconSource: "qrc:/design/settings_white.png"
            iconSize: 30

            anchors.left: parent.right
            anchors.leftMargin: 20
            anchors.top: parent.top
        }
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
            width: accountList.width
            height: 40
            Text {
                text: modelData
                color: textColor
                font.pointSize: title2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            background: Rectangle {
                color: boxBg
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = slcColor
                    onExited: parent.color = boxBg
                }
            }
        }
    }

    // Summary screen
    Text {
        id: sumText
        text: qsTr("Summary")
        font.pointSize: title1
        color: textColor

        anchors.left: accountList.right
        anchors.leftMargin: 25
        anchors.verticalCenter: actText.verticalCenter

    }

    // Summary background
    Rectangle {
        id: sumBg
        width: 860
        color: boxBgLight
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

            backgroundColor: boxBgLight
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
            color: boxBg

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
                        font.pointSize: norm
                        color: textColor
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
        color: boxBg
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
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: title2
                        color: textColor
                        text: modelData
                    }
                    font.pointSize: title2
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: dateSelectBg.height


                    background: Rectangle {
                        color: boxBg
                        anchors.top: dateSelectBg.top
                        anchors.bottom: dateSelectBg.bottom

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: parent.color = slcColor
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
        color: boxBg
        anchors.top: dateSelectBg.bottom
        anchors.topMargin: 25
        anchors.right: sumBg.right

        Text {
            text: qsTr("Current month")
            font.pointSize: title1
            color: textColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // current month info
    Rectangle {
        id: crMonthBg
        width: crMonthText.width
        height: 165
        color: boxBg

        anchors.top: crMonthText.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: crMonthText.horizontalCenter

        Component {
            id: infoBox

            Rectangle {
                id: bg
                width: 180
                height: 50
                color: boxBgLight

                Text {
                    id: label
                    text: labelText
                    color: "white"
                    font.pointSize: 24
                    anchors.bottom: parent.top
                    anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: amount
                    text: amountText
                    color: "white"
                    font.pointSize: 32
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                }
            }
        }

        Loader {
            id: expenseBox
            sourceComponent: infoBox
            property string labelText: "Expenses"
            property string amountText: "150€"

            anchors.left: crMonthBg.left
            anchors.leftMargin: 40
            anchors.top: crMonthBg.top
            anchors.topMargin: 40
        }

        Loader {
            id: incomeBox
            sourceComponent: infoBox
            property string labelText: "Income"
            property string amountText: "350€"

            anchors.right: crMonthBg.right
            anchors.rightMargin: 40
            anchors.top: crMonthBg.top
            anchors.topMargin: 40
        }

        Loader {
            id: savingsBox
            sourceComponent: infoBox
            width: 250
            property string labelText: "Savings"
            property string amountText: "+ 200€"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: crMonthBg.bottom
            anchors.bottomMargin: 10

        }

    }

    // recent transactions text
    Rectangle {
        id: trsText
        width: crMonthText.width
        height: crMonthText.height
        color: boxBg
        anchors.top: dateSelectBg.bottom
        anchors.topMargin: 25
        anchors.left: qckList.left

        Text {
            text: qsTr("Recent transactions")
            font.pointSize: title1
            color: textColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // recent transactions bg
    Rectangle {
        id: trsBox
        width: trsText.width
        height: 165
        color: boxBg

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

            Text { text: "13.3.2022"; font.pointSize:norm; color: textColor }
            Text { text: "- 350€"; font.pointSize:norm; color: textColor }
            Text { text: "KSM"; font.pointSize:norm; color: textColor }
            Text { text: "Groceries"; font.pointSize: norm; color: textColor }

            Text { text: "14.3.2022"; font.pointSize:norm; color: textColor }
            Text { text: "- 3.20€"; font.pointSize:norm; color: textColor }
            Text { text: "Sodexo"; font.pointSize:norm; color: textColor }
            Text { text: "School food"; font.pointSize: norm; color: textColor }

            Text { text: "15.3.2022"; font.pointSize:norm; color: textColor }
            Text { text: "- 20€"; font.pointSize:norm; color: textColor }
            Text { text: "Poro"; font.pointSize:norm; color: textColor }
            Text { text: "Going out"; font.pointSize: norm; color: textColor }

            Text { text: "16.3.2022"; font.pointSize:norm; color: textColor }
            Text { text: "+ 124€"; font.pointSize:norm; color: textColor }
            Text { text: "Kela"; font.pointSize:norm; color: textColor }
            Text { text: "Social support"; font.pointSize: norm; color: textColor }
        }
    }
}
