
INCLUDEPATH  += "$$PWD/../zlib/1.2.3/include"

HEADERS += crypt.h \
           ioapi.h \
           quazip.h \
           quazipfile.h \
           quazipfileinfo.h \
           quazipnewinfo.h \
           unzip.h \
           zip.h \
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
