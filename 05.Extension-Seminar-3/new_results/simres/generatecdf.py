
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
#     cmf = [(p * (mx - mn) + mn, float(sum(y[:i+1]))/s) for i, p in enumerate(x)]
    return x, cum

def main():
    for f in sys.argv[1:]:
        with open(f) as fp:
            dt = [[float(x) for x in line.split()] for line in fp]
            entire = []
            for x in dt:
                entire += x
            x, y = getCMF(entire)
            path = f.rsplit(".", 1)[0] + "_cmf.dat"
            with open(path, "w") as fp:
                for m in zip(x, y):
                    print(*m, file=fp)

if __name__ == "__main__":
    main()
