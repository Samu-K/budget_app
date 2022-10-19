#include "database.hh"

// include SQL related libraries
#include <QSqlQuery>

// handling for streams
#include <fstream>
#include <iostream>
#include <string>

using namespace std;

Database::Database()
    /*
     * Database handles all puts and fetches to our database
     * Needs the path to a file containing the password
     *
     * This functionality will be changed in future versions
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
                             + QString("};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;Authentication=ActiveDirectoryPassword");

    // open our database
    db.setDatabaseName(db_url);
    db.open();

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
        QString catname = query.value(1).toString();

        category_index[catname.toStdString()] = index;
    }

    return category_index;

}


void Database::insert_values(string date_str,int amount,string vendor,int category, string type)
    /*
     * Inserts the given values into our database
    */
{
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
    // closes our database
    db_.close();
}

