#include <math.h>

float fun_c(float x)
{
    float y;

    y = (tanf(x) + sinf(x)) / expf(x);

    return y;
}