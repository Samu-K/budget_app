#include "login.hh"
#include <iostream>

Login::Login(QObject *parent) :
    QObject(parent)
{
}

void Login::setupUi(QQmlApplicationEngine &engine) {
    // path to login qml file
    const QUrl url(QStringLiteral("qrc:/pages/login/login.qml"));

    QQmlComponent component(&engine, url);
    QObject *obj_ = component.create();

    QObject* lgButton = obj_->findChild<QObject *>("loginButton",Qt::FindChildrenRecursively);

    QObject::connect(lgButton, SIGNAL(qmlSignal(QString)),this,SLOT(testSlot(QString)));
}

QString Login::uname() {
    return m_uname;
}

QString Login::pass() {
    return m_pass;
}

void Login::setUname(const QString &uname) {
    if (uname == m_uname) {
        return;
    }
    m_uname = uname;
    emit unameChanged();
}

void Login::setPass(const QString &pass) {
    if (pass == m_pass) {
        return;
    }
    m_pass = pass;
    emit passChanged();
}

Login::~Login() {
    //delete obj_;
}

void Login::testSlot(const QString &msg)
{
    std::cout << msg.toStdString() << std::endl;
}
