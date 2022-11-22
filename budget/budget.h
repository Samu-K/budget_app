#ifndef BUDGET_H
#define BUDGET_H

// include custom class
#include "database.hh"
#include "login.h"

// include qt libraries
#include <QMainWindow>
#include <QListWidgetItem>

// create structure to represent transaction data
struct trsData {
    std::string date, amount, vendor, category;
};

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

// setup the budget class
class Budget : public QMainWindow
{
    Q_OBJECT

public:
    Budget(QWidget *parent = nullptr);
    ~Budget();

private slots:
    void on_aText_textChanged();
    void on_vText_textChanged();
    void on_submitButton_clicked();
    void on_cSelect_itemPressed(QListWidgetItem *item);
    void on_tSelect_itemPressed(QListWidgetItem *item);
    void on_dSelect_clicked(const QDate &date);

    void closeEvent(QCloseEvent *event);
    void onAccept();
    void on_pushButton_clicked();

public slots:
    void onSubmitted(login_info user);

private:
    Ui::MainWindow *ui;

    // funcs
    void populate_category();
    void filter_category();

    // vars
    trsData data_;
    string type_;
    Database database_;
    string pass_, uname_;
    map<string,pair<int,string>> original_categories_;
    map<string,int> filtered_categories_;
};

#endif // BUDGET_H
