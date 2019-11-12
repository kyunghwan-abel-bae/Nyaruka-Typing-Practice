QT += core gui quick qml multimedia

# Add more folders to ship with the application, here
folder_01.source = qml/atpVer1_0
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    fileio.cpp \
    sndeffect.cpp

# Installation path
# target.path =

# 2013-08-24 direct X
#INCLUDEPATH += $$PWD/../../../Program Files (x86)/Microsoft DirectX SDK (August 2009)/Lib/x86
#DEPENDPATH += $$PWD/../../../Program Files (x86)/Microsoft DirectX SDK (August 2009)/Lib/x86

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()


OTHER_FILES += \
    qml/atpVer1_0/Core/MainMenu.qml \
    qml/atpVer1_0/Core/Core_Part/MainButton.qml \
    qml/atpVer1_0/Core/Core_Part/BackButton.qml \
    qml/atpVer1_0/Core/Menu1.qml \
    qml/atpVer1_0/Core/Menu2.qml \
    qml/atpVer1_0/Core/Menu3.qml \
    qml/atpVer1_0/Core/Menu4.qml \
    qml/atpVer1_0/Core/Menu5.qml \
    qml/atpVer1_0/Core/Core_Part/InstructionButton.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu1.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu1_Parts/Level1.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Buttons.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu1_Parts/Level2.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu1_Parts/Level3.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu1_Parts/Level4.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu1_Parts/Level5.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu2.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu3.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu4.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu5.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu3_Parts/Level1.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu3_Parts/Level2.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu3_Parts/Level3.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu3_Parts/Level4.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu3_Parts/Level5.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu3_Parts/Level6.qml \
    qml/atpVer1_0/Core/Instruction/Inst_Menu5_Part.qml \
    qml/atpVer1_0/Core/Core_Part/HideButton.qml \
    qml/atpVer1_0/Core/Result/Score1.qml \
    qml/atpVer1_0/Core/Result/Result_Buttons.qml \
    qml/atpVer1_0/Core/Result/Score2_4.qml \
    qml/atpVer1_0/Core/Result/Score5.qml \
    qml/atpVer1_0/Core/Core_Part/AgainButton.qml \
    qml/atpVer1_0/Core/Core_Part/ShowButton.qml \
    qml/atpVer1_0/Core/Cover.qml

HEADERS += \
    fileio.h \
    sndeffect.h

RC_FILE = amakuru.rc

RESOURCES += \
    atpVer1_0.qrc
