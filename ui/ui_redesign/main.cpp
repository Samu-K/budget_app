#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

#include "program.hh"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Program prog(engine);

    return app.exec();
}
