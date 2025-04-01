# Windows tools for building Zero eLab Viewer

This repository hosts a stripped-down version of Qt 5.6.3 from
[here](https://download.qt.io/new_archive/qt/5.6/5.6.3/qt-opensource-windows-x86-mingw492-5.6.3.exe) and
FFTW 3.3.5 from [here](https://fftw.org/pub/fftw/fftw-3.3.5-dll32.zip).
These are used for the "legacy" build of Zero eLab Viewer.

To make the repository size reasonable, debug libraries were not
uploaded and the CMake files were modified to not reference them.
