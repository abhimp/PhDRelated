import matplotlib.pyplot as plt
import collections as cl
import sys
import numpy as np
import os

def getCMF(elements):
    x = [y for y in elements]

    x = np.array(x)
    mn = x.min()
    mx = x.max()

    x = (x - mn) / (mx - mn)

    x = np.around(x, decimals=3)


    freq = list(cl.Counter(x).items())
    freq.sort(key = lambda x:x[0])
    x,y = zip(*freq)
    s = sum(y)
    cum = np.cumsum(y)/s
    x = np.array(x)
    x = (x * (mx - mn)) + mn
    return x, cum

def main():
    print(sys.argv[1:])
    for f in sys.argv[1:]:
        with open(f) as fp:
            dt = [[float(x) for x in line.split()] for line in fp]
            entire = []
            for x in dt:
                entire += x[1::2]
            x, y = getCMF(entire)
            path = f.rsplit(".", 1)[0] + "_cmf.dat"
            with open(path, "w") as fp:
                for m in zip(x, y):
                    print(*m, file=fp)

if __name__ == "__main__":
    main()
