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
#include <QCoreApplication>
#include <iostream>
#include <string>
#include <fstream>

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

void insert_values(string date_str,int amount,string vendor,int category, int type_mod) {
    // Init our query
    QSqlQuery query;

    // Our target table depends on previous input
    if (type_mod == 1) {
        query.prepare("INSERT INTO expenses "
                        "VALUES (:date,:amount,:vendor,:category)");

    } else if (type_mod == 2) {
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

string fetch_date() {
    // Get the date from computer clock
    time_t date = chrono::system_clock::to_time_t(chrono::system_clock::now());

    // Setup cariables for strftime
    tm * date_tm;
    char date_str[100];
    time(&date);
    date_tm = localtime(&date);

    // Format the date to be YYYY/MM/DD
    // Result gets save to a string in date_str
    strftime(date_str,50,"%Y-%m-%d",date_tm);

    // Return the formatted string
    return date_str;
}

int main(int argc, char *argv[])
{
    // Init core applicattion
    // Will be expanded and changed when UI is created
    QCoreApplication a(argc,argv);

    // Setup variables
    int type_mod;
    cout << "Give transaction type (1 = expense, 2=income) ";
    cin >> type_mod;
    cin.clear();

    int amount;
    cout << "Input given amount: ";
    cin >> amount;
    cin.clear();

    string vendor;
    cout << "Input vendor: ";
    cin >> vendor;
    cin.clear();

    int category;
    cout << "Input category: ";
    cin >> category;
    cin.clear();

    // Setup date
    string date_str = fetch_date();

    // Filepath to password
    string fp = "../../keys/azure_pass.txt";
    QString password = fetch_password(fp);

    // Init our database
    QSqlDatabase db = setup_db(password);

    // Insert in values
    insert_values(date_str,amount,vendor,category,type_mod);

    // Close connection
    db.close();
    QCoreApplication::quit();

}
