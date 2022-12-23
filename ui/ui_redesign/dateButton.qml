import QtQuick 2.12
import QtQuick.Controls

// Define a Button component
Component {
    id: dateButtonComponent
    Button {
        text: ""
        color: "white"
        background: Rectangle {
            color: "#2C3139"
            MouseArea {
                hoverEnabled: true
                onEntered: {
                    color = "#5E5E5E"
                }
                onExited: {
                    color = "#2C3139"
                }
            }
        }
    }
}
