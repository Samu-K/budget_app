import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

import "qrc:/pages/transactions/components"
import "qrc:/pages/transactions/components/trsbar"

import "qrc:/."

TransactionsTemplate {
    incomeData: TableModel {
        TableModelColumn { display: "Once every" }
        TableModelColumn { display: "Next charge" }
        TableModelColumn { display: "Amount" }
        TableModelColumn { display: "Vendor" }
        TableModelColumn { display: "Category" }

        rows: [
            {
                "Once every": "month",
                "Next charge": "31.1.2022",
                "Amount": "300€",
                "Vendor": "United Retail",
                "Category": "salary"
            },
            {
                "Once every": "month",
                "Next charge": "1.1.2022",
                "Amount": "280€",
                "Vendor": "Kela",
                "Category": "social benefits"
            },

        ]
    }
    expenseData: TableModel {
        TableModelColumn { display: "Once every" }
        TableModelColumn { display: "Next charge" }
        TableModelColumn { display: "Amount" }
        TableModelColumn { display: "Vendor" }
        TableModelColumn { display: "Category" }

        rows: [
            {
                "Once every": "month",
                "Next charge": "13.2.2022",
                "Amount": "124€",
                "Vendor": "Isabel",
                "Category": "rent"
            },
            {
                "Once every": "year",
                "Next charge": "13.4.2022",
                "Amount": "20€",
                "Vendor": "Pocket Casts",
                "Category": "subscriptions"
            },

        ]
    }
    columnTitles: [
        "Once every",
        "Next charge",
        "Amount",
        "Vendor",
        "Category"
    ]

    TrsBar{
        id: trsBar
        anchors.right: parent.right

        // recurring picker
        ComboBox {
            id: recBox

            width: parent.width-(parent.sideMargin*2)
            height: parent.bgHeight

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 150
            anchors.horizontalCenter: parent.horizontalCenter

            font.pointSize: Styling.title3

            model: [ "Day", "Week", "Month" ]

            background:
                Rectangle {
                    id: recBg
                    color: Styling.lightBg
                    width: parent.width
                    height: parent.height+10

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
            }

            // label
            Text {
                text: qsTr("Once every ")
                font.pointSize: Styling.title3
                color: Styling.txtColor

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.top
                anchors.bottomMargin: 10
            }
        }
}

}
