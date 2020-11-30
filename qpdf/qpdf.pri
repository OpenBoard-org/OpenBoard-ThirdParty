# qpdf is used to stripe pdf from unwanted pages. https://github.com/qpdf/qpdf.
# We use the command line version.
#
# For windows, it is in 'OpenBoard-ThirdParty'.
# For Ubuntu, it is in the default distrib. Otherwise use 'apt-get install qpdf'.
# For MAC, use 'brew install qpdf'.

win32 {
    DEFINES += QPDF_DEBUG_BIN_DIR=\\\"$$PWD/qpdf-10.0.4/bin\\\"
    DEFINES += QPDF_BINARY=\\\"qpdf.exe\\\"
}

macx {
    DEFINES += QPDF_DEBUG_BIN_DIR=\\\"\\\"
    DEFINES += QPDF_BINARY=\\\"qpdf\\\"
}

linux-g++* {
    DEFINES += QPDF_DEBUG_BIN_DIR=\\\"\\\"
    DEFINES += QPDF_BINARY=\\\"qpdf\\\"
}
