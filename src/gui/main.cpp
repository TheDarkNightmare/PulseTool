#include <QApplication>
#include <QDebug>

#include "MainWindow.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    if (qEnvironmentVariableIsSet("WAYLAND_DISPLAY")) {
        qDebug() << "WAYLAND_DISPLAY detected. Using Wayland session.";
    } else {
        qDebug() << "WAYLAND_DISPLAY not set. Falling back to X11 session.";
    }

    MainWindow w;
    w.show();
    return app.exec();
}
