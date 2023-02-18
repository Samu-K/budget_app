import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts
import Qt.labs.qmlmodels 1.0
import "qrc:/pages/shared"
import "qrc:/."

Rectangle {
    id: root
    visible: true
    color: Styling.app

    width: screen.width
    height: screen.height

    // top bar
    Rectangle {
        id: topBar
        width: parent.width
        height: Styling.topBarHeight
        color: Styling.darkBg

        anchors.top: parent.top
    }

    // component for listview buttons
    Component {
        id: listButton
        Button {
            width: accountList.width
            height: root.height*(0.05)

            Text {
                text: buttonText
                color: Styling.txtColor
                font.pixelSize: Styling.title3
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

    // accounts
    ListView {
        id: accountList
        width: root.width*(0.2)
        height: root.height*(0.275)

        // root top
        anchors.top: root.top
        anchors.topMargin: root.height*(0.05)+Styling.topBarHeight
        anchors.left: parent.left
        anchors.leftMargin: Styling.loaderMargin

        model: [qsTr("Credit card"), qsTr("Investments"), qsTr("Savings")]

        delegate: Loader {
            sourceComponent: listButton
            property string buttonText: modelData
        }

        // label
        Text {
            id: accountLabel
            text: qsTr("Accounts")
            font.pixelSize: Styling.title2
            color: Styling.txtColor

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: Styling.titleMargin
        }
    }

    // quick links
    ListView {
        id: linkList
        width: accountList.width
        height: accountList.height

        anchors.horizontalCenter: accountList.horizontalCenter
        anchors.top: accountList.bottom

        model: [qsTr("Add transaction"), qsTr("Add account"), qsTr("Export data")]

        delegate: Loader {
            sourceComponent: listButton
            property string buttonText: modelData
        }

        // label
        Text {
            id: linkLabel
            text: qsTr("Quick links")
            font.pixelSize: Styling.title2
            color: Styling.txtColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: Styling.titleMargin

            // settings for quick links
            LeftTabButton {
                iconSource: "qrc:/design/settings_white.png"
                iconSize: root.height*(0.045)

                anchors.left: parent.right
                anchors.leftMargin: accountList.width*(0.1)
                anchors.top: parent.top
            }
        }
    }

    // Summary
    Rectangle {
        id: sumBg
        width: root.width*(0.72)
        color: Styling.lightBg

        anchors.left: accountList.right
        anchors.leftMargin: root.width*(0.017)

        anchors.top: accountList.top
        anchors.bottom: linkList.bottom
        //anchors.bottomMargin: root.height*(0.075)

        // Label
        Text {
            id: sumLabel
            text: qsTr("Summary")
            font.pixelSize: Styling.title
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
                id: expSeries
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
            id: dateBg
            width: parent.width
            height: root.height*(0.035)
            color: Styling.darkBg

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            RowLayout {
                id: dateRow
                spacing: parent.width*(1/6)
                height: parent.height

                anchors.left: parent.left
                anchors.right: parent.right

                anchors.leftMargin: spacing
                anchors.rightMargin: spacing

                Repeater {
                    model: ["1/22", "2/22", "3/22"]

                    Text {
                        text: modelData
                        font.pixelSize: Styling.norm
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
        height: root.height*(0.065)

        color: Styling.darkBg
        anchors.horizontalCenter: sumBg.horizontalCenter
        anchors.bottom: linkList.bottom

        RowLayout {
            id: dateButtons
            height: dateSelectBg.height

            anchors.left: parent.left
            anchors.leftMargin: spacing
            anchors.right: parent.right
            anchors.rightMargin: spacing
            spacing: 0

            Repeater {
                model: ["3M","6M", "1Y", "3Y", "5Y", "Max"]

                Button {
                    font.pixelSize: Styling.title2
                    Layout.preferredWidth: dateButtons.width*(1/6)
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
        id: monthBg
        width: (root.width-leftTab.width)/2 - root.width*(0.04)
        height: root.height*(0.20)
        color: Styling.darkBg

        anchors.top: dateSelectBg.bottom
        anchors.topMargin: root.height*(0.1)
        anchors.right: dateSelectBg.right

        // Label
        Rectangle {
            id: monthLabel
            width: parent.width
            height: root.height*(0.06)
            color: Styling.darkBg

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: Styling.titleMargin*2

            Text {
                text: qsTr("Current month")
                font.pixelSize: Styling.title2
                color: Styling.txtColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Component {
            id: infoBox
            Rectangle {
                id: bg
                width: root.width*(0.135)
                height: root.height*(0.06)
                color: Styling.lightBg

                Text {
                    id: label
                    text: labelText
                    color: Styling.txtColor
                    font.pixelSize: Styling.title3
                    anchors.bottom: parent.top
                    anchors.bottomMargin: Styling.titleMargin
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: amountTxt
                    text: amountText
                    color: Styling.txtColor
                    font.pixelSize: Styling.title2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                }
            }
        }

        Loader {
            id: expBox
            sourceComponent: infoBox
            property string labelText: "Expenses"
            property string amountText: "150€"

            anchors.left: monthBg.left
            anchors.leftMargin: root.width*(0.02)
            anchors.top: monthBg.top
            anchors.topMargin: root.height*(0.04)
        }

        Loader {
            id: incBox
            sourceComponent: infoBox
            property string labelText: "Income"
            property string amountText: "350€"

            anchors.right: monthBg.right
            anchors.rightMargin: root.width*(0.02)
            anchors.top: monthBg.top
            anchors.topMargin: expBox.anchors.topMargin
        }

        Loader {
            id: savingsBox
            sourceComponent: infoBox
            width: root.width*(0.18)
            property string labelText: "Savings"
            property string amountText: "+ 200€"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: monthBg.bottom
            anchors.bottomMargin: root.height*(0.015)

        }

    }

    // recent transactions bg
    Rectangle {
        id: trsBox
        width: trsLabel.width
        height: monthBg.height
        color: Styling.darkBg

        anchors.top: monthBg.top
        anchors.left: linkList.left

        // recent transactions text
        Rectangle {
            id: trsLabel
            width: monthLabel.width
            height: monthLabel.height
            color: Styling.darkBg

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.top
            anchors.bottomMargin: Styling.titleMargin*2

            Text {
                text: qsTr("Recent transactions")
                font.pixelSize: Styling.title2
                color: Styling.txtColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        // trs table
        TableView {
            id: trsTable
            width: parent.width
            height: parent.height

            anchors.horizontalCenter: trsBox.horizontalCenter
            anchors.top: trsBox.top
            anchors.topMargin: root.height*(0.02)
            columnSpacing: 0

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
                implicitHeight: parent.height*(1/5)
                implicitWidth: parent.width*(1/6)

                Text {
                    text: date
                    font.pixelSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: trsBox.width*(1/20)
                }
                Text {
                    text: amount
                    font.pixelSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: trsBox.width*(1/3)
                }
                Text {
                    text: vendor
                    font.pixelSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: trsBox.width*(1/3)*1.75
                }
                Text {
                    text: category
                    font.pixelSize: 20
                    color: "white"
                    anchors.left: parent.left
                    anchors.leftMargin: trsBox.width*(8/10)
                }
            }
        }
    }
}
