
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

win32 {
    CONFIG( debug, debug|release ) {
        SUB_LIB = "win32/debug"
    } else {
        SUB_LIB = "win32/release"
    }
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

    FREETYPE_DIR = "$PWD/freetype/freetype-2.6.1"

    LIBS        += "-L$$PWD/freetype/lib/$$SUB_LIB" "-lfreetype"
    # no INCLUDEPATH, freetype is not used directly

    QUAZIP_DIR   = "$$PWD/quazip"
    LIBS        += "-L$$QUAZIP_DIR/lib/$$SUB_LIB" "-lquazip"
    INCLUDEPATH += "$$PWD/zlib/1.2.11/include"

    LIBS        += "-L$$PWD/xpdf/lib/$$SUB_LIB" "-lxpdf"
    XPDF_DIR     = "$$PWD/xpdf/xpdf-3.04"
    INCLUDEPATH += "$$XPDF_DIR"
    INCLUDEPATH += "$$XPDF_DIR/goo"
    INCLUDEPATH += "$$XPDF_DIR/splash"

    LIBS += -L$$PWD/../OpenBoard-ThirdParty/openssl/openssl-1.0.2-win64/lib/ -llibeay32
    LIBS += -L$$PWD/../OpenBoard-ThirdParty/openssl/openssl-1.0.2-win64/lib/ -lssleay32
    INCLUDEPATH += $$PWD/../OpenBoard-ThirdParty/openssl/openssl-1.0.2-win64/include
    DEPENDPATH += $$PWD/../OpenBoard-ThirdParty/openssl/openssl-1.0.2-win64/include

    LIBS += -L$$PWD/../OpenBoard-ThirdParty/ffmpeg/lib/ -lavformat -lavcodec -lswscale  -lswresample -lavutil -lfreetype

    INCLUDEPATH += $$PWD/../OpenBoard-ThirdParty/ffmpeg/include
    DEPENDPATH += $$PWD/../OpenBoard-ThirdParty/ffmpeg/include

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


