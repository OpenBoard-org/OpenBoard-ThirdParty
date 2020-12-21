QT -= gui

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
unix {
    target.path = $$[QT_INSTALL_PLUGINS]/generic
}
!isEmpty(target.path): INSTALLS += target

TEMPLATE  = lib
CONFIG   += staticlib debug_and_release

QPDF_DIR = "xpdf-3.04"

unix {
    linux-g++ {
        CONFIG += create_prl
        SUB_LIB = "linux"
    }
    linux-g++-32 {
        CONFIG += create_prl
        SUB_LIB = "linux"
    }
    linux-g++-64 {
        CONFIG += create_prl
        SUB_LIB = "linux"
    }
    message ("Warning: This build is untested on linux. You should probably use the lib qpdf built-in for your system.")
}

macx {
    SUB_LIB = "macx"
    message ("Warning: This build is untested on MAC. You should probably use the lib provided with brew.")
}

win32 {
    CONFIG( debug, debug|release ) {
        SUB_LIB = "win32/debug"
    } else {
        SUB_LIB = "win32/release"
    }

    # OpenSSL requirement
    INCLUDEPATH += "$$PWD/../openssl/openssl-1.1.0-win64/include"

    # Lib JPEG requirement
    INCLUDEPATH += "$$PWD/../libjpeg-turbo/2.0.6/windows/include"
}

DESTDIR = "lib/$$SUB_LIB"

OBJECTS_DIR  = "objects"

macx {
    CONFIG += x86_64
    QMAKE_MACOSX_DEPLOYMENT_TARGET = "10.10"
}


QPDF_DIR = $$PWD/qpdf-10.0.4/src/


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
           $$SRCS_libqpdf
