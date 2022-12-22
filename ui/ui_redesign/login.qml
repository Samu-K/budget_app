import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Window {
    // main login window
    width: 400
    height: 500
    visible: true
    title: qsTr("Login")
    color: "#144B24"

    // user icon background
    Rectangle {
         id: userBg
         width: 170
         height: width
         color: "#6E89A8"
         border.color: "black"
         border.width: 1
         radius: width*0.5
         anchors.top: parent.top
         anchors.topMargin: 15
         anchors.horizontalCenter: parent.horizontalCenter

         // user icon
         Image {
             id: usrImage
             fillMode: Image.fit
             source: "qrc:/user_icon_colored.png"
             anchors.fill: parent
             anchors.verticalCenter: parent.verticalCenter
             anchors.horizontalCenter: parent.horizontalCenter
         }
    }

    // Username field
    Text {
        id: unameText
        text: "Username"
        font.pointSize: 32
        anchors.verticalCenter: userBg.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 20
    }

    Rectangle {
        id: uInputBox
        width: 370
        height: 40
        border.color: "white"
        border.width: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: unameText.bottom
        anchors.verticalCenterOffset: 30

        TextInput {
            id: unameInput
            anchors.fill: parent
            anchors.margins: 4
            font.pointSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // Password field
    Text {
        id: passText
        text: "Password"
        font.pointSize: 32
        anchors.verticalCenter: uInputBox.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 25
    }

    Rectangle {
        id: pInputBox
        width: 370
        height: 40
        border.color: "white"
        border.width: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: passText.bottom
        anchors.verticalCenterOffset: 30

        TextInput {
            id: passInput
            anchors.fill: parent
            anchors.margins: 4
            font.pointSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // login button
    Button {
        id: loginButton
        width: 390
        height: 45
        background: Rectangle {
                width: parent.width
                height: parent.height
                color: parent.down ? "#bbbbbb" :
                        (parent.hovered ? "#515358" : "#202123")
        }

        text: "LOGIN"
        font.pixelSize: 24
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: pInputBox.bottom
        anchors.verticalCenterOffset: 50
    }

    // remember me checkbox
    CheckBox {
        id: rmbCheck
        width: 25
        height: 25
        anchors.verticalCenter: loginButton.bottom
        anchors.verticalCenterOffset: 25
        anchors.left: loginButton.left
    }
    Text {
        id: rmbText
        text: qsTr("Remember me?")
        font.pointSize: 16
        color: "white"
        anchors.verticalCenter: rmbCheck.verticalCenter
        anchors.left: rmbCheck.right
        anchors.horizontalCenterOffset: 10
    }

    // forgot password link
    Text {
        id: frtPass
        text: qsTr("Forget password?")
        font.pointSize: 16
        color: "white"
        anchors.verticalCenter: rmbText.verticalCenter
        anchors.right: loginButton.right
    }
}
