#include <iostream>
#include <string>
#include <fstream>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <chrono>
#include <ctime>

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
    db.open();
}


int main()
{
    // Setup variables
    int amount;
    cout << "Input given amount: ";
    cin >> amount;
    cin.clear();

    time_t date = chrono::system_clock::to_time_t(chrono::system_clock::now());

    string vendor;
    cout << "Input vendor: ";
    cin >> vendor;
    cin.clear();

    int category;
    cout << "Input category: ";
    cin >> category;
    cin.clear();

    // Filepath to password
    string fp = "../keys/azure_pass.txt";
    QString password = fetch_password(fp);

    // Setup our database
    setup_db(password);

    QSqlQuery query;
    query.prepare("INSERT INTO expenses "
                    "VALUES (:date,:amount,:vendor,:category)");
    query.bindValue(":date",QString::fromStdString(ctime(&date)));
    query.bindValue(":amount",amount);
    query.bindValue(":vendor",QString::fromStdString(vendor));
    query.bindValue(":category",category);
    query.exec();

}
