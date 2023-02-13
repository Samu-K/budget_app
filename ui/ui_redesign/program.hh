#ifndef PROGRAM_HH
#define PROGRAM_HH

#include <QQmlApplicationEngine>
#include <iostream>

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

private:
    // handle login screen closing
    // and opening main program
    void completeLogin();

    // opens the main program
    void setupUi();

    QString uname_;
    QString pass_;

    QObject* login_obj_;
    QObject* rootObject_;
    QQmlApplicationEngine* engine_;
};

#endif // PROGRAM_HH
