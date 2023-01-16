#include "login.hh"
#include <iostream>

Login::Login(QObject *parent) :
    QObject(parent)
{
}

Login::~Login() {
    //delete obj_;
}

QObject* Login::setupUi(QQmlApplicationEngine &engine) {
    // path to login qml file
    const QUrl url(QStringLiteral("qrc:/pages/login/login.qml"));

    QQmlComponent component(&engine, url);
    QObject *obj = component.create();
    return obj;

}
