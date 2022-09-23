#include <iostream>
#include <string>
#include <fstream>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QSqlError>
#include <chrono>
#include <ctime>
#include <QCoreApplication>
#include <time.h>

using namespace std;

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

void setup_db(QString password) {

    // Setup our database
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    // Construct the url
    QString db_url = QString("Driver={ODBC Driver 13 for SQL Server};Server=tcp:budgetdata.database.windows.net,1433;Database=budget;Uid=budgetaccess;Pwd={")
            + password
            + QString("};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;");

    //
    db.setDatabaseName(db_url);
    db.setUserName("budgetaccess");
    db.setPassword("So6X7dnFdN");

    db.open();
}


int main(int argc, char *argv[])
{
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

    time_t date = chrono::system_clock::to_time_t(chrono::system_clock::now());
    tm * date_tm;
    char date_str[100];

    time(&date);
    date_tm = localtime(&date);

    strftime(date_str,50,"%Y-%m-%d",date_tm);

    string vendor;
    cout << "Input vendor: ";
    cin >> vendor;
    cin.clear();

    int category;
    cout << "Input category: ";
    cin >> category;
    cin.clear();

    // Filepath to password
    string fp = "../../keys/azure_pass.txt";
    QString password = fetch_password(fp);

    // Setup our database
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");

    // Construct the url
    QString db_url = QString("Driver={ODBC Driver 13 for SQL Server};Server=tcp:budgetdata.database.windows.net,1433;Database=budget;Uid=budgetaccess;Pwd={")
            + password
            + QString("};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;");

    //
    db.setDatabaseName(db_url);
    //db.setUserName("budgetaccess");
    //db.setPassword(password);
    db.open();

    QString er = db.lastError().text();
    string error_line = er.toStdString();

    cout << "Error: \n" << error_line << endl;

    QSqlQuery query;
    if (type_mod == 1) {
        query.prepare("INSERT INTO expenses "
                        "VALUES (:date,:amount,:vendor,:category)");

    } else if (type_mod == 2) {
        query.prepare("INSERT INTO income "
                        "VALUES (:date,:amount,:vendor,:category)");
    }

    query.bindValue(":date",QString::fromStdString(date_str));
    query.bindValue(":amount",amount);
    query.bindValue(":vendor",QString::fromStdString(vendor));
    query.bindValue(":category",category);

    query.exec();

    QString qer = query.lastError().text();
    string qerror_line = qer.toStdString();

    cout << "Error: \n" << qerror_line << endl;

}
