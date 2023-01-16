#include "dashboard.hh"

Dashboard::Dashboard(QObject *parent) :
    QObject(parent)
{
}

Dashboard::~Dashboard()
{
}

void Dashboard::setupUi(QQmlApplicationEngine &engine)
{
    // path to qml file
    const QUrl url(QStringLiteral("qrc:/pages/dashboard/dashboard.qml"));
    QQmlComponent component(&engine, url);
    QObject *obj = component.create();

}
