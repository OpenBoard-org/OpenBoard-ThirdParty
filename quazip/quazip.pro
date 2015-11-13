TEMPLATE = lib
CONFIG  += staticlib debug_and_release



#QUAZIP_SRC_PATH = "quazip-0.3"
QUAZIP_SRC_PATH = "quazip-0.7.1"

unix {
    linux-g++ {
        SUB_LIB = "linux"
    }
    linux-g++-32 {
        SUB_LIB = "linux"
    }
    linux-g++-64 {
        CONFIG += create_prl
        SUB_LIB = "linux"
    }
}
macx {
    SUB_LIB = "macx"
    CONFIG += x86
    QMAKE_MACOSX_DEPLOYMENT_TARGET = "10.5"
}

win32 {
    SUB_LIB = "win32"

    # workaround for qdatetime.h macro bug
    #DEFINES += NOMINMAX

}

DESTDIR = "lib/$$SUB_LIB"
OBJECTS_DIR  = "objects"

DEPENDPATH  += . 
INCLUDEPATH += . \
               "$$PWD/../zlib/1.2.3" \
               "$$PWD/../zlib/1.2.3/include"

# Input
HEADERS += "$$PWD/../zlib/1.2.3/include/zlib.h" \
           $$QUAZIP_SRC_PATH/crypt.h \   
           $$QUAZIP_SRC_PATH/ioapi.h \
           $$QUAZIP_SRC_PATH/quazip.h \
           $$QUAZIP_SRC_PATH/quazipfile.h \
           $$QUAZIP_SRC_PATH/quazipfileinfo.h \
           $$QUAZIP_SRC_PATH/quazipnewinfo.h \
           $$QUAZIP_SRC_PATH/unzip.h \
           $$QUAZIP_SRC_PATH/zip.h \ 
           $$QUAZIP_SRC_PATH/JlCompress.h \
           $$QUAZIP_SRC_PATH/quaadler32.h \
           $$QUAZIP_SRC_PATH/quachecksum32.h \
           $$QUAZIP_SRC_PATH/quacrc32.h \
           $$QUAZIP_SRC_PATH/quazip_global.h \
           $$QUAZIP_SRC_PATH/quazipdir.h

# Input 

SOURCES += $$QUAZIP_SRC_PATH/quazip.cpp \
           $$QUAZIP_SRC_PATH/quazipfile.cpp \
           $$QUAZIP_SRC_PATH/quazipnewinfo.cpp\
           $$QUAZIP_SRC_PATH/unzip.c \
           $$QUAZIP_SRC_PATH/zip.c \
           $$QUAZIP_SRC_PATH/JlCompress.cpp \
           $$QUAZIP_SRC_PATH/qioapi.cpp \
           $$QUAZIP_SRC_PATH/quaadler32.cpp \
           $$QUAZIP_SRC_PATH/quacrc32.cpp \
           $$QUAZIP_SRC_PATH/quazipdir.cpp \
           $$QUAZIP_SRC_PATH/quazipfileinfo.cpp \


