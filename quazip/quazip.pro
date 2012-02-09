TEMPLATE = lib
CONFIG  += staticlib release

QUAZIP_SRC_PATH = "quazip-0.3"

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
}

win32 {
    SUB_LIB = "win32"
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
           $$QUAZIP_SRC_PATH/zip.h 

# Input 

SOURCES += $$QUAZIP_SRC_PATH/ioapi.c \
           $$QUAZIP_SRC_PATH/quazip.cpp \
           $$QUAZIP_SRC_PATH/quazipfile.cpp \
           $$QUAZIP_SRC_PATH/quazipnewinfo.cpp\
           $$QUAZIP_SRC_PATH/unzip.c \
           $$QUAZIP_SRC_PATH/zip.c

