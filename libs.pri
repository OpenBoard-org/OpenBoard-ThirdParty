
linux-g++ {
    SUB_LIB = "linux"
}

linux-g++-32 {
    SUB_LIB = "linux"
}
linux-g++-64 {
    SUB_LIB = "linux"
}

macx {
    SUB_LIB = "macx"
}

linux-g++-32 {
    LIBS        += -lpaper
}
linux-g++-64 {
    LIBS        += -lpaper
}

linux-g++ {
    LIBS        += -lpaper

    LIBS += -lpoppler
    INCLUDEPATH += "/usr/include/poppler"

    LIBS += -lquazip5
    INCLUDEPATH += "/usr/include/quazip"
}

win32 {
    CONFIG( debug, debug|release ) {
        SUB_LIB = "win32/debug"
    } else {
        SUB_LIB = "win32/release"
    }

#    DEFINES += USE_XPDF

    #FREETYPE
    FREETYPE_DIR = "$$PWD/freetype"
    CONFIG( debug, debug|release ) {
        LIBS        += "-L$$FREETYPE_DIR/debug/lib" "-lfreetyped"
    } else {
        LIBS        += "-L$$FREETYPE_DIR/lib" "-lfreetype"
        # no INCLUDEPATH, freetype is not used directly
    }

    QUAZIP_DIR   = "$$PWD/quazip"
    LIBS        += "-L$$QUAZIP_DIR/lib/$$SUB_LIB" "-lquazip"
    INCLUDEPATH += "$$PWD/zlib/1.2.11/include"

    INCLUDEPATH += "$$PWD/openssl/openssl-1.1.1j-win64/include"
    QMAKE_LIBDIR += "$$PWD/openssl/openssl-1.1.1j-win64/lib"

    #POPPLER
    POPPLER_DIR  = "$$PWD/poppler"
    INCLUDEPATH += "$$POPPLER_DIR/include"
    INCLUDEPATH += "$$POPPLER_DIR/include/poppler"
    CONFIG( debug, debug|release ) {
        LIBS        += "-L$$POPPLER_DIR/debug/lib" "-lpoppler"
    } else {
        LIBS        += "-L$$POPPLER_DIR/lib" "-lpoppler"
    }

    LIBS += -llibssl
    LIBS += -llibcrypto

    LIBS += -lWmvcore
    LIBS += -lWinmm

    # need those link if we want to change default printer and print usind shell command
    LIBS        += "-L$$PWD/microsoft/lib" "-lWinspool"
    LIBS        += "-L$$PWD/microsoft/lib" "-lshell32"
}

macx {
    LIBS         += "-framework QuartzCore"
    LIBS         += "-framework AudioToolbox"
    LIBS         += "-framework CoreAudio"
    LIBS         += "-framework ApplicationServices"
    LIBS         += "-framework Cocoa"
            
    LIBS         += "-lcrypto"
}


