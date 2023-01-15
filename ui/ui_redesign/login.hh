#ifndef LOGIN_HH
#define LOGIN_HH

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QApplication>

#include <qqml.h>

struct login_info {
    QString username, password;
};

class Login : public QObject
{
        Q_OBJECT
        Q_PROPERTY(QString uname READ uname WRITE setUname NOTIFY unameChanged)
        Q_PROPERTY(QString pass READ pass WRITE setPass NOTIFY passChanged)
        QML_ELEMENT

public:
    explicit Login(QObject *parent = nullptr
    );

    void setupUi(QQmlApplicationEngine &engine);

    QString uname();
    QString pass();

    void setUname(const QString &uname);
    void setPass(const QString &pass);

    // deconstructor
    ~Login();

signals:
    void unameChanged();
    void passChanged();
private:
    // qml obj
    QObject* obj_;

    QString m_uname;
    QString m_pass;
};

#endif // LOGIN_HH