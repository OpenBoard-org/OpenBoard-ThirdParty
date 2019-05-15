# Building qtwebkit

## Installing qt 5.9.5
You can install the qt 5.9.5 version using the "qt-unified" script provided by qt (https://www.qt.io/download-qt-installer)

Make sure to install qt 5.9.5 where we expect it to be in the next operations, or to set CMAKE_INSTALL_PREFIX and Qt5_DIR to your Qt installation location.
For the example, qt is installed in "/usr/lib/x86_64-linux-gnu/qt5/"

## Compiling qtwebkit

    mkdir -p WebKitBuild/Release
    cd WebKitBuild/Release
    cmake -DPORT=Qt -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/lib/x86_64-linux-gnu/qt5/5.9.5/gcc_64/ -DQt5_DIR=/usr/lib/x86_64-linux-gnu/qt5/5.9.5/gcc_64/lib/cmake/Qt5 ../.. 
    make -j2
    sudo make install



