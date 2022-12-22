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
            spacing: 80
            anchors.horizontalCenter: sideTab.horizontalCenter
            anchors.top: sideTab.top
            anchors.topMargin: 35

            // dashboard
            Image  {
                Layout.preferredWidth:  80
                Layout.preferredHeight: 70
                Layout.alignment: Qt.AlignCenter

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

            // transactions
            Image {
                Layout.preferredWidth:  80
                Layout.preferredHeight: 70
                Layout.alignment: Qt.AlignCenter

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

            // analytics
            Image {
                Layout.preferredWidth:  80
                Layout.preferredHeight: 70
                Layout.alignment: Qt.AlignCenter

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
        }

        // optins and account
        ColumnLayout {
            width: sideTab.width
            spacing: 25
            anchors.horizontalCenter: sideTab.horizontalCenter
            anchors.bottom: sideTab.bottom
            anchors.bottomMargin: 25

            Image {
                Layout.preferredWidth: 90
                Layout.preferredHeight: 90
                Layout.alignment: Qt.AlignCenter

                source: "qrc:/design/user_icon_colored.png"
            }

            Image {
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                Layout.alignment: Qt.AlignCenter

                source: "qrc:/design/settings_white.png"
            }
        }
    }
}
