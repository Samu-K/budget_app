// Include needed libraries
#include <QApplication>
#include "budget.h"

#include <iostream>

using namespace std;

/*
 * SecondWidgetClass *secondWidget = new SecondWidgetClass;

connect(youObject , SIGNAL(yourSignal()), secondWidget, SLOT(slotFunc()));

so if you want to send the data from the first MainwidgetClass class then you have use emit call emit yourSignal();

And establish the connect between the two classes. U will recieve data in slotFunc() of
SecondWidgetClass Class.
*/

// start the program up
int main(int argc, char *argv[])
{
    // Init core applicattion
    QApplication app(argc,argv);

    // init budget
    Budget MainWindow;

    return app.exec();

}
