import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts
import Qt.labs.qmlmodels 1.0
import "qrc:/pages/shared"
import "qrc:/."

ApplicationWindow {
    id: root
    visible: true
    color: Styling.app

    title: qsTr("Budgetor")
    width: screen.width
    height: screen.height

    LeftTab {
        id: sideTab
    }

    // component for listview buttons
    Component {
        id: listButton
        Button {
            width: parent.parent.width
            height: 40
            Text {
                text: buttonText
                color: Styling.txtColor
                font.pointSize: Styling.title3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            background: Rectangle {
                color: Styling.darkBg
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = Styling.slcColor
                    onExited: parent.color = Styling.darkBg
                }
            }
        }
    }

    // accounts text
    Text {
        id: actText
        text: qsTr("Accounts")
        font.pointSize: Styling.title2
        color: Styling.txtColor
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

        delegate: Loader {
            sourceComponent: listButton
            property string buttonText: modelData
        }
    }

    // quick links
    ListView {
        id: qckList
        width: 280
        height: 190
        anchors.horizontalCenter: actText.horizontalCenter
        anchors.top: accountList.bottom

        model: [qsTr("Add transaction"), qsTr("Add account"), qsTr("Export data")]

        delegate: Loader {
            sourceComponent: listButton
            property string buttonText: modelData
        }

        // label
        Text {
            id: qckText
            text: qsTr("Quick links")
            font.pointSize: Styling.title2
            color: Styling.txtColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: Styling.titleMargin

            // settings for quick links
            LeftTabButton {
                iconSource: "qrc:/design/settings_white.png"
                iconSize: 30

                anchors.left: parent.right
                anchors.leftMargin: 30
                anchors.top: parent.top
            }
        }
    }

    // Summary
    Rectangle {
        id: sumBg
        width: 860
        color: Styling.lightBg
        anchors.left: accountList.right
        anchors.leftMargin: 25
        anchors.top: accountList.top
        anchors.bottom: qckList.bottom
        anchors.bottomMargin: 65

        // Label
        Text {
            id: sumText
            text: qsTr("Summary")
            font.pointSize: Styling.title
            color: Styling.txtColor

            anchors.bottom: parent.top
            anchors.bottomMargin: Styling.titleMargin
            anchors.horizontalCenter: parent.horizontalCenter

        }

        // bars
        ChartView {
            width: parent.width
            height: parent.height
            margins.bottom: 0
            anchors.fill: parent.fill

            antialiasing: true
            legend.visible: false

            backgroundColor: Styling.lightBg
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
            color: Styling.darkBg

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
                        font.pointSize: Styling.norm
                        color: Styling.txtColor
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
        color: Styling.darkBg
        anchors.horizontalCenter: sumBg.horizontalCenter
        anchors.bottom: qckList.bottom

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
                    font.pointSize: Styling.title2
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: dateSelectBg.height

                    // Label
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: Styling.title2
                        color: Styling.txtColor
                        text: modelData
                    }

                    background: Rectangle {
                        color: Styling.darkBg
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: parent.color = Styling.slcColor
                            onExited: parent.color = dateSelectBg.color
                        }
                    }
                }
            }
        }
    }

    // current month info
    Rectangle {
        id: crMonthBg
        width: crMonthText.width
        height: 190
        color: Styling.darkBg

        anchors.top: trsBox.top
        anchors.right: dateSelectBg.right


        // Label
        Rectangle {
            id: crMonthText
            width: (root.width-sideTab.width)/2 -80
            height: 50
            color: Styling.darkBg
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: Styling.titleMargin*2

            Text {
                text: qsTr("Current month")
                font.pointSize: Styling.title2
                color: Styling.txtColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Component {
            id: infoBox

            Rectangle {
                id: bg
                width: 180
                height: 50
                color: Styling.lightBg

                Text {
                    id: label
                    text: labelText
                    color: Styling.txtColor
                    font.pointSize: Styling.title3
                    anchors.bottom: parent.top
                    anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: amountTxt
                    text: amountText
                    color: Styling.txtColor
                    font.pointSize: Styling.title2
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
        color: Styling.darkBg
        anchors.top: dateSelectBg.bottom
        anchors.topMargin: 25
        anchors.left: qckList.left

        Text {
            text: qsTr("Recent transactions")
            font.pointSize: Styling.title2
            color: Styling.txtColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // recent transactions bg
    Rectangle {
        id: trsBox
        width: trsText.width
        height: 190
        color: Styling.darkBg

        anchors.top: trsText.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: trsText.horizontalCenter

        // expense table
        TableView {
            id: expGrid
            width: parent.width
            height: parent.height

            anchors.horizontalCenter: trsBox.horizontalCenter
            anchors.top: trsBox.top
            anchors.topMargin: 20

            interactive: false

            ListModel {
                id: trsList

                ListElement {
                    date: "13.3.2022"
                    amount: "- 350€"
                    vendor: "KSM"
                    category: "Groceries"
                }
                ListElement {
                    date: "13.3.2022"
                    amount: "- 320€"
                    vendor: "Isabel"
                    category: "Rent"
                }
                ListElement {
                    date: "15.4.2022"
                    amount: "- 15€"
                    vendor: "Roosa"
                    category: "Debts"
                }
                ListElement {
                    date: "13.3.2022"
                    amount: "+ 124€"
                    vendor: "Kela"
                    category: "Social Support"
                }
            }

            model: trsList
            delegate: Rectangle {
                color: "transparent"
                implicitHeight: 35
                implicitWidth: 100

                Text {
                    text: date
                    font.pointSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*(1/2)
                }
                Text {
                    text: amount
                    font.pointSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*2
                }
                Text {
                    text: vendor
                    font.pointSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*3
                }
                Text {
                    text: category
                    font.pointSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*4
                }
            }
        }
    }
}
