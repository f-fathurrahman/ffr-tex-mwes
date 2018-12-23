from math import *

Npoints = 100
Xmin = -5.0
Xmax = 5.0

f = open("sin.dat", "w")
g = open("cos.dat", "w")
for i in range(Npoints):
    x = Xmin + i*(Xmax - Xmin)/(Npoints-1)
    print("%18.10f %18.10f" % (x,sin(x)), file=f)
    print("%18.10f %18.10f" % (x,cos(x)), file=g)

f.close()
g.close()



