
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


    FREETYPE_DIR = "$PWD/freetype/freetype-2.6.1"

    LIBS        += "-L$$PWD/freetype/lib/$$SUB_LIB" "-lfreetype"
    # no INCLUDEPATH, freetype is not used directly

    QUAZIP_DIR   = "$$PWD/quazip"
    LIBS        += "-L$$QUAZIP_DIR/lib/$$SUB_LIB" "-lquazip"
    INCLUDEPATH += "$$PWD/zlib/1.2.11/include"

    DEFINES += USE_XPDF
    contains (DEFINES, USE_XPDF) {
        LIBS        += "-L$$PWD/xpdf/lib/$$SUB_LIB" "-lxpdf"
        XPDF_DIR     = "$$PWD/xpdf/xpdf-3.04"
        INCLUDEPATH += "$$XPDF_DIR"
        INCLUDEPATH += "$$XPDF_DIR/goo"
        INCLUDEPATH += "$$XPDF_DIR/splash"
    } else {
        CONFIG( debug, debug|release ) {
            LIBS += "-L$$PWD/poppler/poppler-20.10.0/build/Debug" "-lpoppler"
        } else {
            LIBS += "-L$$PWD/poppler/poppler-20.10.0/build/Release" "-lpoppler"
        }
        INCLUDEPATH += "$$PWD/poppler/poppler-20.10.0"
        # For 'poppler_config.h"
        INCLUDEPATH += "$$PWD/poppler/poppler-20.10.0/build/poppler"
        # For "poppler-version.h"
        INCLUDEPATH += "$$PWD/poppler/poppler-20.10.0/cpp"
    }

    # QPDF
    LIBS += "-L$$PWD/qpdf/lib/$$SUB_LIB" "-lqpdf"
    LIBS += "-L$$PWD/libjpeg-turbo/2.0.6/windows/lib" "-ljpeg-static"
    DEFINES += USE_CRYPTO_OPENSSL
    INCLUDEPATH += "$$PWD/qpdf/qpdf-10.0.4/windows/include"
    INCLUDEPATH += "$$PWD/libjpeg-turbo/2.0.6/windows/include"

    INCLUDEPATH += "$$PWD/openssl/openssl-1.1.0-win64/include"
    QMAKE_LIBDIR += "$$PWD/openssl/openssl-1.1.0-win64/lib"

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


