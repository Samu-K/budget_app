#include "login.hh"
#include <iostream>

Login::Login(QObject *parent) :
    QObject(parent)
{
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
