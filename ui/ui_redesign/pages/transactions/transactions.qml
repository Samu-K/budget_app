import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels 1.0

import "qrc:/pages/transactions/components"
import "qrc:/pages/transactions/components/trsbar"

TransactionsTemplate {
    anchors.left: parent.left

    incomeData: TableModel {
           TableModelColumn { display: "Date" }
           TableModelColumn { display: "Amount" }
           TableModelColumn { display: "Vendor" }
           TableModelColumn { display: "Category" }

           rows: [
               {
                   "Date": "13.2.2022",
                   "Amount": "250€",
                   "Vendor": "KSM",
                   "Category": "Groceries"
               },
               {
                   "Date": "14.2.2022",
                   "Amount": "25€",
                   "Vendor": "Sodexo",
                   "Category": "School food"
               },
               {
                   "Date": "15.2.2022",
                   "Amount": "20€",
                   "Vendor": "Ranta",
                   "Category": "Going out"
               },
               {
                   "Date": "16.2.2022",
                   "Amount": "40€",
                   "Vendor": "Ranta",
                   "Category": "Going out"
               },
               {
                   "Date": "17.2.2022",
                   "Amount": "20€",
                   "Vendor": "Ranta",
                   "Category": "Going out"
               },
               {
                   "Date": "17.2.2022",
                   "Amount": "20€",
                   "Vendor": "Ranta",
                   "Category": "Going out"
               },
               {
                   "Date": "17.2.2022",
                   "Amount": "20€",
                   "Vendor": "Ranta",
                   "Category": "Going out"
               },
               {
                   "Date": "17.2.2022",
                   "Amount": "20€",
                   "Vendor": "Ranta",
                   "Category": "Going out"
               },
           ]
    }
    expenseData: TableModel {
        TableModelColumn { display: "Date" }
        TableModelColumn { display: "Amount" }
        TableModelColumn { display: "Vendor" }
        TableModelColumn { display: "Category" }

        rows: [
            {
                "Date": "13.2.2022",
                "Amount": "250€",
                "Vendor": "KSM",
                "Category": "Groceries"
            },
            {
                "Date": "14.2.2022",
                "Amount": "25€",
                "Vendor": "Sodexo",
                "Category": "School food"
            },
            {
                "Date": "15.2.2022",
                "Amount": "20€",
                "Vendor": "Ranta",
                "Category": "Going out"
            },
            {
                "Date": "16.2.2022",
                "Amount": "40€",
                "Vendor": "Ranta",
                "Category": "Going out"
            },
            {
                "Date": "17.2.2022",
                "Amount": "20€",
                "Vendor": "Ranta",
                "Category": "Going out"
            },
            {
                "Date": "17.2.2022",
                "Amount": "20€",
                "Vendor": "Ranta",
                "Category": "Going out"
            },
            {
                "Date": "17.2.2022",
                "Amount": "20€",
                "Vendor": "Ranta",
                "Category": "Going out"
            },
            {
                "Date": "17.2.2022",
                "Amount": "20€",
                "Vendor": "Ranta",
                "Category": "Going out"
            },
        ]
    }
    columnTitles: [
        "Date",
        "Amount",
        "Vendor",
        "Category"
    ]

    // right side tab
    TrsBar {
        id: trsBar
        anchors.right: parent.right;
    }
}
