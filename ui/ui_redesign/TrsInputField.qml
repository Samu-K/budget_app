import QtQuick 2.15

Rectangle {
    id: background

    // component vars
    property alias text: text.text
    property int sideMargin

    color: "#8E9EB8"
    width: parent.width-(sideMargin*2)
    height: 35

    // label
    Text {
        id: text
        color: "white"
        font.pointSize: 24

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.top
        anchors.bottomMargin: 5
    }

    // input
    TextInput {
        id: input
        font.pointSize: 26
        height: parent.height
        width: parent.width
        color: text.color

        horizontalAlignment: Text.Center
        verticalAlignment: Text.Center

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}

