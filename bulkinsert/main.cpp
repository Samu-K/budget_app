// Imports
#include <QCoreApplication>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QSqlError>
#include <iostream>
#include <string>
#include <fstream>
#include <QVariant>
#include <QSqlError>

using namespace std;


// Setup helper functions
QString fetch_password(string fp) {
    std::ifstream file(fp);
    std::string line;
    std::string password;

    if (file.is_open()) {
        while (std::getline(file, line)) {
            if (line=="") {
                continue;
            } else {
                password = line;
            }
        }
    }
    // Turn the password into a qstring
    // Database url will need it
    QString pass = QString::fromStdString(password);

    return pass;
}

QSqlDatabase setup_db(QString password) {
    // Setup our database
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");

    // Construct the url
    db.setHostName("trsdata.postgres.database.azure.com");
    db.setPort(5432);
    db.setDatabaseName("postgres");
    db.setUserName("smkr");
    db.setPassword(password);
    db.setConnectOptions("requiressl=1");

    bool status = db.open();
    if (!status) {
        cout << "Error: " + db.lastError().driverText().toStdString() << endl;
        cout << db.lastError().databaseText().toStdString() << endl;
    } else {
        cout << "db open" << endl;
    }

    return db;
}

void insert_values(int id, string date_str,float amount,string vendor,int category) {
    // Init our query
    QSqlQuery query;

    // prep trs insert
    query.prepare("INSERT INTO transaction"
                    "VALUES (:trs_id,:trs_date,:amount,:vendor)");

    // Add values to insert query
    query.bindValue(":trs_id",id);
    query.bindValue(":trs_date",QString::fromStdString(date_str));
    query.bindValue(":amount",amount);
    query.bindValue(":vendor",QString::fromStdString(vendor));

    // Execute trs insert
    query.exec();
    query.clear();

    // link trs to category
    query.prepare("INSERT INTO in_category"
                    "VALUE (:trs_id,:cat_id)");

    query.bindValue(":trs_id",id);
    query.bindValue(":cat_id",category);
    query.exec();
    query.clear();
}


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Filepath to password
    string fp = "../keys/azure_pass.txt";
    QString password = fetch_password(fp);

    // Init our database
    QSqlDatabase db = setup_db(password);

    // Read in our data
    std::ifstream file("../scripts/clean_expenses.txt");
    if (file.is_open()) {
        // Read file line by line
        std::string line;
        while (std::getline(file, line)) {
            // Helper variables
            size_t pos = 0;
            string token;
            int id = 0;
            string data[5];

            // split the read lines
            // using comma as delimiter
            while ((pos= line.find(",")) != string::npos) {
                token = line.substr(0,pos);
                line.erase(0,pos + 1);

                // add values to an array
                data[id] = token;
                ++id;
            }
            // final value
            data[id] = line;

            insert_values(stoi(data[0]),data[1],stof(data[3]),data[2],stoi(data[4]));
            }

        // close file after reading
        file.close();
        }

    db.close();
    a.closingDown();
    return 0;
}
