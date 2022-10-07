#include "database.hh"
#include <QSqlQuery>
#include <fstream>
#include <string>
#include <iostream>

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

Database::Database(string password_fp)
{
    QString password = fetch_password(password_fp);

    // Setup our database
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");

    // Construct the url
    QString db_url = QString("Driver={ODBC Driver 13 for SQL Server};Server=tcp:budgetdata.database.windows.net,1433;Database=budget;Uid=budgetaccess;Pwd={")
            + password
            + QString("};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;");

    db.setDatabaseName(db_url);
    db.open();

    db_ = db;
}

map<string,int> Database::fetch_categories()
{
    QSqlQuery query;
    map<string,int> category_index;

    query.prepare("SELECT * FROM categories");
    query.exec();

    while (query.next()) {
        int index = query.value(0).toInt();
        QString catname = query.value(1).toString();

        category_index[catname.toStdString()] = index;
    }

    return category_index;

}


void Database::insert_values(string date_str,int amount,string vendor,int category, string type) {
    // Init our query
    QSqlQuery query;

    // Our target table depends on previous input
    if (type == "Expense") {
        query.prepare("INSERT INTO expenses "
                        "VALUES (:date,:amount,:vendor,:category)");

    } else if (type == "Income") {
        query.prepare("INSERT INTO income "
                        "VALUES (:date,:amount,:vendor,:category)");
    }

    // Add values to insert query
    query.bindValue(":date",QString::fromStdString(date_str));
    query.bindValue(":amount",amount);
    query.bindValue(":vendor",QString::fromStdString(vendor));
    query.bindValue(":category",category);

    // Execute our query
    query.exec();
}

void Database::close() {
    db_.close();
}

