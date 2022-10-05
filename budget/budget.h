#ifndef BUDGET_H
#define BUDGET_H

#include "QtCore/qdatetime.h"
#include <QMainWindow>
#include <QListWidgetItem>
#include <string>

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

    void insert_values(std::string date_str,int amount,std::string vendor,int category, int type_mod);

private slots:
    void on_aText_textChanged();
    void on_vText_textChanged();
    void on_submitButton_clicked();
    void on_cSelect_itemPressed(QListWidgetItem *item);
    void on_tSelect_itemPressed(QListWidgetItem *item);
    void on_dSelect_clicked(const QDate &date);

private:
    Ui::MainWindow *ui;

    // vars
    trsData data_;
};
#endif // BUDGET_H
