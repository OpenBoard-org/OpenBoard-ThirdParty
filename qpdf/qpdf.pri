# qpdf is used to stripe pdf from unwanted pages. https://github.com/qpdf/qpdf.

win32 {
    # For windows, we use the command line version in 'OpenBoard-ThirdParty', due to
    # qpdf prebuid library limitations.
    DEFINES += OB_USE_QPDF_AS_SIDE_BY_SIDE
    DEFINES += QPDF_DEBUG_BIN_DIR=\\\"$$PWD/qpdf-10.0.4/bin\\\"
    DEFINES += QPDF_BINARY=\\\"qpdf.exe\\\"

    # When using 'qpdf.cc' main function, the 'lib' version of qpdf can't work on windows if we use the
    # prebuilt libraries, due to stl compile settings. To make it work, we could:
    # -Avoid using 'qpdf.cc', and then include all pdf cleaning code in OB instead.
    # -Build our own windows libraries with correct settings. Note this will implies we build a debug and release lib on Windows if we use MSVC.
}

macx {
    # No need to use qpdf as side by side.
    #DEFINES += OB_USE_QPDF_AS_SIDE_BY_SIDE
    #DEFINES += QPDF_DEBUG_BIN_DIR=\\\"$$PWD/qpdf-10.0.4/bin_mac\\\"
    #DEFINES += QPDF_BINARY=\\\"qpdf\\\"

    DEFINES += OB_USE_QPDF_AS_LIB

    # qpdf
    LIBS += "-L/usr/local/Cellar/qpdf/10.0.4/lib" "-lqpdf"
    INCLUDEPATH += "/usr/local/Cellar/qpdf/10.0.4/include"

    # libjpeg header, only required by "qpdf.cc"
    INCLUDEPATH += "/usr/local/Cellar/jpeg/9d/include"
}

linux-g++* {
    #DEFINES += OB_USE_QPDF_AS_SIDE_BY_SIDE
    #DEFINES += QPDF_DEBUG_BIN_DIR=\\\"\\\"
    #DEFINES += QPDF_BINARY=\\\"qpdf\\\"

    DEFINES += OB_USE_QPDF_AS_LIB

    # qpdf
    LIBS += "-lqpdf"
}
