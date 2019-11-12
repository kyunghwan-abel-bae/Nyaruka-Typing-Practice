#include <QtGui/QGuiApplication>
#include <QtQuick>

#include <QQmlEngine>
#include <QQmlContext>

#include "qtquick2applicationviewer.h"

#include "fileio.h"
#include "sndeffect.h"

int main(int argc, char *argv[]){

    QGuiApplication app(argc, argv);
    QGuiApplication::addLibraryPath(QGuiApplication::applicationDirPath() + "/plugins");

    QtQuick2ApplicationViewer viewer;

    viewer.setMainQmlFile(QStringLiteral("./qml/atpVer1_0/main.qml"));
    viewer.setTitle("Nyaruka Typing Practice");
    viewer.setMinimumSize(QSize(1024,600));
    viewer.setMaximumSize(QSize(1024,600));
    viewer.rootContext()->setContextProperty("FileIO", new FileIO());
    viewer.rootContext()->setContextProperty("SndEffect", new SndEffect());
    viewer.rootContext()->setContextProperty("SndEffect_Error", new SndEffect());

    QScreen *screen = app.primaryScreen();
    QSize screenSize = screen->availableSize();

    if(screenSize.width()<=1024||screenSize.height()<=560) viewer.showFullScreen();
    else viewer.showExpanded();

    return app.exec();
}
