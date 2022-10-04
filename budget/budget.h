#ifndef BUDGET_H
#define BUDGET_H

#include <QMainWindow>
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
    void on_cText_textChanged();
    void on_aText_textChanged();
    void on_vText_textChanged();
    void on_dText_textChanged();
    void on_submitButton_clicked();

private:
    Ui::MainWindow *ui;
    // vars
    std::string cText_;
    std::string aText_;
    std::string vText_;
    std::string dText_;
};
#endif // BUDGET_H
