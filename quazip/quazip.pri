INCLUDEPATH  += "$$PWD/../zlib/1.2.11/include" \
                "$$PWD/quazip"

DEFINES += QUAZIP_STATIC

HEADERS += \
    $$PWD/quazip/crypt.h \
    $$PWD/quazip/quazip_global.h \
    $$PWD/quazip/ioapi.h \
    $$PWD/quazip/quazip.h \
    $$PWD/quazip/quazipfile.h \
    $$PWD/quazip/quazipfileinfo.h \
    $$PWD/quazip/quazipnewinfo.h \
    $$PWD/quazip/unzip.h \
    $$PWD/quazip/zip.h \
    $$PWD/../zlib/1.2.11/include/zlib.h




macx {
   LIBS += -lz
}
win32 {
   LIBS     += "-L$$PWD/../zlib/1.2.11/lib" "-lzlib"

}
linux-g++ {
   LIBS += -lz
}
linux-g++-32 {
   LIBS += -lz
}
linux-g++-64 {
   LIBS += -lz
}
