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



void Budget::on_submitButton_clicked()
{
    cout << "Amount: " << aText_ << endl;
    cout << "Category: " << cSelect_ << endl;
    cout << "Vendor: " << vText_ << endl;
    cout << "Date: " << dSelect_ << endl;
    cout << "Type: " << tSelect_ << endl;

    ui -> vText->clear();
    ui -> aText->clear();
    ui -> cSelect->clearSelection();
    ui ->tSelect->setCurrentRow(0);
    ui -> dSelect->clearFocus();
}

void Budget::on_cSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    cSelect_ = txt;
}

void Budget::on_tSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    tSelect_ = txt;
}


void Budget::on_dSelect_clicked(const QDate &date)
{
    string txt = date.toString().toStdString();
    dSelect_ = txt;
}

