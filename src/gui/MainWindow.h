#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

class MainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = nullptr);

private slots:
    void runBasePackage();
    void runCannon();
    void runFastFetch();
    void runGame();
    void runMultimedia();

private:
    void runFunction(const QString &functionName);
};

#endif // MAINWINDOW_H
