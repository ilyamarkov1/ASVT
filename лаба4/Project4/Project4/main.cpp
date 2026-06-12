//#include <iostream>
//#include <iomanip>
//using namespace std;
//
//extern "C" void CalcY(float* x, float* y, int n, float start, float step);
//
//int main()
//{
//    const int n = 11;
//    float x[n];
//    float y[n];
//
//    float start = 0.0f;
//    float step = 0.1f;
//
//    CalcY(x, y, n, start, step);
//
//    cout << fixed << setprecision(6);
//    cout << " i\t x\t\t\t y = f(x)" << endl;
//    cout << "-----------------------------------------" << endl;
//
//    for (int i = 0; i < n; i++)
//    {
//        cout << i << "\t" << x[i] << "\t\t" << y[i] << endl;
//    }
//
//    return 0;
//}