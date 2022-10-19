// Include needed libraries
#include <QApplication>
#include "budget.h"

#include <iostream>

using namespace std;

// start the program up
int main(int argc, char *argv[])
{
    // Init core applicattion
    QApplication app(argc,argv);

    // init budget
    Budget MainWindow;

    return app.exec();

}
