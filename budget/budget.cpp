#include "budget.h"
#include "ui_budget.h"

#include <time.h>

#include <iostream>
#include <memory>
#include <string>
#include <stdexcept>
#include <QSqlQuery>

// Include libraries for SQL
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QString>
#include <QSqlError>

// Libraries for time and date
#include <ctime>
#include <chrono>

// Other useful libraries
#include <QApplication>
#include <iostream>
#include <fstream>

#include "budget.h"

#include "database.hh"

using namespace std;

Budget::Budget(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{

    Database database_ = Database();

    ui->setupUi(this);
    ui->tSelect->setCurrentRow(0);

    map<string,int> category_index_ = database_.fetch_categories();
}

Budget::~Budget()
{
    delete ui;
}

void Budget::on_aText_textChanged()
{
    string txt = ui -> aText -> toPlainText().toStdString();
    data_.amount = txt;
}

void Budget::on_vText_textChanged()
{
    string txt = ui -> vText -> toPlainText().toStdString();
    data_.vendor = txt;
}

void Budget::on_submitButton_clicked()
{
    database_.insert_values(
                data_.date,
                stoi(data_.amount),
                data_.vendor,
                stoi(data_.category),
                data_.type

    );

    ui -> vText->clear();
    ui -> aText->clear();
    ui -> cSelect->clearSelection();
    ui ->tSelect->setCurrentRow(0);
    ui -> dSelect->clearFocus();

}

void Budget::on_cSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    data_.category = txt;
}

void Budget::on_tSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    data_.type = txt;
}


void Budget::on_dSelect_clicked(const QDate &date)
{
    string day =  to_string(date.day());
    string month = to_string(date.month());
    string year = to_string(date.year());

    string date_str = year+"-"+month+"-"+day;
    data_.date = date_str;

}

void Budget::closeEvent(QCloseEvent *event) {
        database_.close();
}


