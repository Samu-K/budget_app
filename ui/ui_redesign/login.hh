#ifndef LOGIN_HH
#define LOGIN_HH

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QApplication>

#include <qqml.h>

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
    QString uname_;
    QString pass_;
};

#endif // LOGIN_HH
