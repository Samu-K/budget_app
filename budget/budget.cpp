#include "budget.h"
#include "ui_budget.h"

#include <time.h>

#include <iostream>
#include <memory>
#include <string>
#include <stdexcept>
#include <QSqlQuery>

// Include libraries for SQL
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QSqlError>

// Libraries for time and date
#include <ctime>
#include <chrono>

// Other useful libraries
#include <QApplication>
#include <iostream>
#include <fstream>

#include "budget.h"

using namespace std;

// Setup helper functions
QString fetch_password(string fp) {
    // We fetch the database password from file
    fstream keys;
    keys.open(fp,ios::in);
    string tp;
    while(getline(keys,tp)) {
    };

    // Turn the password into a qstring
    // Database url will need it
    QString pass = QString::fromStdString(tp);

    return pass;
}

QSqlDatabase setup_db(QString password) {
    // Setup our database
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");

    // Construct the url
    QString db_url = QString("Driver={ODBC Driver 13 for SQL Server};Server=tcp:budgetdata.database.windows.net,1433;Database=budget;Uid=budgetaccess;Pwd={")
            + password
            + QString("};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;");

    //

    db.setDatabaseName(db_url);
    db.open();

    return db;
}

Budget::Budget(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->tSelect->setCurrentRow(0);

    // Filepath to password
    string fp = "D:\\Coding\\budget_app\\keys\\azure_pass.txt";
    QString password = fetch_password(fp);

    // Init our database
    QSqlDatabase db_ = setup_db(password);
}

Budget::~Budget()
{
    delete ui;
}

void Budget::on_aText_textChanged()
{
    string txt = ui -> aText -> toPlainText().toStdString();
    data_.amount = txt;
}

void Budget::on_vText_textChanged()
{
    string txt = ui -> vText -> toPlainText().toStdString();
    data_.vendor = txt;
}

void Budget::on_submitButton_clicked()
{
    insert_values(
                data_.date,
                stoi(data_.amount),
                data_.vendor,
                stoi(data_.category),
                data_.type

    );

    ui -> vText->clear();
    ui -> aText->clear();
    ui -> cSelect->clearSelection();
    ui ->tSelect->setCurrentRow(0);
    ui -> dSelect->clearFocus();

}

void Budget::on_cSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    data_.category = txt;
}

void Budget::on_tSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    data_.type = txt;
}


void Budget::on_dSelect_clicked(const QDate &date)
{
    string day =  to_string(date.day());
    string month = to_string(date.month());
    string year = to_string(date.year());

    string date_str = year+"-"+month+"-"+day;
    data_.date = date_str;

}

void Budget::insert_values(string date_str,int amount,string vendor,int category, string type) {
    // Init our query
    QSqlQuery query;

    // Our target table depends on previous input
    if (type == "Expense") {
        query.prepare("INSERT INTO expenses "
                        "VALUES (:date,:amount,:vendor,:category)");

    } else if (type == "Income") {
        query.prepare("INSERT INTO income "
                        "VALUES (:date,:amount,:vendor,:category)");
    } else {
        cout << "incorrect type" << endl;
    }

    // Add values to insert query
    query.bindValue(":date",QString::fromStdString(date_str));
    query.bindValue(":amount",amount);
    query.bindValue(":vendor",QString::fromStdString(vendor));
    query.bindValue(":category",category);

    // Execute our query
    query.exec();
}

void Budget::closeEvent(QCloseEvent *event) {
        db_.close();
}


