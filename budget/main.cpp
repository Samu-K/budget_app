// Include libraries for SQL
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QSqlError>

// Libraries for time and date
#include <time.h>
#include <ctime>
#include <chrono>

// Other useful libraries
#include <QApplication>
#include <iostream>
#include <string>
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

int main(int argc, char *argv[])
{
    // Init core applicattion
    // Will be expanded and changed when UI is created
    QApplication app(argc,argv);
    Budget window;
    window.show();

    // Setup date
    //string date_str = fetch_date();

    // Filepath to password
    //string fp = "../../keys/azure_pass.txt";
    //QString password = fetch_password(fp);

    // Init our database
    //QSqlDatabase db = setup_db(password);

    // Close connection
    //db.close();
    return app.exec();

}
