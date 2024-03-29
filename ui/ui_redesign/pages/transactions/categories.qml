import QtQuick 2.15
import Qt.labs.qmlmodels
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/."
import "qrc:/pages/shared"
import "qrc:/pages/transactions/components"
import "qrc:/pages/transactions/components/table"
import "qrc:/pages/transactions/components/trsbar"

Rectangle {
    id: root
    visible: true

    width: screen.width
    height: screen.height
    color: Styling.app

    // top bar
    Rectangle {
        id: topBar
        width: parent.width
        height: Styling.topBarHeight
        color: Styling.darkBg

        anchors.top: parent.top

        RowLayout {
            objectName: "buttonLayout"
            id: topButtons
            height: parent.height

            spacing: 10
            anchors.left: parent.left
            anchors.leftMargin: Styling.loaderMargin
            anchors.bottom: parent.bottom

            TopBarButton {
                objectName: "allTrsButton"
                buttonText: "all transactions"
                Layout.alignment: Qt.AlignBottom
            }
            TopBarButton {
                objectName: "recTrsButton"
                buttonText: "recurring"
                Layout.alignment: Qt.AlignBottom
            }
            TopBarButton {
                objectName: "catButton"
                buttonText: "categories"
                Layout.alignment: Qt.AlignBottom
            }
            TopBarButton {
                objectName: "accButton"
                buttonText: "accounts"
                Layout.alignment: Qt.AlignBottom
            }
        }


    }

    // transactions screen divider
    Rectangle {
        id: trsDiv
        width: topBar.width
        height: 10
        color: Styling.lightBg

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: topBar.height/2
        anchors.left: topBar.left
    }

    // titles
    Text {
        id: expTableTitle
        text: qsTr("Expense categories")
        font.pointSize: Styling.title2
        font.bold: true
        color: Styling.txtColor

        anchors.left: parent.left
        anchors.leftMargin: Styling.loaderMargin
        anchors.top: topBar.bottom
        anchors.topMargin: 10

        // add new category
        LeftTabButton {
            id: newInc
            iconSource: "qrc:/design/plus.png"
            bgHeight: 120
            iconSize: 35

            anchors.left: parent.right
            anchors.leftMargin: 30
            anchors.top: parent.top
        }
    }
    Text {
        id: incTableTitle
        text: qsTr("Income categories")
        font.pointSize: Styling.title2
        font.bold: true
        color: Styling.txtColor

        anchors.left: parent.left
        anchors.leftMargin: Styling.loaderMargin
        anchors.top: trsDiv.bottom
        anchors.topMargin: 10

        // add new category
        LeftTabButton {
            id: newExp
            iconSource: "qrc:/design/plus.png"
            bgHeight: 120
            iconSize: 35

            anchors.left: parent.right
            anchors.leftMargin: 30
            anchors.top: parent.top
        }
    }

    // categories
    Component {
        id: catTable
        GridLayout {
            id: grid
            columns: root.width*(1/205)
            columnSpacing: 50
            //rowSpacing: 10

            Repeater {
                model: cats

                Text {
                    id: txt
                    text: modelData
                    font.pixelSize: Styling.title3
                    color: Styling.txtColor

                    Button {
                        id: delButton
                        implicitWidth: 20
                        implicitHeight: implicitWidth

                        anchors.left: parent.right
                        anchors.leftMargin: 5

                        anchors.verticalCenter: parent.verticalCenter

                        background: Rectangle {
                            anchors.fill: parent
                            radius: parent.implicitWidth
                            color: "black"

                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter

                                implicitWidth: delButton.implicitWidth-10
                                implicitHeight: delButton.implicitHeight/5
                                color: "white"
                            }
                        }
                    }
                }
            }
        }
    }

    Loader {
        id: incTable
        sourceComponent: catTable
        property var cats: ["Social benefits","Salary","Loans","Payback","Social benefits","Salary","Loans","Payback","Social benefits","Salary","Loans","Payback","Social benefits","Salary","Loans","Payback"]

        anchors.top: incTableTitle.bottom
        anchors.bottom: root.bottom

        anchors.topMargin: 25
        anchors.left: incTableTitle.left
    }

    Loader {
        id: expTable
        sourceComponent: catTable
        property var cats: ["Groceries","Going out","Shopping","Rent","Books","Subscriptions","Groceries","Going out","Shopping","Rent","Books","Subscriptions","Groceries","Going out","Shopping","Rent","Books","Subscriptions","Groceries","Going out","Shopping","Rent","Books","Subscriptions"]

        anchors.top: expTableTitle.bottom
        anchors.bottom: trsDiv.top

        anchors.topMargin: 25
        anchors.left: expTableTitle.left
    }

}
