// Include libraries for SQL
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QSqlError>

// Libraries for time and date
#include <ctime>
#include <chrono>

// Other useful libraries
#include <QApplication>
#include <iostream>
#include <string>
#include <fstream>

#include "budget.h"

using namespace std;

int main(int argc, char *argv[])
{
    // Init core applicattion
    // Will be expanded and changed when UI is created
    QApplication app(argc,argv);
    Budget window;
    window.show();

    return app.exec();

}
