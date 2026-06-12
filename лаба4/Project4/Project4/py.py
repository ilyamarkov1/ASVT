import ctypes

dll = ctypes.CDLL("./Project5.dll")

CalcY = dll.CalcY

CalcY.argtypes = [
    ctypes.POINTER(ctypes.c_float),
    ctypes.POINTER(ctypes.c_float),
    ctypes.c_int,
    ctypes.c_float,
    ctypes.c_float
]

CalcY.restype = None

n = 11
start = ctypes.c_float(0.0)
step = ctypes.c_float(0.1)

FloatArray = ctypes.c_float * n

x = FloatArray()
y = FloatArray()

CalcY(x, y, n, start, step)

print(" i\t x\t\t\t y = f(x)")
print("-----------------------------------------")

for i in range(n):
    print(f"{i}\t {x[i]:.6f}\t\t {y[i]:.6f}")