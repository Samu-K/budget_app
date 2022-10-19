#include "login.h"
#include "ui_login.h"
#include <iostream>

using namespace std;
login::login(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::login)
{
    ui->setupUi(this);
}

login::~login()
{
    delete ui;
}

void login::on_pText_textChanged()
{
    string txt = ui->pText->toPlainText().toStdString();
    pass_ = txt;
}

void login::on_uText_textChanged()
{
    string txt = ui->uText->toPlainText().toStdString();
    uname_ = txt;
}

void login::on_buttonBox_accepted()
{
    login_info user;

    user.username = uname_;
    user.password = pass_;
    emit (submitted(user));

    emit accepted();
    this->accept();
}

