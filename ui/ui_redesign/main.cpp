#include <QApplication>
#include <QQmlApplicationEngine>

#include "login.hh"
#include "dashboard.hh"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Login login;
    Dashboard dash;
    dash.setupUi(engine);

    return app.exec();
}
