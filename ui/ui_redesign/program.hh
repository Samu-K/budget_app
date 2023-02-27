#ifndef PROGRAM_HH
#define PROGRAM_HH

#include <QQmlApplicationEngine>
#include <iostream>

#include <qqml.h>

#include "database.hh"

class Program : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Program(QQmlApplicationEngine &engine,QObject *parent=nullptr);

    ~Program();

public slots:
    void onLoginClicked(QString uname, QString pass);
    void onPageClicked(QString pageName);
    void onTrsButtonClicked(QString buttonName);

private:
    // handle login screen closing
    // and opening main program
    void completeLogin();

    // opens the main program
    void setupUi();

    Database db_;

    QObject* login_obj_;
    QObject* rootObject_;
    QQmlApplicationEngine* engine_;
};

#endif // PROGRAM_HH
