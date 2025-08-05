#include "MainWindow.h"

#include <QCoreApplication>
#include <QApplication>
#include <QMessageBox>
#include <QProcess>
#include <QProgressDialog>
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

void MainWindow::runFunction(const QString &functionName)
{
    QString scriptPath = QCoreApplication::applicationDirPath() + "/../src/pulse-functions.sh";

    QProcess process;
    process.setProgram("bash");
    process.setArguments({scriptPath, functionName});

    QProgressDialog progress(tr("Running %1...").arg(functionName), tr("Cancel"), 0, 0, this);
    progress.setWindowModality(Qt::WindowModal);
    progress.show();

    process.start();
    if (!process.waitForStarted()) {
        progress.close();
        QMessageBox::warning(this, tr("Error"), tr("Failed to start %1").arg(functionName));
        return;
    }

    while (process.state() == QProcess::Running) {
        qApp->processEvents();
        if (progress.wasCanceled()) {
            process.kill();
            process.waitForFinished();
            QMessageBox::information(this, tr("Canceled"), tr("%1 was canceled").arg(functionName));
            return;
        }
    }
    progress.close();

    if (process.exitStatus() != QProcess::NormalExit || process.exitCode() != 0) {
        QMessageBox::critical(this, tr("Error"), QString::fromLocal8Bit(process.readAllStandardError()));
    } else {
        QMessageBox::information(this, tr("Finished"), QString::fromLocal8Bit(process.readAllStandardOutput()));
    }
}

void MainWindow::runBasePackage()
{
    runFunction("install_base_package");
}

void MainWindow::runCannon()
{
    runFunction("install_cannon");
}

void MainWindow::runFastFetch()
{
    runFunction("install_fastfetch");
}

void MainWindow::runGame()
{
    runFunction("install_game");
}

void MainWindow::runMultimedia()
{
    runFunction("install_multimedia");
}

