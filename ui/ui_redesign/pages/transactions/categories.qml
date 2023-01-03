import QtQuick 2.15
import Qt.labs.qmlmodels
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/."
import "qrc:/pages/transactions/components"
import "qrc:/pages/transactions/components/trsbar"

TransactionsTemplate {
    incomeData: TableModel {
        TableModelColumn {display: "c1"}
        TableModelColumn {display: "c2"}
        TableModelColumn {display: "c3"}
        TableModelColumn {display: "c4"}

        rows: [
            {
                "c1": "Social benefits",
                "c2": "Salary",
                "c3": "Loans",
                "c4": "Payback"
            },
            {
                "c1": "Other",
                "c2": "",
                "c3": "",
                "c4": ""
            },
        ]
    }
    expenseData: TableModel {
        TableModelColumn {display: "c1"}
        TableModelColumn {display: "c2"}
        TableModelColumn {display: "c3"}
        TableModelColumn {display: "c4"}

        rows: [
            {
                "c1": "Groceries",
                "c2": "Going out",
                "c3": "Shopping",
                "c4": "Rent"
            },
            {
                "c1": "Books",
                "c2": "Subscriptions",
                "c3": "",
                "c4": ""
            },
        ]
    }

    columnTitles: ["","","",""]

    TrsBar {
        id: trsBar
    }
}
