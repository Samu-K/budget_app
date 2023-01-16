#ifndef DASHBOARD_HH
#define DASHBOARD_HH

#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QObject>

#include <qqml.h>

class Dashboard : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Dashboard(QObject *parent=nullptr);

    // decon
    ~Dashboard();

    void setupUi(QQmlApplicationEngine &engine);


};

#endif // DASHBOARD_HH
