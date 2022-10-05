#include "budget.h"
#include "ui_budget.h"

#include <iostream>
#include <string>
#include <QSqlQuery>

using namespace std;

string convert_date(string to_convert) {
    const char *time_details = to_convert.c_str();
    struct tm othertm;

    strptime(time_details,"%d %M %d %Y",&othertm);

    time_t date = mktime(&othertm);

    // Setup variables for strftime
    tm * date_tm;
    char date_str[100];
    time(&date);
    date_tm = localtime(&date);

    // Format the date to be YYYY/MM/DD
    // Result gets save to a string in date_str
    strftime(date_str,50,"%Y-%m-%d",date_tm);

    // Return the formatted string
    return date_str;
}

Budget::Budget(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->tSelect->setCurrentRow(0);
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
    string date = convert_date(data_.date);

    insert_values(
                date,
                stoi(data_.amount),
                data_.vendor,
                stoi(data_.category),
                stoi(data_.type)

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
    string txt = date.toString().toStdString();
    data_.date = txt;
}

void Budget::insert_values(string date_str,int amount,string vendor,int category, int type_mod) {
    // Init our query
    QSqlQuery query;

    // Our target table depends on previous input
    if (type_mod == 1) {
        query.prepare("INSERT INTO expenses "
                        "VALUES (:date,:amount,:vendor,:category)");

    } else if (type_mod == 2) {
        query.prepare("INSERT INTO income "
                        "VALUES (:date,:amount,:vendor,:category)");
    }

    // Add values to insert query
    query.bindValue(":date",QString::fromStdString(date_str));
    query.bindValue(":amount",amount);
    query.bindValue(":vendor",QString::fromStdString(vendor));
    query.bindValue(":category",category);

    // Execute our query
    query.exec();
}
