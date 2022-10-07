#ifndef DATABASE_HH
#define DATABASE_HH

#include <QString>
#include <QSqlDatabase>
#include <map>
#include <string>

using namespace std;


class Database
{
public:
    Database(string password_fp = "D:\\Coding\\budget_app\\keys\\azure_pass.txt");

    map<string,int> fetch_categories();
    void insert_values(string date_str,int amount,string vendor,int category, string type);
    void close();

private:

    QSqlDatabase db_;
};

#endif // DATABASE_HH
