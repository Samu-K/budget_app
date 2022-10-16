// Include needed libraries
#include <QApplication>
#include "budget.h"

using namespace std;

// start the program up
int main(int argc, char *argv[])
{
    // Init core applicattion
    QApplication app(argc,argv);

    // init budget class
    Budget window;
    window.show();

    return app.exec();

}
