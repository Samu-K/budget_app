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
#include <vector>

using namespace std;


// Read password from file
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

// connect to our database
QSqlDatabase setup_db(QString password) {
    // Set driver
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");

    // Set connection options
    db.setHostName("trsdata.postgres.database.azure.com");
    db.setPort(5432);
    db.setDatabaseName("postgres");
    db.setUserName("smkr");
    db.setPassword(password);
    db.setConnectOptions("requiressl=1");

    // Make sure database was connected to
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
    query.prepare("INSERT INTO public.transaction "
                  "VALUES (:trs_id,:trs_date,:amount,:vendor) ");

    // Add values to insert query
    query.bindValue(":trs_id",id);
    query.bindValue(":trs_date",QString::fromStdString(date_str));
    query.bindValue(":amount",amount);
    query.bindValue(":vendor",QString::fromStdString(vendor));

    // Execute trs insert
    if (!query.exec()) {
        cout << "Error with query: " << query.lastQuery().toStdString() << endl;
        cout << query.lastError().text().toStdString() << endl;
        return;
    } else {
        cout << "Added in " << to_string(id) << " : " << vendor << " : " << to_string(amount) << endl;
    }

    // link trs to category
    query.prepare("INSERT INTO public.in_category "
                    "VALUES (:trs_id,:cat_id) ");

    query.bindValue(":trs_id",id);
    query.bindValue(":cat_id",category);
    if (!query.exec()) {
        cout << "Error with query: " << query.lastQuery().toStdString() << endl;
        cout << query.lastError().text().toStdString() << endl;
        return;
    } else {
        cout << "Linked " << id << " to " << category << endl;
    }
    cout << endl;

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
    cout << "Give input file: ";
    string input_fp;
    cin >> input_fp;

    // read file
    std::ifstream file(input_fp);
    if (file.is_open()) {
        cout << "Transaction started" << endl;
        db.transaction();

        // Read file line by line
        std::string line;
        while (std::getline(file, line)) {
            // Helper variables
            size_t pos = 0;
            string token;
            int id = 0;
            vector<string> data;

            // split the read lines
            // using comma as delimiter
            while ((pos= line.find(",")) != string::npos) {
                token = line.substr(0,pos);
                line.erase(0,pos + 1);

                // add values to an array
                data.push_back(token);
                ++id;
            }
            // skip header row
            if (data[1] == "date") {
                continue;
            }

            // final value
            data.push_back(line);

            // push values to database
            insert_values(stoi(data[0]),data[1],stof(data[3]),data[2],stoi(data[4]));
            }

        // close file after reading
        file.close();
        }

    // check if we should commit or roll transaction back
    // this is especially useful for testing
    char commit;
    cout << "Do you want to commit inserts? (y / n)" << endl;
    cin >> commit;


    while (true) {
        if (commit == 'y') {
            db.commit();
            cout << "Commited" << endl;
            break;
        } else if (commit == 'n'){
            db.rollback();
            cout << "Transaction rolled back" << endl;
            break;
        } else {
            cout << "invalid input" << endl;
        }
    }

    // close everything down
    db.close();
    a.closingDown();
    return 0;
}
