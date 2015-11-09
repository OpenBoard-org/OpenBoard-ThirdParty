INCLUDEPATH  += "$$PWD/../zlib/1.2.3/include" \
                "$$PWD/quazip-0.3"

HEADERS += $$PWD/quazip-0.3/crypt.h \
           $$PWD/quazip-0.3/ioapi.h \
           $$PWD/quazip-0.3/quazip.h \
           $$PWD/quazip-0.3/quazipfile.h \
           $$PWD/quazip-0.3/quazipfileinfo.h \
           $$PWD/quazip-0.3/quazipnewinfo.h \
           $$PWD/quazip-0.3/unzip.h \
           $$PWD/quazip-0.3/zip.h \
           "$$PWD/../zlib/1.2.3/include/zlib.h"

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
