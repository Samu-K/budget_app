pragma Singleton
import QtQuick 2.15
QtObject {
    // background color of app window
    property color app: "#236BAE"
    property color darkBg: "#2C3139"
    property color lightBg: "#8E9EB8"
    property color txtColor: "white"
    // color of selected objects
    property color slcColor: "#5E5E5E"

    // text pixelsizes
    property int title: 38
    property int title2: 32
    property int title3: 24
    property int norm: 20
    property int footer: 16

    // margin between label and object
    property int titleMargin: 5
}
