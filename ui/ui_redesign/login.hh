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
    explicit Login(QObject *parent = nullptr);

    QObject* setupUi(QQmlApplicationEngine &engine);

    // deconstructor
    ~Login();
};

#endif // LOGIN_HH
