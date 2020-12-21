
// Because libjpeg is compiled with an older MSVC version, this issue arises.
// See https://stackoverflow.com/questions/30412951/unresolved-external-symbol-imp-fprintf-and-imp-iob-func-sdl2
#if defined(_MSC_VER) && (_MSC_VER >= 1900)

#include <stdio.h>

FILE _iob[] = {*stdin, *stdout, *stderr};

extern "C" FILE * __cdecl __iob_func(void)
{
    return _iob;
}
#endif //_MSC_VER
