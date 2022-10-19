#ifndef DATABASE_HH
#define DATABASE_HH

// Include libraries for type declaration
#include <QSqlDatabase>
#include <map>
#include <string>

using namespace std;

class Database
{
public:
    // constructor
    Database();

    // funcs
    void db_connect(string pass, string uname);
    map<string,int> fetch_categories();
    void insert_values(string date_str,int amount,string vendor,int category, string type);
    void close();

private:
    // vars
    QSqlDatabase db_;
};

#endif // DATABASE_HH
