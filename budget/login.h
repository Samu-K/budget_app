#ifndef LOGIN_H
#define LOGIN_H

#include <QDialog>
#include <string>

using namespace std;

struct login_info {
    string username, password;
};

namespace Ui {
class login;
}

class login : public QDialog
{
    Q_OBJECT

public:
    explicit login(QWidget *parent = nullptr);
    ~login();

    // vars
    string pass_;
    string uname_;

signals:
    void accepted();
    void submitted(login_info);

private slots:
    void on_pText_textChanged();
    void on_uText_textChanged();
    void on_buttonBox_accepted();

private:
    Ui::login *ui;
};

#endif // LOGIN_H
