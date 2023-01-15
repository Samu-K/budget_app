#include "login.hh"
#include <iostream>

Login::Login(QObject *parent) :
    QObject(parent)
{
}

void Login::setupUi(QQmlApplicationEngine &engine, QApplication &app) {
    // path to login qml file
    const QUrl url(QStringLiteral("qrc:/pages/login/login.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    // load the ui
    engine.load(url);
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
