#include "program.hh"

#include "login.hh"

Program::Program(QQmlApplicationEngine &engine, QObject *parent) :
    QObject(parent)
{
    engine_ = &engine;

    Login login;
    login_obj_ = login.setupUi(engine);
    QObject* lgButton = login_obj_->findChild<QObject *>("loginButton",Qt::FindChildrenRecursively);

    QObject::connect(
         lgButton,
         SIGNAL(loginClicked(QString,QString)),
         this,
         SLOT(onLoginClicked(QString,QString))
    );
}

Program::~Program()
{
}

void Program::onLoginClicked(QString uname, QString pass)
{
    uname_ = uname;
    pass_ = pass;

    // close the login window
    login_obj_->deleteLater();
    // open the main program
    setupUi();
}

void Program::onPageClicked(QString pageName)
{
    std::cout << "trig" << std::endl;
    std::cout << pageName.toStdString() << std::endl;
}

void Program::setupUi()
{
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QQmlComponent component(engine_, url);
    rootObject_ = component.create();

    QObject* pageButton = rootObject_->findChild<QObject *>("pageButton",Qt::FindChildrenRecursively);

    QObject::connect(
        pageButton,
        SIGNAL(pageClicked(QString)),
        this,
        SLOT(onPageClicked(QString))
    );
}
