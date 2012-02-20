INCLUDEPATH  += "$$PWD/../zlib/1.2.3/include" \
                "$$PWD/quazip-0.3"

HEADERS += quazip-0.3/crypt.h \
           quazip-0.3/ioapi.h \
           quazip-0.3/quazip.h \
           quazip-0.3/quazipfile.h \
           quazip-0.3/quazipfileinfo.h \
           quazip-0.3/quazipnewinfo.h \
           quazip-0.3/unzip.h \
           quazip-0.3/zip.h \
           "../zlib/1.2.3/include/zlib.h"

macx {
   LIBS += -lz
}
win32 {
   LIBS     += "-L$$PWD/../zlib/1.2.3/lib" "-lzlib"
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
