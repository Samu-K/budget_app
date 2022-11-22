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

    // Set driver
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");

    // Set connection options
    db.setHostName("trsdata.postgres.database.azure.com");
    db.setPort(5432);
    db.setDatabaseName("postgres");
    db.setUserName(QString::fromStdString(uname));
    db.setPassword(QString::fromStdString(pass));
    db.setConnectOptions("requiressl=1");

    // Make sure database was connected to
    bool status = db.open();
    if (!status) {
        cout << "Error: " + db.lastError().driverText().toStdString() << endl;
        cout << db.lastError().databaseText().toStdString() << endl;
    } else {
        cout << "db open" << endl;
    }

    // store to variable
    db_ = db;
}
map<string,pair<int,string>> Database::fetch_categories()
    /*
     * Fetches all current categories
     * logged into database
     *
     * Allows us to dynamically update list
    */
{
    // helper vars
    QSqlQuery query;
    map<string,pair<int,string>> category_index;

    // prepare and execute query
    query.prepare("SELECT * FROM category");
    query.exec();

    // go through query and store results to vector
    while (query.next()) {
        int index = query.value(0).toInt();
        string catname = query.value(1).toString().toStdString();
        string type = query.value(2).toString().toStdString();

        pair<int,string> data;
        data.first = index;
        data.second = type;

        category_index[catname] = data;
    }

    return category_index;

}


void Database::insert_values(
        string date_str,
        string amount_str,
        string vendor,
        int category)
    /*
     * Inserts the given values into our database
    */
{
    // query for max id
    QSqlQuery id_query;

    id_query.exec("SELECT MAX(trs_id) FROM transaction;");
    id_query.next();
    int max_id = id_query.value(0).toInt();

    // Init our query
    QSqlQuery query;

    // prep trs insert
    query.prepare("INSERT INTO public.transaction "
                  "VALUES (:trs_id,:trs_date,:amount,:vendor) ");

    // Add values to insert query
    query.bindValue(":trs_id",max_id+1);
    query.bindValue(":trs_date",QString::fromStdString(date_str));
    query.bindValue(":amount",stof(amount_str));
    query.bindValue(":vendor",QString::fromStdString(vendor));

    // Execute trs insert
    if (!query.exec()) {
        cout << "Error with query: " << query.lastQuery().toStdString() << endl;
        cout << query.lastError().text().toStdString() << endl;
        return;
    } else {
        cout << "Added in " << to_string(max_id+1) << " : " << vendor << " : " << amount_str << endl;
    }

    // link trs to category
    query.prepare("INSERT INTO public.in_category "
                    "VALUES (:trs_id,:cat_id) ");

    query.bindValue(":trs_id",max_id+1);
    query.bindValue(":cat_id",category);
    if (!query.exec()) {
        cout << "Error with query: " << query.lastQuery().toStdString() << endl;
        cout << query.lastError().text().toStdString() << endl;
        return;
    } else {
        cout << "Linked " << max_id+1 << " to " << category << endl;
    }
    cout << endl;
}

void Database::close() {
    // closes our database
    db_.close();
}

