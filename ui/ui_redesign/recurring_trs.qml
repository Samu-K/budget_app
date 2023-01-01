import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

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
                "Vendor": "Uniter Retail",
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
    recurring: true
}
