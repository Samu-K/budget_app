#ifndef BUDGET_H
#define BUDGET_H

#include "QtCore/qdatetime.h"
#include "database.hh"
#include <QMainWindow>
#include <QListWidgetItem>
#include <string>

#include <QSqlDatabase>

struct trsData {
    std::string date, amount, vendor, category, type;
};

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class Budget : public QMainWindow
{
    Q_OBJECT

public:
    Budget(QWidget *parent = nullptr);
    ~Budget();

    void insert_values(std::string date_str,int amount,std::string vendor,int category, std::string type);

private slots:
    void on_aText_textChanged();
    void on_vText_textChanged();
    void on_submitButton_clicked();
    void on_cSelect_itemPressed(QListWidgetItem *item);
    void on_tSelect_itemPressed(QListWidgetItem *item);
    void on_dSelect_clicked(const QDate &date);

    void closeEvent(QCloseEvent *event);

private:
    Ui::MainWindow *ui;

    // vars
    trsData data_;
    Database database_;
    map<string,int> category_index_;
};
#endif // BUDGET_H
