import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts
import Qt.labs.qmlmodels 1.0
import "qrc:/pages/shared"
import "qrc:/."

/*
  This contains the base for all pages (except for login)
  Each page is then loaded onto the empty space in the middle of the page using a loader
*/

ApplicationWindow {
    id: root
    visible: true
    color: Styling.app

    title: qsTr("Budgetor")

    width: screen.width
    height: screen.height

    LeftTab {
        id: leftTab
    }

    Rectangle {
        id: topBar
        width: parent.width - leftTab.width
        height: screen.height*0.03
        color: Styling.darkBg

        anchors.left: leftTab.right
        anchors.top: parent.top
    }
}
