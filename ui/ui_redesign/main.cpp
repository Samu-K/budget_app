#include <QApplication>
#include <QQmlApplicationEngine>

#include "login.hh"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Login login;
    login.setupUi(engine, app);

    return app.exec();
}
