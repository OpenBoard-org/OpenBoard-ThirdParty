QT -= gui

CONFIG += c++11
TEMPLATE  = lib
CONFIG   += staticlib debug_and_release

JPEG_TURBO_SRC_DIR = "$$PWD/2.0.6/src"

unix {
    CONFIG += create_prl
    SUB_LIB = "linux"
    message ("Warning: This build is incomplete on linux.")

    # For 'jconfig.h' and 'jconfigint.h'. This is different for every platform/compiler,
    # usually created by CMake when configuring.
    # TODO: Have the correct files for linux.
    INCLUDEPATH += \
        $$JPEG_TURBO_SRC_DIR\linux

    INSTALL_INCLUDES_FILES += "$$JPEG_TURBO_SRC_DIR/linux/jconfig.h"
}

macx {
    CONFIG += x86_64
    QMAKE_MACOSX_DEPLOYMENT_TARGET = "10.10"

    SUB_LIB = "macx"
    message ("Warning: This build is incomplete on MAC.")

    # For 'jconfig.h' and 'jconfigint.h'. This is different for every platform/compiler,
    # usually created by CMake when configuring.
    # TODO: Have the correct files for mac.
    INCLUDEPATH += \
        $$JPEG_TURBO_SRC_DIR\macx

    INSTALL_INCLUDES_FILES += "$$JPEG_TURBO_SRC_DIR/macx/jconfig.h"
}

win32 {
    SUB_LIB = "win32"
    DEFINES += _CRT_SECURE_NO_WARNINGS

    # For 'jconfig.h' and 'jconfigint.h'. This is different for every platform/compiler,
    # usually created by CMake when configuring.
    INCLUDEPATH += \
        $$JPEG_TURBO_SRC_DIR\win

    INSTALL_INCLUDES_FILES += "$$JPEG_TURBO_SRC_DIR/win/jconfig.h"
}

CONFIG( debug, debug|release ) {
    SUB_LIB = "$$SUB_LIB/debug"
} else {
    SUB_LIB = "$$SUB_LIB/release"
}
DESTDIR = "$$PWD/lib/$$SUB_LIB"

# Prevents 'debug/release' object mixing when not using shadow builds.
CONFIG( debug, debug|release ) {
    OBJECTS_DIR = "objects/debug"
} else {
    OBJECTS_DIR = "objects/release"
}

SOURCES += \
    $$JPEG_TURBO_SRC_DIR/jcapimin.c \
    $$JPEG_TURBO_SRC_DIR/jcapistd.c \
    $$JPEG_TURBO_SRC_DIR/jccoefct.c \
    $$JPEG_TURBO_SRC_DIR/jccolor.c \
    $$JPEG_TURBO_SRC_DIR/jcdctmgr.c \
    $$JPEG_TURBO_SRC_DIR/jchuff.c \
    $$JPEG_TURBO_SRC_DIR/jcicc.c \
    $$JPEG_TURBO_SRC_DIR/jcinit.c \
    $$JPEG_TURBO_SRC_DIR/jcmainct.c \
    $$JPEG_TURBO_SRC_DIR/jcmarker.c \
    $$JPEG_TURBO_SRC_DIR/jcmaster.c \
    $$JPEG_TURBO_SRC_DIR/jcomapi.c \
    $$JPEG_TURBO_SRC_DIR/jcparam.c \
    $$JPEG_TURBO_SRC_DIR/jcphuff.c \
    $$JPEG_TURBO_SRC_DIR/jcprepct.c \
    $$JPEG_TURBO_SRC_DIR/jcsample.c \
    $$JPEG_TURBO_SRC_DIR/jctrans.c \
    $$JPEG_TURBO_SRC_DIR/jdapimin.c \
    $$JPEG_TURBO_SRC_DIR/jdapistd.c \
    $$JPEG_TURBO_SRC_DIR/jdatadst.c \
    $$JPEG_TURBO_SRC_DIR/jdatasrc.c \
    $$JPEG_TURBO_SRC_DIR/jdcoefct.c \
    $$JPEG_TURBO_SRC_DIR/jdcolor.c \
    $$JPEG_TURBO_SRC_DIR/jddctmgr.c \
    $$JPEG_TURBO_SRC_DIR/jdhuff.c \
    $$JPEG_TURBO_SRC_DIR/jdicc.c \
    $$JPEG_TURBO_SRC_DIR/jdinput.c \
    $$JPEG_TURBO_SRC_DIR/jdmainct.c \
    $$JPEG_TURBO_SRC_DIR/jdmarker.c \
    $$JPEG_TURBO_SRC_DIR/jdmaster.c \
    $$JPEG_TURBO_SRC_DIR/jdmerge.c \
    $$JPEG_TURBO_SRC_DIR/jdphuff.c \
    $$JPEG_TURBO_SRC_DIR/jdpostct.c \
    $$JPEG_TURBO_SRC_DIR/jdsample.c \
    $$JPEG_TURBO_SRC_DIR/jdtrans.c \
    $$JPEG_TURBO_SRC_DIR/jerror.c \
    $$JPEG_TURBO_SRC_DIR/jfdctflt.c \
    $$JPEG_TURBO_SRC_DIR/jfdctfst.c \
    $$JPEG_TURBO_SRC_DIR/jfdctint.c \
    $$JPEG_TURBO_SRC_DIR/jidctflt.c \
    $$JPEG_TURBO_SRC_DIR/jidctfst.c \
    $$JPEG_TURBO_SRC_DIR/jidctint.c \
    $$JPEG_TURBO_SRC_DIR/jidctred.c \
    $$JPEG_TURBO_SRC_DIR/jquant1.c \
    $$JPEG_TURBO_SRC_DIR/jquant2.c \
    $$JPEG_TURBO_SRC_DIR/jutils.c \
    $$JPEG_TURBO_SRC_DIR/jmemmgr.c \
    $$JPEG_TURBO_SRC_DIR/jmemnobs.c \
    $$JPEG_TURBO_SRC_DIR/jaricom.c \
    $$JPEG_TURBO_SRC_DIR/jcarith.c \
    $$JPEG_TURBO_SRC_DIR/jdarith.c \
    $$JPEG_TURBO_SRC_DIR/jsimd_none.c

INCLUDEPATH += \
    $$JPEG_TURBO_SRC_DIR

# Now copy required includes files. We don't use 'INSTALLS' because it simply
# doesn't work on windows (see INSTALL_ROOT), plus we don't want to interfere
# with existing system libs and includes.
INSTALL_INCLUDES_PATH = "$$PWD/include"
mkpath($$INSTALL_INCLUDES_PATH)
INSTALL_INCLUDES_FILES += "$$JPEG_TURBO_SRC_DIR/jerror.h"
INSTALL_INCLUDES_FILES += "$$JPEG_TURBO_SRC_DIR/jmorecfg.h"
INSTALL_INCLUDES_FILES += "$$JPEG_TURBO_SRC_DIR/jpeglib.h"

# Explicit file copy.
# From: https://stackoverflow.com/questions/3984104/qmake-how-to-copy-a-file-to-the-output
win32 {
    INSTALL_INCLUDES_FILES_WIN = $${INSTALL_INCLUDES_FILES}
    INSTALL_INCLUDES_FILES_WIN ~= s,/,\\,g
        DESTDIR_WIN = $${INSTALL_INCLUDES_PATH}
    DESTDIR_WIN ~= s,/,\\,g
    for(FILE,INSTALL_INCLUDES_FILES_WIN){
                QMAKE_POST_LINK +=$$quote(cmd /c copy /y $${FILE} $${DESTDIR_WIN}$$escape_expand(\n\t))
    }
} else {
    for(FILE,INSTALL_INCLUDES_FILES){
        QMAKE_POST_LINK += $$quote(cp $${FILE} $${INSTALL_INCLUDES_PATH}$$escape_expand(\n\t))
    }
}

