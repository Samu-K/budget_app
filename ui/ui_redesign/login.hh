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
        QML_ELEMENT

public:
    explicit Login(QObject *parent = nullptr
    );

    // deconstructor
    ~Login();

    void setupUi(QQmlApplicationEngine &engine);

public slots:
    void onLoginClicked(QString uname, QString pass);

signals:
    void unameChanged();
    void passChanged();

private:
};

#endif // LOGIN_HH
