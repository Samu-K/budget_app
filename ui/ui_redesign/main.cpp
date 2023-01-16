#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QQmlComponent component(&engine, url);
    QObject *obj_ = component.create();

    return app.exec();
}
