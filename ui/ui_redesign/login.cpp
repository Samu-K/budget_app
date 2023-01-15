#include "login.hh"
#include <iostream>

Login::Login(QObject *parent) :
    QObject(parent)
{
}

Login::~Login() {
    //delete obj_;
}

void Login::setupUi(QQmlApplicationEngine &engine) {
    // path to login qml file
    const QUrl url(QStringLiteral("qrc:/pages/login/login.qml"));

    QQmlComponent component(&engine, url);
    QObject *obj_ = component.create();

    QObject* lgButton = obj_->findChild<QObject *>("loginButton",Qt::FindChildrenRecursively);

    QObject::connect(lgButton, SIGNAL(loginClicked(QString,QString)),this,SLOT(onLoginClicked(QString,QString)));
}

void Login::onLoginClicked(QString uname, QString pass)
{
    uname_ = uname;
    pass_ = pass;
}
