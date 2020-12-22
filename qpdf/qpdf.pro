QT -= gui

CONFIG += c++11

TEMPLATE  = lib
CONFIG   += staticlib debug_and_release

unix {
    CONFIG += create_prl
    SUB_LIB = "linux"

    message ("Warning: This build is untested on linux.")
}

macx {
    CONFIG += x86_64
    QMAKE_MACOSX_DEPLOYMENT_TARGET = "10.10"

    SUB_LIB = "macx"
    message ("Warning: This build is untested on MAC.")
}

win32 {
    SUB_LIB = "win32"

    # OpenSSL requirement
    INCLUDEPATH += "$$PWD/../openssl/openssl-1.1.0-win64/include"

    # Lib JPEG requirement.
    INCLUDEPATH += "$$PWD/../jpeg-turbo/include"

    # Lib zlib requirement
    INCLUDEPATH += "$$PWD/../zlib/1.2.11/include"

    DEFINES += USE_CRYPTO_OPENSSL
}

# Make sure we don't mix release/debug lib.
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


QPDF_DIR = "$$PWD/qpdf-10.0.4/src"


#CRYPTO_NATIVE = \
#        $$QPDF_DIR/libqpdf/AES_PDF_native.cc \
#        $$QPDF_DIR/libqpdf/MD5_native.cc \
#        $$QPDF_DIR/libqpdf/QPDFCrypto_native.cc \
#        $$QPDF_DIR/libqpdf/RC4_native.cc \
#        $$QPDF_DIR/libqpdf/SHA2_native.cc \
#        $$QPDF_DIR/libqpdf/rijndael.cc \
#        $$QPDF_DIR/libqpdf/sha2.c \
#        $$QPDF_DIR/libqpdf/sha2big.c

CRYPTO_OPENSSL = \
        $$QPDF_DIR/libqpdf/QPDFCrypto_openssl.cc

#CRYPTO_GNUTLS = \
#        $$QPDF_DIR/libqpdf/QPDFCrypto_gnutls.cc

SRCS_libqpdf = \
        $$QPDF_DIR/libqpdf/BitStream.cc \
        $$QPDF_DIR/libqpdf/BitWriter.cc \
        $$QPDF_DIR/libqpdf/Buffer.cc \
        $$QPDF_DIR/libqpdf/BufferInputSource.cc \
        $$QPDF_DIR/libqpdf/ClosedFileInputSource.cc \
        $$QPDF_DIR/libqpdf/ContentNormalizer.cc \
        $$QPDF_DIR/libqpdf/CryptoRandomDataProvider.cc \
        $$QPDF_DIR/libqpdf/FileInputSource.cc \
        $$QPDF_DIR/libqpdf/InputSource.cc \
        $$QPDF_DIR/libqpdf/InsecureRandomDataProvider.cc \
        $$QPDF_DIR/libqpdf/JSON.cc \
        $$QPDF_DIR/libqpdf/MD5.cc \
        $$QPDF_DIR/libqpdf/OffsetInputSource.cc \
        $$QPDF_DIR/libqpdf/Pipeline.cc \
        $$QPDF_DIR/libqpdf/Pl_AES_PDF.cc \
        $$QPDF_DIR/libqpdf/Pl_ASCII85Decoder.cc \
        $$QPDF_DIR/libqpdf/Pl_ASCIIHexDecoder.cc \
        $$QPDF_DIR/libqpdf/Pl_Buffer.cc \
        $$QPDF_DIR/libqpdf/Pl_Concatenate.cc \
        $$QPDF_DIR/libqpdf/Pl_Count.cc \
        $$QPDF_DIR/libqpdf/Pl_DCT.cc \
        $$QPDF_DIR/libqpdf/Pl_Discard.cc \
        $$QPDF_DIR/libqpdf/Pl_Flate.cc \
        $$QPDF_DIR/libqpdf/Pl_LZWDecoder.cc \
        $$QPDF_DIR/libqpdf/Pl_MD5.cc \
        $$QPDF_DIR/libqpdf/Pl_PNGFilter.cc \
        $$QPDF_DIR/libqpdf/Pl_QPDFTokenizer.cc \
        $$QPDF_DIR/libqpdf/Pl_RC4.cc \
        $$QPDF_DIR/libqpdf/Pl_RunLength.cc \
        $$QPDF_DIR/libqpdf/Pl_SHA2.cc \
        $$QPDF_DIR/libqpdf/Pl_StdioFile.cc \
        $$QPDF_DIR/libqpdf/Pl_TIFFPredictor.cc \
        $$QPDF_DIR/libqpdf/QPDF.cc \
        $$QPDF_DIR/libqpdf/QPDFAcroFormDocumentHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFAnnotationObjectHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFCryptoProvider.cc \
        $$QPDF_DIR/libqpdf/QPDFExc.cc \
        $$QPDF_DIR/libqpdf/QPDFFormFieldObjectHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFMatrix.cc \
        $$QPDF_DIR/libqpdf/QPDFNameTreeObjectHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFNumberTreeObjectHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFObjGen.cc \
        $$QPDF_DIR/libqpdf/QPDFObject.cc \
        $$QPDF_DIR/libqpdf/QPDFObjectHandle.cc \
        $$QPDF_DIR/libqpdf/QPDFOutlineDocumentHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFOutlineObjectHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFPageDocumentHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFPageLabelDocumentHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFPageObjectHelper.cc \
        $$QPDF_DIR/libqpdf/QPDFSystemError.cc \
        $$QPDF_DIR/libqpdf/QPDFTokenizer.cc \
        $$QPDF_DIR/libqpdf/QPDFWriter.cc \
        $$QPDF_DIR/libqpdf/QPDFXRefEntry.cc \
        $$QPDF_DIR/libqpdf/QPDF_Array.cc \
        $$QPDF_DIR/libqpdf/QPDF_Bool.cc \
        $$QPDF_DIR/libqpdf/QPDF_Dictionary.cc \
        $$QPDF_DIR/libqpdf/QPDF_InlineImage.cc \
        $$QPDF_DIR/libqpdf/QPDF_Integer.cc \
        $$QPDF_DIR/libqpdf/QPDF_Name.cc \
        $$QPDF_DIR/libqpdf/QPDF_Null.cc \
        $$QPDF_DIR/libqpdf/QPDF_Operator.cc \
        $$QPDF_DIR/libqpdf/QPDF_Real.cc \
        $$QPDF_DIR/libqpdf/QPDF_Reserved.cc \
        $$QPDF_DIR/libqpdf/QPDF_Stream.cc \
        $$QPDF_DIR/libqpdf/QPDF_String.cc \
        $$QPDF_DIR/libqpdf/QPDF_encryption.cc \
        $$QPDF_DIR/libqpdf/QPDF_linearization.cc \
        $$QPDF_DIR/libqpdf/QPDF_optimization.cc \
        $$QPDF_DIR/libqpdf/QPDF_pages.cc \
        $$QPDF_DIR/libqpdf/QTC.cc \
        $$QPDF_DIR/libqpdf/QUtil.cc \
        $$QPDF_DIR/libqpdf/RC4.cc \
        $$QPDF_DIR/libqpdf/SecureRandomDataProvider.cc \
        $$QPDF_DIR/libqpdf/SparseOHArray.cc \
        $$QPDF_DIR/libqpdf/qpdf-c.cc

INCLUDEPATH += $$QPDF_DIR/libqpdf \
               $$QPDF_DIR/include

SOURCES += $$CRYPTO_OPENSSL \
           $$SRCS_libqpdf \
           $$QPDF_DIR/libqpdf/msvc_compatibility.cpp

# Now copy required includes files. We don't use qmake 'INSTALLS' because it simply
# doesn't work on windows (see INSTALL_ROOT), plus we don't want to interfere
# with existing system libs and includes.
INSTALL_INCLUDES_PATH = "$$PWD/include/qpdf"
mkpath($$INSTALL_INCLUDES_PATH)
INSTALL_INCLUDES_FILES += "$$QPDF_DIR/include/qpdf/*"

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
