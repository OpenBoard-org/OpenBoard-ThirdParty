How to build xpdf
=================

instructions for version 3.03

- Make sure freetype2 is installed in Uniboard/thirdparty/freetype
- Decompress xpdf-3.03.xx.tar.gz

Windows:
	- copy xpdf-3.03/aconf-win32.h into xpdf-3.03/aconf.h
	- edit xpdf-3.03/aconf.h, add this line "#undef UNICODE"
	- qmake
	- nmake

OSX:
    - cd xpdf-3.03
    - ./configure --with-freetype2-library="../../freetype/lib/macx" --with-freetype2-includes="../../freetype/freetype-2.4.6/include"
    - If "can't find freetype" message appeared at compile output edit aconf.h by replacing
	"/* #undef HAVE_FREETYPE_FREETYPE_H */" with "#define HAVE_FREETYPE_FREETYPE_H 1" and
	"/* #undef HAVE_SPLASH */"              with "#define HAVE_SPLASH 1"
    - cd ..
    - qmake xpdf.pro -spec macx-g++
    - make

Linux:
    - cd xpdf-3.03
    - ./configure --with-freetype2-library="../../freetype/lib/linux" --with-freetype2-includes="../../freetype/freetype-2.4.6/include"
    - cd ..
    - qmake xpdf.pro -spec linux-g++
    - make
