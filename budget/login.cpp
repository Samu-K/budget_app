#include "login.h"
#include "qpushbutton.h"
#include "ui_login.h"
#include <iostream>

using namespace std;
login::login(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::login)
{
    ui->setupUi(this);
    ui->buttonBox->button(QDialogButtonBox::Ok)->setEnabled(false);
    ui->buttonBox->button(QDialogButtonBox::Ok)->setDefault(true);
}

login::~login()
{
    delete ui;
}

// automatic connections to handle text input
void login::on_pText_textChanged()
{
    string txt = ui->pText->toPlainText().toStdString();

    // set ok button to enabled or disaled
    // enabled if both password and username entered
    // disable if one is missing
    if (!txt.empty() && !uname_.empty()) {
        ui->buttonBox->button(QDialogButtonBox::Ok)->setEnabled(true);
    } else {
        ui->buttonBox->button(QDialogButtonBox::Ok)->setEnabled(false);
    }
    pass_ = txt;
}

void login::on_uText_textChanged()
{
    string txt = ui->uText->toPlainText().toStdString();

    // set ok button to enabled or disaled
    // enabled if both password and username entered
    // disable if one is missing
    if (!txt.empty() && !pass_.empty()) {
        ui->buttonBox->button(QDialogButtonBox::Ok)->setEnabled(true);
    } else {
        ui->buttonBox->button(QDialogButtonBox::Ok)->setEnabled(false);
    }
    uname_ = txt;
}

void login::on_buttonBox_accepted()
    /* Emit closing signal to Budget
     * Also emit given username and password
    */
{
    login_info user;

    user.username = uname_;
    user.password = pass_;
    emit submitted(user);

    emit accepted();
    this->accept();
}

