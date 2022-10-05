#include "budget.h"
#include "ui_budget.h"

#include <iostream>
#include <string>

using namespace std;

Budget::Budget(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

Budget::~Budget()
{
    delete ui;
}

void Budget::on_aText_textChanged()
{
    string txt = ui -> aText -> toPlainText().toStdString();
    aText_ = txt;
}

void Budget::on_vText_textChanged()
{
    string txt = ui -> vText -> toPlainText().toStdString();
    vText_ = txt;
}

void Budget::on_dText_textChanged()
{
    string txt = ui -> dText -> toPlainText().toStdString();
    dText_ = txt;
}

void Budget::on_submitButton_clicked()
{
    cout << "Amount: " << aText_ << endl;
    cout << "Category: " << cText_ << endl;
    cout << "Vendor: " << vText_ << endl;
    cout << "Date: " << dText_ << endl;
}

void Budget::on_cSelect_itemPressed(QListWidgetItem *item)
{
    cout << item->text().toStdString() << endl;

}

