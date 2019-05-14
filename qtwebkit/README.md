# Building qtwebkit

## Installing qt 5.9.5
TODO

## Compiling qtwebkit

    mkdir -p WebKitBuild/Release
    cd WebKitBuild/Release
    cmake -DPORT=Qt -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/lib/x86_64-linux-gnu/qt5/5.9.5/gcc_64/ -DQt5_DIR=/usr/lib/x86_64-linux-gnu/qt5/5.9.5/gcc_64/lib/cmake/Qt5 ../.. 
    make -j2
    sudo make install
