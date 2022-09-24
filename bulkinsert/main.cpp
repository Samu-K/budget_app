#include <QCoreApplication>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QSqlError>
#include <iostream>
#include <string>
#include <fstream>

using namespace std;


// Setup helper functions
QString fetch_password(string fp) {
    std::ifstream file(fp);
    std::string line;

    if (file.is_open()) {
        while (std::getline(file, line)) {
        }
    }
    // Turn the password into a qstring
    // Database url will need it
    QString pass = QString::fromStdString(line);

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


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Filepath to password
    string fp = "D:\\Coding\\budget_app\\keys\\azure_pass.txt";
    QString password = fetch_password(fp);

    // Init our database
    QSqlDatabase db = setup_db(password);

    std::ifstream file("../scripts/clean_income_fixed.txt");
    if (file.is_open()) {
        std::string line;
        while (std::getline(file, line)) {
            size_t pos = 0;
            string token;
            int id = 0;
            string data[5];
            while ((pos= line.find(",")) != string::npos) {
                token = line.substr(0,pos);
                line.erase(0,pos + 1);
                data[id] = token;
                ++id;
            }
            data[id] = line;

            insert_values(data[1],stoi(data[3]),data[2],stoi(data[4]),2);
            }
        file.close();
        }

    return a.exec();
}
