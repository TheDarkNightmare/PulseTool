#include "MainWindow.h"

#include <QCoreApplication>
#include <QMessageBox>
#include <QProcess>
#include <QPushButton>
#include <QVBoxLayout>
#include <QWidget>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    QWidget *central = new QWidget(this);
    QVBoxLayout *layout = new QVBoxLayout(central);

    QPushButton *baseBtn = new QPushButton(tr("Install Base Package"), this);
    connect(baseBtn, &QPushButton::clicked, this, &MainWindow::runBasePackage);
    layout->addWidget(baseBtn);

    QPushButton *cannonBtn = new QPushButton(tr("Install Cannon Driver"), this);
    connect(cannonBtn, &QPushButton::clicked, this, &MainWindow::runCannon);
    layout->addWidget(cannonBtn);

    QPushButton *fastfetchBtn = new QPushButton(tr("Run FastFetch"), this);
    connect(fastfetchBtn, &QPushButton::clicked, this, &MainWindow::runFastFetch);
    layout->addWidget(fastfetchBtn);

    QPushButton *gameBtn = new QPushButton(tr("Install Game Package"), this);
    connect(gameBtn, &QPushButton::clicked, this, &MainWindow::runGame);
    layout->addWidget(gameBtn);

    QPushButton *multimediaBtn = new QPushButton(tr("Install Multimedia Package"), this);
    connect(multimediaBtn, &QPushButton::clicked, this, &MainWindow::runMultimedia);
    layout->addWidget(multimediaBtn);

    setCentralWidget(central);
    setWindowTitle(tr("PulseTool GUI"));
}

void MainWindow::runScript(const QString &scriptName)
{
    QString scriptPath = QCoreApplication::applicationDirPath() + "/../" + scriptName;

    QProcess process;
    process.setProgram("bash");
    process.setArguments({scriptPath});
    process.start();
    if (!process.waitForStarted()) {
        QMessageBox::warning(this, tr("Error"), tr("Failed to start %1").arg(scriptName));
        return;
    }
    process.waitForFinished(-1);

    QString output = process.readAllStandardOutput();
    QString errorOutput = process.readAllStandardError();
    QMessageBox::information(this, tr("Finished"), output + errorOutput);
}

void MainWindow::runBasePackage()
{
    runScript("base-package.sh");
}

void MainWindow::runCannon()
{
    runScript("cannon.sh");
}

void MainWindow::runFastFetch()
{
    runScript("fastfetch.sh");
}

void MainWindow::runGame()
{
    runScript("game.sh");
}

void MainWindow::runMultimedia()
{
    runScript("multimedia.sh");
}

