#include "program.hh"

#include "login.hh"
#include <QFile>

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

void Program::onTrsButtonClicked(QString buttonName) {
    std::cout << "trig" << std::endl;
    std::cout << "Pressed " << buttonName.toStdString() << std::endl;
}

void Program::onPageClicked(QString pageName)
{
    QString url = "qrc:/pages/"+pageName+"/"+pageName+".qml";
    rootObject_->findChild<QObject *>("loader")->setProperty("source",url);

    if (pageName == "transactions") {
        QObject* modelObject = rootObject_->findChild<QObject *>("buttonLayout",Qt::FindChildrenRecursively);
        auto buttons = modelObject->findChildren<QObject *>(Qt::FindChildrenRecursively);
        for (auto button : buttons) {
            if (button->objectName().toStdString().empty() == false) {
                std::cout << "Connecting " << button->objectName().toStdString() << std::endl;
                QObject::connect(
                    button,
                    SIGNAL(trsButtonClicked(QString)),
                    this,
                    SLOT(onTrsButtonClicked(QString))
                );
            }
        }
    }
}

void Program::setupUi()
{
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QQmlComponent component(engine_, url);
    rootObject_ = component.create(engine_->rootContext());

    QObject* modelObject = rootObject_->findChild<QObject *>("iconModel",Qt::FindChildrenRecursively);
    auto icons = modelObject->findChildren<QObject *>(Qt::FindChildrenRecursively);
    for (auto child : icons) {
        if (child->objectName().toStdString().empty() == false) {
            QObject::connect(
                child,
                SIGNAL(pageClicked(QString)),
                this,
                SLOT(onPageClicked(QString))
            );
        }
    }


}
