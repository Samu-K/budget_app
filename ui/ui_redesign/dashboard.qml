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
            spacing: 55
            anchors.horizontalCenter: sideTab.horizontalCenter
            anchors.top: sideTab.top
            anchors.topMargin: 35

            Rectangle {
                Layout.preferredWidth:  104
                Layout.preferredHeight: width
                Layout.alignment: Qt.AlignCenter

                radius: sideTab.width*0.5
                color: "black"

                Text {
                    text: qsTr("Dashboard")
                    font.pointSize: 24
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    anchors.topMargin: 10
                }
            }

            Rectangle {
                Layout.preferredWidth:  104
                Layout.preferredHeight: width
                Layout.alignment: Qt.AlignCenter

                radius: sideTab.width*0.5
                color: "black"

                Text {
                    text: qsTr("Transactions")
                    font.pointSize: 24
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    anchors.topMargin: 10
                }
            }

            Rectangle {
                Layout.preferredWidth:  104
                Layout.preferredHeight: width
                Layout.alignment: Qt.AlignCenter

                radius: sideTab.width*0.5
                color: "black"

                Text {
                    text: qsTr("Analytics")
                    font.pointSize: 24
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    anchors.topMargin: 10
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

            Rectangle {
                Layout.preferredWidth: 72
                Layout.preferredHeight: width
                Layout.alignment: Qt.AlignCenter

                radius: width*0.5
                color: "black"
            }

            Rectangle {
                Layout.preferredWidth: 72
                Layout.preferredHeight: width
                Layout.alignment: Qt.AlignCenter

                radius: width*0.5
                color: "black"
            }
        }
    }
}
