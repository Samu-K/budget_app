#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

#include "program.hh"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QQmlComponent component(&engine, url);
    component.create();
//    Program prog(engine);

    return app.exec();
}
