// include classes
#include "budget.h"
#include "ui_budget.h"
#include "database.hh"
#include "login.h"

// Include libraries to handle strings
#include <QString>
#include <string>

// Other useful libraries
#include <QApplication>
#include <iostream>
#include <QListWidgetItem>

using namespace std;

Budget::Budget(QWidget *parent)
    /* The budget classs is used to create the main app
     * It also handles the functionality of all button
    */

    // setup the main class
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    // set UI
    ui->setupUi(this);

    // create pointer to dialog widget
    login *dialog = new login();

    // connections for login
    connect(dialog,&login::accepted, this, &Budget::onAccept);
    connect(dialog,&login::submitted,this, &Budget::onSubmitted);

    // show the dialog window
    dialog->show();

    // set "expense" as default value for type
    ui->tSelect->setCurrentRow(0);

    // setup our database
    Database database_ = Database();
}

void Budget::onAccept()
    // when dialog exits ok, we show mainwindow
{
    this->show();
}

void Budget::onSubmitted(login_info user)
    /* When login info has been given
     * We use it to log into our database
     * And also fetch categories from database
    */
{
    string pass = user.password;
    string uname = user.username;

    database_.db_connect(pass,uname);

    // fetch and setup categories
    original_categories_ = database_.fetch_categories();
    type_ = "expense";
    populate_category();
}

void Budget::populate_category()
{
    filter_category();

    ui->cSelect->clear();

    for (auto const& [name,id] : filtered_categories_) {
        ui->cSelect->addItem(QString::fromStdString(name));
    }
}

void Budget::filter_category()
{
    filtered_categories_ = {};
    for (auto const& [name,pair] : original_categories_) {
        if (pair.second == type_) {
            filtered_categories_[name] = pair.first;
        }
    }
}

Budget::~Budget()
{
    delete ui;
}

// automatic connections to handle input text
void Budget::on_aText_textChanged()
{
    // fetch text from input
    string txt = ui -> aText -> toPlainText().toStdString();
    data_.amount = txt;
}

void Budget::on_vText_textChanged()
{
    // fetch text from input
    string txt = ui -> vText -> toPlainText().toStdString();
    data_.vendor = txt;
}

void Budget::on_submitButton_clicked()
    /* Submits the current given data
     * Also sets all input back to default
    */
{
    int cat_id = filtered_categories_[data_.category];

    // send input to database
    database_.insert_values(
                data_.date,
                data_.amount,
                data_.vendor,
                cat_id
    );

    // reset all values to default
    ui -> vText->clear();
    ui -> aText->clear();
    ui -> cSelect->clearSelection();
    ui ->tSelect->setCurrentRow(0);
    ui -> dSelect->clearFocus();

}

// handling for select-type input
void Budget::on_cSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    data_.category = txt;
}

void Budget::on_tSelect_itemPressed(QListWidgetItem *item)
{
    string txt = item->text().toStdString();
    type_ = txt;
    cout << "type selected" << endl;

    populate_category();
}


void Budget::on_dSelect_clicked(const QDate &date)
{
    // extract d,m,y from selection
    string day =  to_string(date.day());
    string month = to_string(date.month());
    string year = to_string(date.year());

    // create string from selection
    // formatting will be done on input_values
    string date_str = year+"-"+month+"-"+day;
    data_.date = date_str;

}

// close the connection when app is closed
void Budget::closeEvent(QCloseEvent *event) {
        database_.close();
}

// close when finish button clicked
void Budget::on_pushButton_clicked()
{
    Budget::close();
}

