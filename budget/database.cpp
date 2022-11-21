#include "database.hh"
#include "qvariant.h"

// include SQL related libraries
#include <QSqlQuery>
#include <QSqlError>

// handling for streams
#include <fstream>
#include <iostream>
#include <string>

using namespace std;

Database::Database()
    /*
     * Database handles all puts and fetches to our database
    */
{
}

void Database::db_connect(string pass, string uname) {
    /*
     * Connects to our database with the given password and username
    */

    // Setup our database
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");

    // Construct the url
    QString db_url = QString("Driver={ODBC Driver 13 for SQL Server};Server=tcp:budgetdata.database.windows.net,1433;Database=budget;Uid={")
                             + QString::fromStdString(uname)
                             + QString("};Pwd={")
                             + QString::fromStdString(pass)
                             + QString("};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30");

    // open our database
    db.setDatabaseName(db_url);
    bool db_status = db.open();

    if (!db_status) {
        cout << "Connection to database failed" << endl;
        cout << "Error: " << db.lastError().text().toStdString() << endl;
    } else {
        cout << "Connection to database succesfull" << endl;
    }

    // store to variable
    db_ = db;
}
map<string,int> Database::fetch_categories()
    /*
     * Fetches all current categories
     * logged into database
     *
     * Allows us to dynamically update list
    */
{
    // helper vars
    QSqlQuery query;
    map<string,int> category_index;

    // prepare and execute query
    query.prepare("SELECT * FROM categories");
    query.exec();

    // go through query and store results to vector
    while (query.next()) {
        int index = query.value(0).toInt();
        string catname = query.value(1).toString().toStdString();

        category_index[catname] = index;
    }

    return category_index;

}


void Database::insert_values(string date_str,string amount_str,string vendor,int category, string type)
    /*
     * Inserts the given values into our database
    */
{

    // Init our query
    QSqlQuery insert_query;

    // Our target table depends on previous input
    if (type == "Expense") {
        insert_query.prepare("INSERT INTO expenses "
                        "VALUES (:date,:amount,:vendor,:category)");

    } else if (type == "Income") {
        insert_query.prepare("INSERT INTO income "
                        "VALUES (:date,:amount,:vendor,:category)");
    } else {
        cout << "invalid type: " << type << endl;
        return;
    }

    // check if data is missing
    if (date_str.empty() || amount_str.empty() || vendor.empty()) {
        cout << "Missing information" << endl;
        return;
    }

    // convert to proper values
    int amount = stoi(amount_str);

    // Add values to insert query
    insert_query.bindValue(":date",QString::fromStdString(date_str));
    insert_query.bindValue(":amount",amount);
    insert_query.bindValue(":vendor",QString::fromStdString(vendor));
    insert_query.bindValue(":category",category);

    // Execute our query
    insert_query.exec();
}

void Database::close() {
    // closes our database
    db_.close();
}

