#ifndef BUDGET_H
#define BUDGET_H

#include <QMainWindow>
#include <QListWidgetItem>
#include <string>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

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

private:
    Ui::MainWindow *ui;

    // vars
    std::string aText_;
    std::string vText_;
    std::string dSelect_;
    std::string cSelect_;
    std::string tSelect_;
};
#endif // BUDGET_H
