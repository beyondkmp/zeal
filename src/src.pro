#-------------------------------------------------
#
# Project created by QtCreator 2013-01-18T22:28:41
#
#-------------------------------------------------

TEMPLATE = app

QT += gui gui-private widgets sql webkitwidgets
CONFIG += c++11

use_webengine {
    QT      += webenginewidgets
    DEFINES += USE_WEBENGINE
}

TARGET = zeal
target.path = /usr/bin
INSTALLS = target

# TODO: Obtain version number from Git tags
VERSION = $$(ZEAL_VERSION)
isEmpty(VERSION) {
    VERSION = 0.0.0
}
DEFINES += ZEAL_VERSION=\\\"$${VERSION}\\\"

SOURCES += \
    main.cpp

include(core/core.pri)
include(registry/registry.pri)
include(ui/ui.pri)

!msvc:LIBS += -lz -L/usr/lib

win32:RC_ICONS = zeal.ico
msvc:QMAKE_LIBS += user32.lib

macx {
    QMAKE_CXXFLAGS += -mmacosx-version-min=10.7 -stdlib=libc+
    ICON = zeal.icns
}

appicons16.path=/usr/share/icons/hicolor/16x16/apps
appicons24.path=/usr/share/icons/hicolor/24x24/apps
appicons32.path=/usr/share/icons/hicolor/32x32/apps
appicons64.path=/usr/share/icons/hicolor/64x64/apps
appicons128.path=/usr/share/icons/hicolor/128x128/apps
appicons16.files=appicons/16/*
appicons24.files=appicons/24/*
appicons32.files=appicons/32/*
appicons64.files=appicons/64/*
appicons128.files=appicons/128/*
desktop.path=/usr/share/applications
desktop.files=zeal.desktop
unix:INSTALLS += appicons16 appicons24 appicons32 appicons64 appicons128 desktop

include(3rdparty/qxtglobalshortcut/qxtglobalshortcut.pri)

RESOURCES += \
    zeal.qrc
