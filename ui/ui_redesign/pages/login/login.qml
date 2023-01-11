import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Shapes 1.4

import "qrc:/."

Window {
    // main login window
    width: 400
    height: 500
    visible: true
    title: qsTr("Login")

    Rectangle {
        id: gradient
        width: parent.height*1.5
        height: width
        radius: width
        gradient: RadialGradient {
            GradientStop { position: 0.0; color: "#1da544" }
            GradientStop { position: 1.0; color: "#144B24" }
        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }


    // user icon background
    Rectangle {
         id: userBg
         width: 130
         height: width
         color: Styling.lightBg
         border.color: "black"
         border.width: 1
         radius: width*0.5
         anchors.top: parent.top
         anchors.topMargin: 30
         anchors.horizontalCenter: parent.horizontalCenter

         // user icon
         Image {
             id: usrImage
             fillMode: Image.PreserveAspectFit
             source: "qrc:/design/user_icon.png"
             anchors.fill: parent
             anchors.verticalCenter: parent.verticalCenter
             anchors.horizontalCenter: parent.horizontalCenter
         }
    }

    // Username field
    Text {
        id: unameText
        text: qsTr("Username")
        color: Styling.txtColor
        font.pointSize: Styling.title2
        anchors.verticalCenter: userBg.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 45
    }

    Rectangle {
        id: uInputBox
        width: 370
        height: 40
        radius: 8
        border.color: Styling.txtColor
        border.width: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: unameText.bottom
        anchors.verticalCenterOffset: 25

        TextInput {
            id: unameInput
            anchors.fill: parent
            anchors.margins: 4
            font.pointSize: Styling.title3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    // Password field
    Text {
        id: passText
        text: qsTr("Password")
        color: "white"
        font.pointSize: Styling.title2
        anchors.verticalCenter: uInputBox.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 30
    }

    Rectangle {
        id: pInputBox
        width: 370
        height: 40
        radius: 8
        border.color: "white"
        border.width: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: passText.bottom
        anchors.verticalCenterOffset: 25

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
                color: parent.down ? Styling.darkBg.darker(1.5) :
                        (parent.hovered ? Styling.slcColor : Styling.darkBg)
        }

        text: qsTr("LOGIN")
        font.pixelSize: Styling.title3
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
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
        font.pointSize: Styling.footer
        color: Styling.txtColor
        anchors.verticalCenter: rmbCheck.verticalCenter
        anchors.left: rmbCheck.right
        anchors.horizontalCenterOffset: 10
    }

    // forgot password link
    Text {
        id: frtPass
        text: qsTr("Forget password?")
        font.pointSize: Styling.footer
        color: Styling.txtColor
        anchors.verticalCenter: rmbText.verticalCenter
        anchors.right: loginButton.right
    }
}
